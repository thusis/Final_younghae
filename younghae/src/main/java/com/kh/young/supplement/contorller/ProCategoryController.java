package com.kh.young.supplement.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.young.supplement.service.ProCategoryService;

@Controller
public class ProCategoryController {

	@Autowired
	private ProCategoryService pcService;
}
