package com.kh.young.shopping.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.dao.ShoppingDAO;

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
	
}
