package com.kh.young.shopping.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Reply;
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
	public String paymentView(@RequestParam("proNum") int proNum, @RequestParam("quantity") int quantity, Model model, HttpSession session) {
		System.out.println(proNum);
		System.out.println(quantity);
		
		Supplement paySupplement = shService.selectDetail(proNum);
		ArrayList<GeneralUser> gu = shService.selectGu(1);
		System.out.println(gu);
		
		model.addAttribute("paySupplement", paySupplement);
		model.addAttribute("quantity", quantity);

		// 주소 목록
		
		return "paymentView";
	}
	
	@RequestMapping(value="selectAddressList.sh", produces="text/plain;charset=UTF-8")
	public void selectAddressList(HttpSession session, HttpServletResponse response){
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Address> addressList = shService.selectAddressList(m.getUserNum());
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		
		try {
			gson.toJson(addressList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// insert Address
	@ResponseBody
	@RequestMapping("insertAddress.sh")
	public String insertAddress(@ModelAttribute Address a, HttpSession session) {
		System.out.println(a);
		Member m = (Member)session.getAttribute("loginUser");
		a.setUserNum(m.getUserNum());
		
		if(a.getAddressBasic().equals("Y")) {
			shService.updateBasicAll(m.getUserNum());
		}
		
		int insertYn = shService.insertAddress(a);
		
		String result = null;
		if(insertYn > 0) {
			result = "YES";
		}else {
			result = "NO";
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("updateAddress.sh")
	public String updateAddress(@ModelAttribute Address a, HttpSession session) {
		
		System.out.println("수정 주소 : " + a);
		Member m = (Member)session.getAttribute("loginUser");
		a.setUserNum(m.getUserNum());
		
		if(a.getAddressBasic().equals("Y")) {
			shService.updateBasicAll(m.getUserNum());
		}

		int updateYn = shService.updateAddress(a);
		
		String result = null;
		if(updateYn > 0) {
			result = "YES";
		}else {
			result = "NO";
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("deleteAddress.sh")
	public String deleteAddress(@RequestParam("addressNum") int addressNum) {
		
		int deleteYn = shService.deleteAddress(addressNum);
		
		String result = null;
		if(deleteYn > 0) {
			result = "YES";
		}else {
			result = "NO";
		}
		
		return result;
	}
	
}
