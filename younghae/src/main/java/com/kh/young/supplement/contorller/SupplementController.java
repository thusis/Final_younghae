package com.kh.young.supplement.contorller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import com.kh.young.supplement.service.SupplementService;

@SessionAttributes("loginUser")
@Controller
public class SupplementController {

	@Autowired
	private SupplementService sService;
	
	@RequestMapping("category.su")
	public String AllCategoryList(@RequestParam(value="page", required=false) Integer page,HttpSession session, Model model) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		Member mem = (Member)session.getAttribute("loginUser");
	      
		int listCount = sService.getListCount(1);
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 12);
		ArrayList<ProCategory> all = sService.allCategory(pi);
		
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
								@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		int currentPage = 1;
		
		if (page != null) {
			currentPage = page;
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		
		System.out.println("controller들어옴");
		ProCategory selectCate = sService.selectCategory(cateNum);
		
		ArrayList<Supplement> product = sService.selectCateProduct(cateNum);
		

		int listCount = sService.getReviewListCount(cateNum);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Review> reviewList = sService.selectReview(cateNum, pi);
		
		for(int i =  0; i < reviewList.size(); i++) {
			Member mber = sService.selectMember(reviewList.get(i).getUserNum());
			Attachment image= sService.imageSelect(reviewList.get(i).getRvNum());

			if(image == null) {
				reviewList.get(i).setImage("없음");
			}else {
				reviewList.get(i).setImage(image.getAttachRename());
			}
			reviewList.get(i).setUserNickname(mber.getUserNickname());
		}
		
		if(selectCate.getCateIcon() != null) {
			System.out.println("if문 들어옴");
			String[] splitIcon = selectCate.getCateIcon().split("/");
			selectCate.setIcon(splitIcon);
			
			for(int i = 0; i < splitIcon.length; i++) {
				System.out.println(selectCate.getIcon()[i]);
			}
		}
		
		for(int i = 0; i< reviewList.size();  i++) {
			System.out.println(reviewList.get(i).getImage());
		}
		
		mv.addObject("reviewCount", listCount);
		mv.addObject("c", selectCate);
		mv.addObject("product", product);
		mv.addObject("review", reviewList);
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
		
		ArrayList<Supplement> product = sService.selectCateProduct(cateNum);
		
		int listCount = product.size();

		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 9);
		
		
		if(product != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("cateNum", cateNum);
			model.addAttribute("cateName", cateName);
			model.addAttribute("product", product);
			
		}
		return "product_More";
	}
	
	@RequestMapping("selectProduct.su")
	public ModelAndView selectProduct(@RequestParam("proNum") int proNum, ModelAndView mv
			,HttpSession session
			) {
		Supplement product = sService.selectPro(proNum);
		Member m = (Member)session.getAttribute("loginUser");
		
		if(product != null) {
			mv.addObject("product", product);
			mv.addObject("loginUser", m);
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
		
		int result = 0;
		int attmResult = 0;
		
		result = sService.insertReview(r);

		if (file != null) {
			System.out.println(file.getOriginalFilename());
			if(!file.getOriginalFilename().equals("")) {
				String[] returnArr = saveFile(file, request);
				
				attm.setAttachName(file.getOriginalFilename());
				attm.setAttachRename(returnArr[1]);
				attm.setAttachPath(returnArr[0]);
				System.out.println(returnArr[1]);
				System.out.println(returnArr[0]);
				
				attmResult = sService.insertReviewAttm(attm);
			}
		}else {
			r.setImage("없음");
		}
				
		Supplement product = sService.selectPro(r.getProNum());

		if (result + attmResult > 0) {
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
//		System.out.println("조회 정보 " + r);
		Review review = sService.checkReview(r);
		
//		System.out.println("checkReview : " + review);
		
		
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
	
	@RequestMapping("reviewList.su")
	public void reviewList(@RequestParam("proNum") int proNum, HttpServletResponse response) {
//		System.out.println("조회 정보 " + proNum);
		ArrayList<Review> review = sService.reviewList(proNum);
		
		for(int i =  0; i < review.size(); i++) {
			Member m = sService.selectMember(review.get(i).getUserNum());
			Attachment image= sService.imageSelect(review.get(i).getRvNum());

			if(image == null) {
				review.get(i).setImage("없음");
			}else {
				review.get(i).setImage(image.getAttachRename());
			}
			review.get(i).setUserNickname(m.getUserNickname());
		}
		
//		System.out.println("checkReview : " + review);
		
		
		
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
	
	@RequestMapping("rateUpdate.su")
	public void rateUpdate(@ModelAttribute Supplement product, HttpServletResponse response) {
		int result = sService.rateUpdate(product);
	}
	
	@RequestMapping("reviewMore.su")
	public String reviewMore(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value="cateNum", required=false) int cateNum, @RequestParam(value="cateName", required=false) String cateName, Model model) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}


		int listCount = sService.getReviewListCount(cateNum);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Review> reviewList = sService.selectReview(cateNum, pi);
		
		for(int i =  0; i < reviewList.size(); i++) {
			Member m = sService.selectMember(reviewList.get(i).getUserNum());
			Attachment image= sService.imageSelect(reviewList.get(i).getRvNum());

			if(image == null) {
				reviewList.get(i).setImage("없음");
			}else {
				reviewList.get(i).setImage(image.getAttachRename());
			}
			reviewList.get(i).setUserNickname(m.getUserNickname());
		}

		if (reviewList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("cateNum", cateNum);
			model.addAttribute("cateName", cateName);
			model.addAttribute("review", reviewList);
		}
		return "review_More";
	}
	
	@RequestMapping("searchCategory.su")
	public void searchCategory(@RequestParam("search") String search, HttpServletResponse response) {
		System.out.println(search);
		
		ArrayList<ProCategory> list = sService.searchList(search);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		// 시간 형식 지정해주기 
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateReview.su")
	public String updateReview(@ModelAttribute Review r, @RequestParam(value="file", required=false) MultipartFile file, Model model,
								HttpServletRequest request, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		System.out.println(file);
		
		String select = sService.imageSelect(r.getRvNum()).getAttachRename();
		
		int result = 0;
		
		System.out.println(select);
		
//		result = sService.insertReview(r);
		
		return null;
//		if (file != null) {
//			if(!select.contains(file.get)) {
//				System.out.println(file.getOriginalFilename());
//				if(!file.getOriginalFilename().equals("")) {
//					String[] returnArr = saveFile(file, request);
//					
//					attm.setAttachName(file.getOriginalFilename());
//					attm.setAttachRename(returnArr[1]);
//					attm.setAttachPath(returnArr[0]);
//					System.out.println(returnArr[1]);
//					System.out.println(returnArr[0]);
//					
//					attmResult = sService.insertReviewAttm(attm);
//				}
//			}
//		}else {
//			r.setImage("없음");
//		}
//				
//		Supplement product = sService.selectPro(r.getProNum());
//
//		if (result + attmResult > 0) {
//			model.addAttribute("product", product);
//			model.addAttribute("loginUser", m);
//			return "product_Detail";
//		} else {
//			throw new SupplementException("updateReview 혹은 updateReviewAttm 오류");
//		}
	}
	
	@RequestMapping("reco.su")
	public void reco(@RequestParam("rvNum") int rvnum, @RequestParam("userNum") int usernum, @RequestParam("check") String check) {
		Review r = new Review();
		System.out.println(check);
		
		r.setRvNum(rvnum);
		r.setUserNum(usernum);
		
		
		
		
		
		System.out.println(r);
		
		int result = 0;
		int result1 = 0;
		if(check.equals("R")) {
			System.out.println("인서트");
			result = sService.insertReco(r);
			result1 = sService.updateReviewCount(r);
			
		}else if(check.equals("D")) {
			System.out.println("삭제");
			result = sService.deleteReco(r);
			result1 = sService.deleteReviewCount(r);
		}
	}
	
	@RequestMapping("searchPage.su")
	public String searchPage() {
		return "search_category";
	}
	
//	=============================================== 관리자 ==========================================================================
	@ResponseBody
	@RequestMapping("adminReviewList.su")
	public HashMap<String, Object> adminReviewList(@RequestParam(value="page", required=false) Integer page,  HttpServletResponse response,
									@RequestParam(value="check", required=false) String check) {
		System.out.println("check : " + check);
		
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int reviewCount = sService.adminReviewListCount();
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, reviewCount, 10);
		
		ArrayList<Review> r = new ArrayList<Review>();
		
		if(check == null) {
			r = sService.adminReviewListN(pi, 1);
		}else {
			if(check.contains("Name")) {
				r = sService.adminReviewListNa(pi, 1);
			}else if(check.contains("Number")){
				r = sService.adminReviewListN(pi, 1);
			}else if(check.contains("Good")){
				r = sService.adminReviewListG(pi, 1);
			}
		}
		
		System.out.println(r);
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("r", r);
		map.put("pi",  pi);
		map.put("listCount", reviewCount);
		
		return map;
	}
	
	@RequestMapping("goAdminReviewList.su")
	public void goAdminReviewList(@RequestParam("page") int page, Model model) {
		adminReviewList(page, null, null);
	}
	
	@RequestMapping("AdminReview.su")
	public String AdminReview() {
		return "admin_ReviewPage";
	}
	
	@RequestMapping("insertPage.su")
	public String insertProductPage() {
		return "insertProduct";
	}
	
	@RequestMapping("insertProduct.su")
	public String insertProduct(@ModelAttribute Supplement supple) {
		System.out.println(supple);
		
//		int result = sService.insertProduct(supple);
		
//		if(result > 0) {
//			return "redirect:insertPage.su";
//		}else {
//			throw new SupplementException("insertProduct 오류");
//		}
		return null;
	}
}
