package com.kh.young.supplement.contorller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.supplement.service.ProCategoryService;

@Controller
public class ProCategoryController {

	@Autowired
	private ProCategoryService pcService;
	
	@RequestMapping("AllCategory.su")
	public String AllCategoryLis(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = pcService.getListCount();
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<ProCategory> all = pcService.allCategory(pi);
		
		if(all != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", all);
			
			return "category";
		}else {
			return null;
		}
	}
}
