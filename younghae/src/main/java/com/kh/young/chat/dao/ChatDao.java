package com.kh.young.chat.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.qna.dto.ExpertRespDto;

@Repository("chDao")
public class ChatDao {

	public ChatroomDto getExpertChatroom(SqlSessionTemplate sqlSession, Chatroom paraChatroom) {
		return sqlSession.selectOne("chatMapper.getExpertChatroom",paraChatroom);
	}

	public int createChatroom(SqlSessionTemplate sqlSession, Chatroom paraChatroom) {
		return sqlSession.insert("chatMapper.createChatroom", paraChatroom);
	}

	public int insertMessage(SqlSessionTemplate sqlSession, ChatMessage msg) {
		return sqlSession.insert("chatMapper.insertMessage", msg);
	}

	public ArrayList<ChatroomDto> selectRoomList(SqlSessionTemplate sqlSession, int userNum) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectRoomList", userNum);
	}
	
	public ArrayList<ChatMessage> selectMessageList(SqlSessionTemplate sqlSession, Map<String, Object> paraMap) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectMessageList", paraMap);
	}

	public int updateIsRead(SqlSessionTemplate sqlSession, Map<String, Object> paraMap) {
		return sqlSession.update("chatMapper.updateIsRead",paraMap);
	}

	/** ================여기 위 까지가 기본 채팅 기능인 것 같음================ **/
	
	public ChatMessage selectLastMessage(SqlSessionTemplate sqlSession, int chatroomId) {
		return sqlSession.selectOne("chatMapper.getLastMessage", chatroomId);
	}
	
	public int getNotReadCount(SqlSessionTemplate sqlSession, int chatroomId) {
		return sqlSession.selectOne("chatMapper.getNotReadCount", chatroomId);
	}
	
	public String getIsPaid(SqlSessionTemplate sqlSession, int chatroomId) {
		int result = sqlSession.selectOne("chatMapper.getIsPaid", chatroomId);
		String str = "";
		
		if(result == 0) {
			str = "N";
		} else {
			str = "Y";
		}
		return str;
	}

	public ArrayList<ChatroomDto> selectExpertRoomList(SqlSessionTemplate sqlSession, int loginUserNum) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectExpertRoomList", loginUserNum);
	}

	public ArrayList<ChatReserv> selectReservList(SqlSessionTemplate sqlSession, int loginUserNum) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectReservList",loginUserNum);
	}

	

}
