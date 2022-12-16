package com.kh.young.supplement.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.young.supplement.service.SupplementService;

@Controller
public class SupplementController {
	
	@Autowired
	private SupplementService sService;
	
	
}
