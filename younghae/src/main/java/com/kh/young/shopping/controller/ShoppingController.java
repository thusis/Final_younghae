package com.kh.young.shopping.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.service.ShoppingService;

@Controller
public class ShoppingController {
	
	@Autowired
	private ShoppingService shService;
	
	@RequestMapping("shoppingMain.sh")
	public String shoppingMain(Model model) {
		
		ArrayList<Supplement> list = shService.selectSupplementList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < list.size(); i++) {
			String price = formatter.format(list.get(i).getProPrice());
			list.get(i).setFormatPrice(price);
		}
		model.addAttribute("supplementList", list);
		
		return "shoppingMain";
	}
	
	@RequestMapping("trendView.sh")
	public String trendView() {
		
		ArrayList<Supplement> trendList = shService.selectTrendList();
		
		return "trendView";
	}
	
}
