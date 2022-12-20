package com.kh.young.supplement.contorller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Review;
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
	public String selectCategory(@RequestParam("cateName") String category, @RequestParam("cateNum") int cateNum,
								@RequestParam("page") int page, ModelAndView mv) {
		System.out.println("controller들어옴");
		ProCategory selectCate = pcService.selectCategory(cateNum);
		System.out.println(selectCate);
//		ArrayList<Review> reviewList = pcService.selectReview(cateNum);
		
		if(selectCate.getCateIcon() != null) {
			System.out.println("if문 들어옴");
			String[] splitIcon = selectCate.getCateIcon().split("/");
			selectCate.setIcon(splitIcon);
			
			for(int i = 0; i < splitIcon.length; i++) {
				System.out.println(selectCate.getIcon()[i]);
			}
		}
		return null;
	}
}
