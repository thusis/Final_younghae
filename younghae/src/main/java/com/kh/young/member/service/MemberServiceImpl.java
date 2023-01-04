package com.kh.young.member.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.member.dao.MemberDAO;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Point;

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
	
	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}
	
	@Override
	public int updateMemberAddress(HashMap<String, Object> map) {
		return mDAO.updateMemberAddress(sqlSession, map);
	}
	
	@Override
	public Member searchId(Member m) {
		return mDAO.searchId(sqlSession, m);
	}
	
	@Override
	public Member checkIdEmail(String userId) {
		return mDAO.checkIdEmail(sqlSession, userId);
	}
	
	@Override
	public int updatePwd(HashMap<String, String> map) {
		return mDAO.updatePwd(sqlSession, map);
	}
	
	@Override
	public void insertBasicAddress(HashMap<String, Object> addressMap) {
		mDAO.insertBasicAddress(sqlSession,addressMap);
	}
	
	@Override
	public Member searchRecommend(String otherRecommend) {
		return mDAO.searchRecommend(sqlSession,otherRecommend);
	}
	
	@Override
	public int pointAdd(HashMap<String, Object> map) {
		return mDAO.pointAdd(sqlSession,map);
	}
	
	@Override
	public int checkRecommend(String userRecommend) {
		return mDAO.checkRecommend(sqlSession,userRecommend);
	}
	
	@Override
	public void totalPoint(int i) {
		mDAO.totalPoint(sqlSession,i);
	}
	
	@Override
	public Member searchMyUserNum(String userId) {
		return mDAO.searchMyUserNum(sqlSession,userId);
	}
}
