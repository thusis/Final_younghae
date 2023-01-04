package com.kh.young.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Point;

@Repository("mDAO")
public class MemberDAO {

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkId", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickName", nickName);
	}

	public int searchEmail(SqlSessionTemplate sqlSession, String memberEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.searchEmail", memberEmail);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int insertMemberAddress(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMemberAddress", map);
	}

	public int selectMember(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMember", userId);
	}

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updateMemberAddress(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMemberAddress", map);
	}

	public Member searchId(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.searchId", m);
	}

	public Member checkIdEmail(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.checkIdEmail", userId);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatePwd", map);
	}

	public void insertBasicAddress(SqlSessionTemplate sqlSession, HashMap<String, Object> addressMap) {
		sqlSession.insert("memberMapper.insertBasicAddress", addressMap);
	}

	public Member searchRecommend(SqlSessionTemplate sqlSession, String otherRecommend) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.searchRecommend", otherRecommend);
	}

	public int pointAdd(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.pointAdd", map);
	}

	public int checkRecommend(SqlSessionTemplate sqlSession, String userRecommend) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.checkRecommend", userRecommend);
	}

	public void totalPoint(SqlSessionTemplate sqlSession, int i) {
		sqlSession.update("memberMapper.totalPoint", i);
		
	}

	public Member searchMyUserNum(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.searchMyUserNum", userId);
	}




}
