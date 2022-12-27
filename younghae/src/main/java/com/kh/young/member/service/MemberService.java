package com.kh.young.member.service;

import java.util.HashMap;

import com.kh.young.model.vo.Member;

public interface MemberService {
	
	int checkId(String id);

	int checkNickName(String nickName);

	int searchEmail(String memberEmail);

	int insertMember(Member m);

	int insertMemberAddress(HashMap<String, Object> map);

	int selectMember(String userId);

	Member login(Member m);

	int updateMember(Member m);

	int updateMemberAddress(HashMap<String, Object> map);

	Member searchId(Member m);

	Member checkIdEmail(String userId);

	int updatePwd(HashMap<String, String> map);



}
