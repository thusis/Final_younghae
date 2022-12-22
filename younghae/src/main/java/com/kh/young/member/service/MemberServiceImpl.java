package com.kh.young.member.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.member.dao.MemberDAO;
import com.kh.young.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}
	
	@Override
	public int checkNickName(String nickName) {
		return mDAO.checkNickName(sqlSession, nickName);
	}
	
	@Override
	public int searchEmail(String memberEmail) {
		return mDAO.searchEmail(sqlSession, memberEmail);
	}
	
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}
	
	@Override
	public int insertMemberAddress(HashMap<String, Object> map) {
		return mDAO.insertMemberAddress(sqlSession, map);
	}
	
	@Override
	public int selectMember(String userId) {
		return mDAO.selectMember(sqlSession, userId);
	}
	
	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}
}
