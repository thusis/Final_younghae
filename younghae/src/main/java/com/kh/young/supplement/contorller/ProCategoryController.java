package com.kh.young.supplement.contorller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Review;
import com.kh.young.model.vo.Supplement;
import com.kh.young.supplement.exception.SupplementException;
import com.kh.young.supplement.service.ProCategoryService;

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
		
		int listCount = pcService.getListCount();
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 12);
		ArrayList<ProCategory> all = pcService.allCategory(pi);
		
		if(all != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", all);
			
			return "category";
		}else {
			throw new SupplementException("supplement오류");
		}
	}
	
	@RequestMapping("selectCategory.su")
	public ModelAndView selectCategory(@RequestParam("cateName") String category, @RequestParam("cateNum") int cateNum,
								@RequestParam("page") int page, ModelAndView mv) {
		System.out.println("controller들어옴");
		ProCategory selectCate = pcService.selectCategory(cateNum);
		System.out.println(selectCate);
		
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
	public ModelAndView selectProduct(@RequestParam("proNum") int proNum, ModelAndView mv) {
		Supplement product = pcService.selectPro(proNum);
		
		if(product != null) {
			mv.addObject("product", product);
			mv.setViewName("product_Detail");
		}
		
		return mv;
	}
	
	@RequestMapping("insertReview.su")
	public String insertReview(@ModelAttribute Review r, @RequestParam("file") MultipartFile file, Model model) {
		int result = pcService.insertReview(r);
		
		System.out.println(file);
		
		Supplement product = pcService.selectPro(r.getProNum());
		
		if(result > 0) {
			model.addAttribute("product", product);
			return "product_Detail";
		}else {
			throw new SupplementException("insertReview오류");
		}
	}
}
