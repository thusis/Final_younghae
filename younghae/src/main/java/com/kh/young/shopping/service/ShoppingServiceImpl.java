package com.kh.young.shopping.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.Cart;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.OrderDetails;
import com.kh.young.model.vo.Orders;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.dao.ShoppingDAO;
import com.kh.young.shopping.dto.GetPayInfoDTO;
import com.kh.young.shopping.dto.OrderListDTO;
import com.kh.young.shopping.dto.PaymentDTO;
import com.kh.young.shopping.dto.SupplementResp;

@Service("shService")
public class ShoppingServiceImpl implements ShoppingService{

	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private ShoppingDAO shDAO;
	
	@Override
	public Member selectMember(int i) {
		return shDAO.selectMember(sqlSession, i);
	}
	
	@Override
	public ArrayList<GeneralUser> selectGu(int i) {
		return shDAO.selectGu(sqlSession, i);
	}
	
	
	@Override
	public ArrayList<Supplement> selectSupplementList() {
		return shDAO.selectSupplementList(sqlSession);
	}

	@Override
	public ArrayList<Supplement> selectTrendList() {
		return shDAO.selectTrendList(sqlSession);
	}

	@Override
	public ArrayList<Supplement> selectBestsellerList() {
		return shDAO.selectBestsellerList(sqlSession);
	}
	
	
	@Override
	public Supplement selectDetail(int proNum) {
		return shDAO.selectDetail(sqlSession, proNum);
	}
	
	@Override
	public int insertAddress(Address a) {
		return shDAO.insertAddress(sqlSession, a);
	}
	
	@Override
	public ArrayList<Address> selectAddressList(int userNum) {
		return shDAO.selectAddressList(sqlSession, userNum);
	}
	
	@Override
	public int updateAddress(Address a) {
		return shDAO.updateAddress(sqlSession, a);
	}
	
	@Override
	public void updateBasicAll(int userNum) {
		shDAO.updateBasicAll(sqlSession, userNum);
	}
	
	@Override
	public int deleteAddress(int addressNum) {
		return shDAO.deleteAddress(sqlSession, addressNum);
	}
	
	@Override
	public int insertCart(Cart c) {
		return shDAO.insertCart(sqlSession, c);
	}
	
	@Override
	public ArrayList<Cart> selectCartList(Cart c) {
		return shDAO.selectCartList(sqlSession, c);
	}
	
	@Override
	public int checkCart(Cart c) {
		return shDAO.checkCart(sqlSession, c);
	}
	
	@Override
	public int addCartCount(Cart c) {
		return shDAO.addCartCount(sqlSession, c);
	}
	
	@Override
	public ArrayList<Cart> selectCartViewList(Member m) {
		return shDAO.selectCartViewList(sqlSession, m);
	}
	
	@Override
	public int updateCartQuantity(Cart c) {
		return shDAO.updateCartQuantity(sqlSession, c);
	}
	
	@Override
	public void delectSelectCart(int i) {
		shDAO.deleteSelectCart(sqlSession, i);
	}
	
	@Override
	public PaymentDTO selectPayList(GetPayInfoDTO getPayInfoDTO) {
		return shDAO.selectPayList(sqlSession, getPayInfoDTO);
	}
	
	@Override
	public ArrayList<Coupon>  selectCouponList(int userNum) {
		return shDAO.selectCouponList(sqlSession, userNum);
	}
	
	@Override
	public int insertOrders(Orders orders) {
		return shDAO.insertOrders(sqlSession, orders);
	}
	
	@Override
	public int deleteCart(int proNum) {
		return shDAO.deleteCart(sqlSession, proNum);
	}
	
	@Override
	public int insertOrderDetails(OrderDetails od) {
		return shDAO.insertOrderDetails(sqlSession, od);
	}
	
	@Override
	public ArrayList<OrderListDTO> selectOrderList(String orderCode) {
		return shDAO.selectOrderList(sqlSession, orderCode);
	}
	
	@Override
	public ArrayList<Supplement> searchList(String search) {
		return shDAO.searchList(sqlSession, search);
	}
	
	@Override
	public ArrayList<Supplement> selectCateList(String proEffect) {
		return shDAO.selectCateList(sqlSession, proEffect);
	}
	
	@Override
	public Coupon selectUseCoupon(int couNum) {
		return shDAO.selectUseCoupon(sqlSession, couNum);
	}

	@Override
	public ArrayList<SupplementResp> selectsuppleRespList() {
		return shDAO.selectsuppleRespList(sqlSession);
	}

}
