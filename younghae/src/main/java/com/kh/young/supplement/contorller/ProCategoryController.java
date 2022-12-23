package com.kh.young.supplement.contorller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Review;
import com.kh.young.model.vo.Supplement;
import com.kh.young.supplement.exception.SupplementException;
import com.kh.young.supplement.service.ProCategoryService;

@SessionAttributes("loginUser")
@Controller
public class ProCategoryController {

	@Autowired
	private ProCategoryService pcService;
	
	@RequestMapping("category.su")
	public String AllCategoryList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		Member mem = pcService.selectMember(8);
	      
		int listCount = pcService.getListCount();
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 12);
		ArrayList<ProCategory> all = pcService.allCategory(pi);
		
		if(all != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", all);
			model.addAttribute("loginUser", mem);
			
			return "category";
		}else {
			throw new SupplementException("supplement오류");
		}
	}
	
	@RequestMapping("selectCategory.su")
	public ModelAndView selectCategory(@RequestParam("cateName") String category, @RequestParam("cateNum") int cateNum,
								@RequestParam("page") int page, ModelAndView mv, HttpSession session) {
		System.out.println("controller들어옴");
		ProCategory selectCate = pcService.selectCategory(cateNum);
		System.out.println(selectCate);
		
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Supplement> product = pcService.selectCateProduct(cateNum);
		
//		ArrayList<Review> reviewList = pcService.selectReview(cateNum);
		
		if(selectCate.getCateIcon() != null) {
			System.out.println("if문 들어옴");
			String[] splitIcon = selectCate.getCateIcon().split("/");
			selectCate.setIcon(splitIcon);
			
			for(int i = 0; i < splitIcon.length; i++) {
				System.out.println(selectCate.getIcon()[i]);
			}
		}
		mv.addObject("c", selectCate);
		mv.addObject("product", product);
		mv.addObject("loginUser", m);
		mv.setViewName("category_select");
		return mv;
	}
	
	@RequestMapping("productMore.su")
	public String productMore(@RequestParam(value="page", required=false) Integer page,
								@RequestParam("cateNum") int cateNum, @RequestParam("cateName") String cateName,Model model) {
		int currentPage = 1;
				
		if(page != null) {
			currentPage = page;
		}
		
		ArrayList<Supplement> product = pcService.selectCateProduct(cateNum);
		
		int listCount = product.size();

		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 9);
		
		
		if(product != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("cateName", cateName);
			model.addAttribute("product", product);
			
		}
		return "product_More";
	}
	
	@RequestMapping("selectProduct.su")
	public ModelAndView selectProduct(@RequestParam("proNum") int proNum, ModelAndView mv
//			,HttpSession session
			) {
		Supplement product = pcService.selectPro(proNum);
//		Member m = (Member)session.getAttribute("loginUser");
		
		if(product != null) {
			mv.addObject("product", product);
//			mv.addObject("loginUser", m);
			mv.setViewName("product_Detail");
		}
		return mv;
	}
	
	@RequestMapping("insertReview.su")
	public String insertReview(@ModelAttribute Review r, @RequestParam("file") MultipartFile file, Model model,
								HttpServletRequest request, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		System.out.println(file);
		Attachment attm = new Attachment();

		if (file != null) {
			System.out.println(file.getOriginalFilename());
			if(!file.getOriginalFilename().equals("")) {
				String[] returnArr = saveFile(file, request);
				
				attm.setAttachName(file.getOriginalFilename());
				attm.setAttachRename(returnArr[1]);
				attm.setAttachPath(returnArr[0]);
				System.out.println(returnArr[1]);
				System.out.println(returnArr[0]);
			}
		}
		int result = pcService.insertReview(r);
				
		int attmResult = pcService.insertReviewAttm(attm);

		Supplement product = pcService.selectPro(r.getProNum());

		if (result + attmResult > 1) {
			model.addAttribute("product", product);
			model.addAttribute("loginUser", m);
			return "product_Detail";
		} else {
			throw new SupplementException("insertReview 혹은 insertReviewAttm 오류");
		}
	}

	// attm Save
	// saveFile 메소드 만들기
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
//				\\는 \를 의미함

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
			// folder가 존재하지 않으면 make directory 폴더를 만들어줘
		}

		// 파일 저장소(물리적으로)에 저장할 수 있게끔 하는 코드
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);
		// 파일명 변경
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
				+ originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 :" + e.getMessage());
		}

		String[] returnArr = new String[2];

		returnArr[0] = savePath;
		returnArr[1] = renameFileName;

		return returnArr;
	}

	// deleteFile 메소드 만들기
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		File f = new File(savePath + "\\" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("checkReview.su")
	public void checkReview(@ModelAttribute Review r, HttpServletResponse response) {
		System.out.println("조회 정보 " + r);
		Review review = pcService.checkReview(r);
		
		System.out.println("checkReview" + review);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		// 시간 형식 지정해주기 
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(review, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
}
