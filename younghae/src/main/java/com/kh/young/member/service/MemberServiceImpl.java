package com.kh.young.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.member.dao.MemberDAO;

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
}
