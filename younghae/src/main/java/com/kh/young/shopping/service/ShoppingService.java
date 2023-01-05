package com.kh.young.shopping.service;


import java.util.ArrayList;

import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.Cart;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.OrderDetails;
import com.kh.young.model.vo.Orders;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.dto.GetPayInfoDTO;
import com.kh.young.shopping.dto.OrderListDTO;
import com.kh.young.shopping.dto.PaymentDTO;
import com.kh.young.shopping.dto.SupplementResp;

public interface ShoppingService {

	Member selectMember(int i);
	ArrayList<GeneralUser> selectGu(int i);
	
	ArrayList<Supplement> selectSupplementList();

	ArrayList<Supplement> selectTrendList();

	ArrayList<Supplement> selectBestsellerList();

	Supplement selectDetail(int proNum);
	
	int insertAddress(Address a);
	
	ArrayList<Address> selectAddressList(int userNum);
	
	int updateAddress(Address a);
	
	void updateBasicAll(int userNum);
	
	int deleteAddress(int addressNum);
	
	int insertCart(Cart c);
	
	ArrayList<Cart> selectCartList(Cart c);
	
	int checkCart(Cart c);
	
	int addCartCount(Cart c);
	
	ArrayList<Cart> selectCartViewList(Member m);
	
	int updateCartQuantity(Cart c);
	
	void delectSelectCart(int i);
	
	PaymentDTO selectPayList(GetPayInfoDTO getPayInfoDTO);
	
	ArrayList<Coupon> selectCouponList(int userNum);
	
	int insertOrders(Orders orders);
	
	int deleteCart(int proNum);
	
	int insertOrderDetails(OrderDetails od);
	
	ArrayList<OrderListDTO> selectOrderList(String orderCode);
	
	ArrayList<Supplement> searchList(String search);
	
	ArrayList<Supplement> selectCateList(String proEffect);
	
	Coupon selectUseCoupon(int couNum);
	ArrayList<SupplementResp> selectsuppleRespList();
	
	



}
