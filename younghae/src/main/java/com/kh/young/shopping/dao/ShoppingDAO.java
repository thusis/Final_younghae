package com.kh.young.shopping.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.Cart;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.OrderDetails;
import com.kh.young.model.vo.Orders;
import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.dto.GetPayInfoDTO;
import com.kh.young.shopping.dto.OrderListDTO;
import com.kh.young.shopping.dto.PaymentDTO;
import com.kh.young.shopping.dto.SupplementResp;

@Repository
public class ShoppingDAO {

	public ArrayList<Supplement> selectSupplementList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectSupplementList");
	}
	
	public ArrayList<SupplementResp> selectsuppleRespList(SqlSessionTemplate sqlSession) {
		ArrayList<Supplement> list = selectSupplementList(sqlSession);
		ArrayList<SupplementResp> resultList = new ArrayList<>();
		for(Supplement l : list) {
			SupplementResp resp = new SupplementResp();
			int reviewCount = sqlSession.selectOne("shoppingMapper.selectReviewCount",l.getProNum());
			resp.setProNum(l.getProNum());
			resp.setProImage(l.getProImage());
			resp.setProName(l.getProName());
			resp.setProCompany(l.getProCompany());
			resp.setProIngredient(l.getProIngredient());
			resp.setProPrice(l.getProPrice());
			resp.setProEffect(l.getProEffect());
			resp.setProIntake(l.getProIntake());
			resp.setProSaleStatus(l.getProSaleStatus());
			resp.setProCreateDate(l.getProCreateDate());
			resp.setProModifyDate(l.getProModifyDate());
			resp.setProGrade(l.getProGrade());
			resp.setProStatus(l.getProStatus());
			resp.setCateNum(l.getCateNum());
			resp.setFormatPrice(l.getFormatPrice());
			resp.setReviewCount(reviewCount);
			resultList.add(resp);
		}
		return resultList;
	}

	public ArrayList<Supplement> selectTrendList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectTrendList");
	}

	public ArrayList<Supplement> selectBestsellerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectBestsellerList");
	}

	public Supplement selectDetail(SqlSessionTemplate sqlSession, int proNum) {
		return sqlSession.selectOne("shoppingMapper.selectDetail", proNum);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("shoppingMapper.selemetMember", i);
	}

	public ArrayList<GeneralUser> selectGu(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectGu",i);
	}

	public int insertAddress(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.insert("shoppingMapper.insertAddress", a);
	}

	public ArrayList<Address> selectAddressList(SqlSessionTemplate sqlSession, int userNum) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectAddressList", userNum);
	}

	public int updateAddress(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.update("shoppingMapper.updateAddress", a);
	}

	public void updateBasicAll(SqlSessionTemplate sqlSession, int userNum) {
		sqlSession.update("shoppingMapper.updateBasicAll", userNum);
	}

	public int deleteAddress(SqlSessionTemplate sqlSession, int addressNum) {
		return sqlSession.update("shoppingMapper.deleteAddress", addressNum);
	}

	public int insertCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("shoppingMapper.insertCart", c);
	}

	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, Cart c) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectCartList", c);
	}

	public int checkCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.selectOne("shoppingMapper.checkCart", c);
	}

	public int addCartCount(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.update("shoppingMapper.addCartCount", c);
	}

	public ArrayList<Cart> selectCartViewList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectCartViewList", m);
	}

	public int updateCartQuantity(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.update("shoppingMapper.updateCartQuantity", c);
	}

	public void deleteSelectCart(SqlSessionTemplate sqlSession, int i) {
		sqlSession.delete("shoppingMapper.deleteSelectCart", i);
	}

	public PaymentDTO selectPayList(SqlSessionTemplate sqlSession, GetPayInfoDTO getPayInfoDTO) {
		return sqlSession.selectOne("shoppingMapper.selectPayList", getPayInfoDTO);
	}

	public ArrayList<Coupon> selectCouponList(SqlSessionTemplate sqlSession, int userNum) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectCouponList", userNum);
	}

	public int insertOrders(SqlSessionTemplate sqlSession, Orders orders) {
		return sqlSession.insert("shoppingMapper.insertOrders", orders);
	}

	public int deleteCart(SqlSessionTemplate sqlSession, int proNum) {
		return sqlSession.delete("shoppingMapper.deleteCart", proNum);
	}

	public int insertOrderDetails(SqlSessionTemplate sqlSession, OrderDetails od) {
		return sqlSession.insert("shoppingMapper.insertOrderDetails", od);
	}

	public ArrayList<OrderListDTO> selectOrderList(SqlSessionTemplate sqlSession, String orderCode) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectOrderList", orderCode);
	}

	public ArrayList<Supplement> searchList(SqlSessionTemplate sqlSession, String search) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectSearchList", search);
	}

	public ArrayList<Supplement> selectCateList(SqlSessionTemplate sqlSession, String proEffect) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectCateList", proEffect);
	}

	public Coupon selectUseCoupon(SqlSessionTemplate sqlSession, int couNum) {
		return sqlSession.selectOne("shoppingMapper.selectUseCoupon", couNum);
	}



}
