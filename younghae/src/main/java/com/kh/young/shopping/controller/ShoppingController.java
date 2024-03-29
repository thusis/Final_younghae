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
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Cart;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.OrderDetails;
import com.kh.young.model.vo.Orders;
import com.kh.young.model.vo.Point;
import com.kh.young.model.vo.Review;
import com.kh.young.model.vo.Supplement;
import com.kh.young.model.vo.Zzim;
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
	public String shoppingMain(Model model, HttpSession session) {
		
//		ArrayList<Supplement> list = shService.selectSupplementList();
		ArrayList<SupplementResp> list = shService.selectsuppleRespList();
		ArrayList<SupplementResp> trendList = shService.selectsuppleRespTrendList();
		ArrayList<SupplementResp> bestsellerList = shService.selectsuppleRespBestsellerList();
		
		Member m = (Member)session.getAttribute("loginUser");
		
		for(int i = 0; i < list.size(); i ++) {
			if(m != null) {
				SupplementResp s = shService.checkZzim(list.get(i));
	             if(shService.checkZzim(list.get(i)) != null) {
	                if(list.get(i).getProNum() == s.getZzim().getProNum() && m.getUserNum() == s.getZzim().getUserNum()) {
	                	list.get(i).setCheck("Y");
	                }
	             }else {
	            	 	list.get(i).setCheck("N");
	             }
			}
		}
		
		for(int i = 0; i < trendList.size(); i ++) {
			if(m != null) {
				SupplementResp s = shService.checkZzim(trendList.get(i));
	             if(shService.checkZzim(trendList.get(i)) != null) {
	                if(trendList.get(i).getProNum() == s.getZzim().getProNum() && m.getUserNum() == s.getZzim().getUserNum()) {
	                	trendList.get(i).setCheck("Y");
	                }
	             }else {
	            	 trendList.get(i).setCheck("N");
	             }
			}
		}
		
		
		for(int i = 0; i < bestsellerList.size(); i ++) {
			if(m != null) {
				SupplementResp s = shService.checkZzim(bestsellerList.get(i));
	             if(shService.checkZzim(bestsellerList.get(i)) != null) {
	                if(bestsellerList.get(i).getProNum() == s.getZzim().getProNum() && m.getUserNum() == s.getZzim().getUserNum()) {
	                	bestsellerList.get(i).setCheck("Y");
	                }
	             }else {
	            	 bestsellerList.get(i).setCheck("N");
	             }
			}
		}
		
		ArrayList<String> cateTrend = shService.selectCateTrend();
				
		model.addAttribute("supplementList", list);
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("trendList", trendList);
		model.addAttribute("cateTrend", cateTrend);
		
		return "shoppingMain";
	}
	
	// shopping all product view
	@RequestMapping("allView.sh")
	public String allView(Model model, HttpSession session) {
		
		ArrayList<SupplementResp> allList = shService.selectsuppleRespList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < allList.size(); i++) {
			String price = formatter.format(allList.get(i).getProPrice());
			allList.get(i).setFormatPrice(price);
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		
		for(int i = 0; i < allList.size(); i ++) {
			if(m != null) {
				SupplementResp s = shService.checkZzim(allList.get(i));
	             if(shService.checkZzim(allList.get(i)) != null) {
	                if(allList.get(i).getProNum() == s.getZzim().getProNum() && m.getUserNum() == s.getZzim().getUserNum()) {
	                	allList.get(i).setCheck("Y");
	                }
	             }else {
	            	 allList.get(i).setCheck("N");
	             }
			}
		}
		
		ArrayList<String> cateTrend = shService.selectCateTrend();
		model.addAttribute("allList", allList);
		model.addAttribute("cateTrend", cateTrend);
		
		return "allView";
	}	
	
	
	// shopping trend view	
	@RequestMapping("trendView.sh")
	public String trendView(Model model, HttpSession session) {
		
		ArrayList<SupplementResp> trendList = shService.selectsuppleRespTrendList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < trendList.size(); i++) {
			String price = formatter.format(trendList.get(i).getProPrice());
			trendList.get(i).setFormatPrice(price);
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		for(int i = 0; i < trendList.size(); i ++) {
			if(m != null) {
				SupplementResp s = shService.checkZzim(trendList.get(i));
	             if(shService.checkZzim(trendList.get(i)) != null) {
	                if(trendList.get(i).getProNum() == s.getZzim().getProNum() && m.getUserNum() == s.getZzim().getUserNum()) {
	                	trendList.get(i).setCheck("Y");
	                }
	             }else {
	            	 trendList.get(i).setCheck("N");
	             }
			}
		}
		
		
		ArrayList<String> cateTrend = shService.selectCateTrend();
		
		model.addAttribute("trendList", trendList);
		model.addAttribute("cateTrend", cateTrend);
		
		return "trendView";
	}
	
	// shopping bestseller view
	@RequestMapping("bestsellerView.sh")
	public String bestsellerView(Model model, HttpSession session) {
		
		ArrayList<SupplementResp> bestsellerList = shService.selectsuppleRespBestsellerList();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(int i = 0; i < bestsellerList.size(); i++) {
			String price = formatter.format(bestsellerList.get(i).getProPrice());
			bestsellerList.get(i).setFormatPrice(price);
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		
		for(int i = 0; i < bestsellerList.size(); i ++) {
			if(m != null) {
				SupplementResp s = shService.checkZzim(bestsellerList.get(i));
	             if(shService.checkZzim(bestsellerList.get(i)) != null) {
	                if(bestsellerList.get(i).getProNum() == s.getZzim().getProNum() && m.getUserNum() == s.getZzim().getUserNum()) {
	                	bestsellerList.get(i).setCheck("Y");
	                }
	             }else {
	            	 bestsellerList.get(i).setCheck("N");
	             }
			}
		}
		
		
		ArrayList<String> cateTrend = shService.selectCateTrend();
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("cateTrend", cateTrend);
		
		return "bestsellerView";
	}
	
	
	@RequestMapping("supplementDetail.sh")
	public String supplementDetail(@RequestParam("proNum") int proNum, Model model,HttpSession session) {
		
		SupplementResp supplementDetail = shService.selectDetail(proNum);
		
		System.out.println(supplementDetail);
		DecimalFormat formatter = new DecimalFormat("###,###");
		String price = formatter.format(supplementDetail.getProPrice());
		supplementDetail.setFormatPrice(price);
		
		ArrayList<Review> rv = shService.selectReview(proNum);
		
		for(int i =  0; i < rv.size(); i++) {
			Member m = shService.selectMember(rv.get(i).getUserNum());
			Attachment image= shService.imageSelect(rv.get(i).getRvNum());

			if(image == null) {
				rv.get(i).setImage("없음");
			}else {
				rv.get(i).setImage(image.getAttachRename());
			}
			rv.get(i).setUserNickname(m.getUserNickname());
		}
		
		int listCount = shService.getReviewListCount(proNum);
		
		Member mem = (Member)session.getAttribute("loginUser");
		
		if(mem != null) {
			SupplementResp s = shService.checkZzim(supplementDetail);
             if(shService.checkZzim(supplementDetail) != null) {
                if(supplementDetail.getProNum() == s.getZzim().getProNum() && mem.getUserNum() == s.getZzim().getUserNum()) {
                	supplementDetail.setCheck("Y");
                }
             }else {
            	 supplementDetail.setCheck("N");
             }
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		model.addAttribute("supplementDetail", supplementDetail);
		model.addAttribute("user", m);
		model.addAttribute("review", rv);
		model.addAttribute("reviewCount", listCount);
		
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
		SupplementResp cartDetail = shService.selectDetail(proNum);
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
			@RequestParam(value="useCoupon",required=false) Integer couNum, @RequestParam(value="usedPointAmount", required=false) Integer usedPointAmount,
			HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
//		주문 테이블 insert
		ArrayList<OrderListDTO> orderList = null;
		int insertOrder = shService.insertOrders(orders);
		if(insertOrder > 0) {
			OrderDetails od = new OrderDetails();
			String orderCode = orders.getOrderCode();
			
//			주문 상세 insert
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
			orderList = shService.selectOrderList(orderCode);
			if(couNum != null) {
				int updateCoupon = shService.updateCoupon(couNum);
				if(updateCoupon>0) {
					System.out.println("쿠폰 사용 수정 성공");
				}else {
					System.out.println("쿠폰 사용 수정 실패");
				}
			}
			
			if(usedPointAmount != null) {
				Point p = new Point();
				p.setPointAmount("-"+usedPointAmount);
				p.setUserNum(m.getUserNum());
				
				int insertPoint = shService.insertUsedPointAmount(p);
				if(insertPoint>0) {
					System.out.println("포인트 사용내역 insert 성공");
				}else {
					System.out.println("포인트 사용내역 insert 실패");
				}
				
				m.setUserPoint(usedPointAmount);
				int updateMemberPoint = shService.updateMemberPoint(m);
				
				if(updateMemberPoint>0) {
					System.out.println("포인트 사용내역 업데이트 성공");
				}else {
					System.out.println("포인트 사용내역 업데이트 실패");
				}
			}
		}else {
			System.out.println("주문 인서트 실패");
		}
		
		
		
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
	public String cateView(@RequestParam("proEffect") String proEffect, Model model, HttpSession session){
		
		ArrayList<SupplementResp> cateList = shService.selectsuppleRespBestCateList(proEffect);
		
		Member m = (Member)session.getAttribute("loginUser");
		
		for(int i = 0; i < cateList.size(); i ++) {
			if(m != null) {
				SupplementResp s = shService.checkZzim(cateList.get(i));
	             if(shService.checkZzim(cateList.get(i)) != null) {
	                if(cateList.get(i).getProNum() == s.getZzim().getProNum() && m.getUserNum() == s.getZzim().getUserNum()) {
	                	cateList.get(i).setCheck("Y");
	                }
	             }else {
	            	 cateList.get(i).setCheck("N");
	             }
			}
		}
		ArrayList<String> cateTrend = shService.selectCateTrend();
		
		model.addAttribute("cateList", cateList);
		model.addAttribute("proEffect", proEffect);
		model.addAttribute("cateTrend", cateTrend);
		
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
	
	@RequestMapping("searchIngredient.sh")
	public void searchIngredient(@RequestParam("search") String search, HttpServletResponse response) {
		System.out.println(search);
		ArrayList<Supplement> list = shService.searchIngredientList(search);
		
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
	
	@ResponseBody
	@RequestMapping("insertZzim.sh")
	public Integer insertZzim(@ModelAttribute Zzim zim, @RequestParam("check") String check) {
		System.out.println(zim);
		
		int result = 0;
		
		if (check.equals("N")) {
			System.out.println("delete 들어옴");
			result = shService.deleteZzim(zim);
		} else if (check.equals("Y")) {
			System.out.println("insert 들어옴");
			result = shService.insertZzim(zim);
		}
		
		return result;
	}	
}

