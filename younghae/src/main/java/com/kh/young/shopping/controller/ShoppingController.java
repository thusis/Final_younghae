package com.kh.young.shopping.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.service.ShoppingService;

@SessionAttributes("loginUser")
@Controller
public class ShoppingController {
	
	@Autowired
	private ShoppingService shService;
	
	// shopping main view
	@RequestMapping("shoppingMain.sh")
	public String shoppingMain(Model model) {
		
		ArrayList<Supplement> list = shService.selectSupplementList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < list.size(); i++) {
			String price = formatter.format(list.get(i).getProPrice());
			list.get(i).setFormatPrice(price);
		}
		model.addAttribute("supplementList", list);
		
		Member mem = shService.selectMember(1);
		model.addAttribute("loginUser", mem);
		
		return "shoppingMain";
	}
	
	// shopping all product view
	@RequestMapping("allView.sh")
	public String allView(Model model) {
		
		ArrayList<Supplement> allList = shService.selectSupplementList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < allList.size(); i++) {
			String price = formatter.format(allList.get(i).getProPrice());
			allList.get(i).setFormatPrice(price);
		}
		model.addAttribute("allList", allList);
		
		return "allView";
	}	
	
	
	// shopping trend view	
	@RequestMapping("trendView.sh")
	public String trendView(Model model) {
		
		ArrayList<Supplement> trendList = shService.selectTrendList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < trendList.size(); i++) {
			String price = formatter.format(trendList.get(i).getProPrice());
			trendList.get(i).setFormatPrice(price);
		}
		
		model.addAttribute("trendList", trendList);
		
		return "trendView";
	}
	
	// shopping bestseller view
	@RequestMapping("bestsellerView.sh")
	public String bestsellerView(Model model) {
		
		ArrayList<Supplement> bestsellerList = shService.selectBestsellerList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < bestsellerList.size(); i++) {
			String price = formatter.format(bestsellerList.get(i).getProPrice());
			bestsellerList.get(i).setFormatPrice(price);
		}
		
		model.addAttribute("bestsellerList", bestsellerList);
		
		return "bestsellerView";
	}
	
	
	@RequestMapping("supplementDetail.sh")
	public String supplementDetail(@RequestParam("proNum") int proNum, Model model,HttpSession session) {
		
		Supplement supplementDetail = shService.selectDetail(proNum);
		
		System.out.println(supplementDetail);
		DecimalFormat formatter = new DecimalFormat("###,###");
		String price = formatter.format(supplementDetail.getProPrice());
		supplementDetail.setFormatPrice(price);
		
		model.addAttribute("supplementDetail", supplementDetail);
		Member m = (Member)session.getAttribute("loginUser");
		model.addAttribute("user", m);
		return "shoppingDetails";
	}
	
	// Go to payment view
	@RequestMapping("payment.sh")
	public String paymentView(@RequestParam("proNum") int proNum, @RequestParam("quantity") int quantity, Model model) {
		System.out.println(proNum);
		System.out.println(quantity);
		
		Supplement paySupplement = shService.selectDetail(proNum);
		ArrayList<GeneralUser> gu = shService.selectGu(1);
		System.out.println(gu);
		
		model.addAttribute("paySupplement", paySupplement);
		model.addAttribute("quantity", quantity);
		
		
		return "paymentView";
	}
	
	
}
