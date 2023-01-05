package com.kh.young.shopping.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.Cart;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.OrderDetails;
import com.kh.young.model.vo.Orders;
import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.dto.GetPayInfoDTO;
import com.kh.young.shopping.dto.OrderListDTO;
import com.kh.young.shopping.dto.PaymentDTO;
import com.kh.young.shopping.dto.SupplementResp;
import com.kh.young.shopping.service.ShoppingService;

//@SessionAttributes("loginUser")
@Controller
public class ShoppingController {
	
	@Autowired
	private ShoppingService shService;
	
	// shopping main view
	@RequestMapping("shoppingMain.sh")
	public String shoppingMain(Model model) {
		
//		ArrayList<Supplement> list = shService.selectSupplementList();
		ArrayList<SupplementResp> list = shService.selectsuppleRespList();
		ArrayList<Supplement> trendList = shService.selectTrendList();
		ArrayList<Supplement> bestsellerList = shService.selectBestsellerList();
		
		model.addAttribute("supplementList", list);
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("trendList", trendList);
		
//		Member mem = shService.selectMember(1);
//		model.addAttribute("loginUser", mem);
		
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
	
	// 결제페이지 가기
	@RequestMapping("payment.sh")
	public String paymentView(@RequestParam(value="quantity", required=false) String[] quantity,
			Model model, HttpSession session, @RequestParam(value="proNumList",required=false) String[] proNumList) {

		System.out.println(Arrays.toString(proNumList));
		System.out.println(Arrays.toString(quantity));
		
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList<Address> basicAddress = shService.selectAddressList(m.getUserNum());
		
//		상품리스트
		GetPayInfoDTO getPayInfoDTO = new GetPayInfoDTO();
		ArrayList<PaymentDTO> infoList = new ArrayList<PaymentDTO>();
		int totalPrice = 0;
        for(int i = 0; i < proNumList.length; i++) {
            int proNum = Integer.parseInt(proNumList[i]);
            getPayInfoDTO.setProNum(proNum);
            getPayInfoDTO.setUserNum(m.getUserNum());
            System.out.println(getPayInfoDTO);
            
            PaymentDTO paymentList = shService.selectPayList(getPayInfoDTO);
            System.out.println(paymentList);
            
            if(quantity[i] != null) {
            	paymentList.getCart().setCartQuantity(Integer.parseInt(quantity[i]));
            	totalPrice += (paymentList.getCart().getSupplement().getProPrice() * Integer.parseInt(quantity[i]));
            }else {
            	totalPrice += (paymentList.getCart().getSupplement().getProPrice()) * (paymentList.getCart().getCartQuantity());
            }
            System.out.println(paymentList);
            infoList.add(paymentList);
        }
        System.out.println(infoList);
        System.out.println(totalPrice);
		
//      이벤트 포인트 조회
        
        ArrayList<Coupon> couponList = shService.selectCouponList(m.getUserNum());
        
		model.addAttribute("infoList", infoList);
		model.addAttribute("couponList", couponList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("basicAddress", basicAddress);
		
		return "paymentView";
	}
	
	@RequestMapping("selectAddressList.sh")
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
	
//	배송지 주소 수정
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
	
//	배송지 주소 삭제
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
	
//	장바구니 담기
	@ResponseBody
	@RequestMapping("insertCart.sh")
	public String insertCart(@ModelAttribute Cart c, HttpServletResponse response) throws Exception{
		int checkCart = shService.checkCart(c);
		
		String result = null;
		if(checkCart > 0) {
			result = "YES";
		}else{
			result = "NO";
			shService.insertCart(c);
		}
		
		return result;

	}
	
//	장바구니 수량 추가하기
	@ResponseBody
	@RequestMapping("addCartCount.sh")
	public String addCartCount(@ModelAttribute Cart c) {
		
		int cartCountYn = shService.addCartCount(c); 
		
		String result = null;
		if(cartCountYn > 0) {
			result = "YES";
		}else {
			result = "NO";
		}
		return result;
	}
	
	@RequestMapping("selectCartList.sh")
	public void selectCartList(@ModelAttribute Cart c, HttpServletResponse response) {
		ArrayList<Cart> cartList = shService.selectCartList(c);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();

		try {
			gson.toJson(cartList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("selectCartDetail.sh")
	public void selectCartDetail(@RequestParam("proNum") int proNum, HttpServletResponse response) {
		System.out.println(proNum);
		Supplement cartDetail = shService.selectDetail(proNum);
		System.out.println(cartDetail);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();

		try {
			gson.toJson(cartDetail, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("cartView.sh")
	public String cartView(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList<Cart> cartViewList = shService.selectCartViewList(m);
		System.out.println(cartViewList);
		
		model.addAttribute("cartViewList", cartViewList);
		
		return "myCart";
	}
	
	@ResponseBody
	@RequestMapping("updateCartQuantity.sh")
	public String updateCartQuantity(@ModelAttribute Cart c, HttpSession session) {
		System.out.println(c);
		Member m = (Member)session.getAttribute("loginUser");
		c.setUserNum(m.getUserNum());
		int updateCartQuantity = shService.updateCartQuantity(c);
		
		String result = null;
		if(updateCartQuantity>0) {
			result="YES";
		}else {
			result="NO";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("deleteSelectCart.sh")
	public String deleteSelectCart(	@RequestParam("deleteSelectList[]") List<String> cartNumList) {
		
		System.out.println(cartNumList);
        for(String cartNum : cartNumList) {
            int i = Integer.parseInt(cartNum);
            shService.delectSelectCart(i);
        }
        return "YES";
	}
	
	@RequestMapping("successPay.sh")
	public String successPay(@ModelAttribute Orders orders, @RequestParam(value="proNumList",required=false) String[] proNumList, 
			@RequestParam(value="quantityList",required=false) String[] quantityList, @RequestParam(value="proName",required=false) String[] proNames,
			@RequestParam(value="useCoupon",required=false) int couNum,
			Model model) {
		System.out.println("couNum : "+couNum);
		System.out.println(orders);
		System.out.println(Arrays.toString(proNumList));
		System.out.println(Arrays.toString(quantityList));
		
//		주문 테이블 insert
		int insertOrder = shService.insertOrders(orders);
		if(insertOrder > 0) {
			System.out.println("주문 인서트 성공");
		}else {
			System.out.println("주문 인서트 실패");
		}
		
		OrderDetails od = new OrderDetails();
		String orderCode = orders.getOrderCode();
		for(int i = 0; i < proNumList.length; i++) {
			int proNum = Integer.parseInt(proNumList[i]);
			String proName = proNames[i];
			int orderQuantity = Integer.parseInt(quantityList[i]);
			od.setOrderCode(orderCode);
			od.setProNum(proNum);
			od.setProName(proName);
			od.setOrderQuantity(orderQuantity);
			
			System.out.println(od);
			
			int insertOrderDetails = shService.insertOrderDetails(od);
			if(insertOrderDetails > 0) {
				System.out.println("주문상세 insert 성공");
			}else {
				System.out.println("주문상세 insert 실패");
			}
			
			int deleteCart = shService.deleteCart(proNum);
			if(deleteCart>0) {
				System.out.println("카트 삭제 성공");
			}else {
				System.out.println("카트 삭제 실패");
			}
			
		}
		ArrayList<OrderListDTO> orderList = shService.selectOrderList(orderCode);
		System.out.println(orderList);
		
		model.addAttribute("orderList", orderList);
		
		return "successPay";
	}
	
	@RequestMapping("searchCategory.sh")
	public void searchCategory(@RequestParam("search") String search, HttpServletResponse response) {
		System.out.println(search);
		ArrayList<Supplement> list = shService.searchList(search);
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < list.size(); i++) {
			String price = formatter.format(list.get(i).getProPrice());
			list.get(i).setFormatPrice(price);
		}
		
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
	
	
	@RequestMapping("cateView.sh")
	public String cateView(@RequestParam("proEffect") String proEffect, Model model){
		
		ArrayList<Supplement> cateList = shService.selectCateList(proEffect);
		
		model.addAttribute("cateList", cateList);
		model.addAttribute("proEffect", proEffect);
		
		return "cateView";
	}
	
	@ResponseBody
	@RequestMapping("useCoupon.sh")
	public Integer useCoupon(@RequestParam("couNum") int couNum) {
		int result = 0;
		if(couNum == 0) {
			result = 0;
		}else {
			Coupon cou = shService.selectUseCoupon(couNum);
			result = cou.getCouDiscount();
			System.out.println(cou);
		}
		return result;
	}
	
}
