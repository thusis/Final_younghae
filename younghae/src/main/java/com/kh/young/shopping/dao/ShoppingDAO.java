package com.kh.young.shopping.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.Cart;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Supplement;

@Repository
public class ShoppingDAO {

	public ArrayList<Supplement> selectSupplementList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectSupplementList");
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

}
