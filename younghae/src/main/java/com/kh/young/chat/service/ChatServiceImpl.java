package com.kh.young.chat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.chat.dao.ChatDao;
import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Member;
import com.kh.young.qna.dto.ExpertRespDto;

@Service("chService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chDao;

	@Override
	public ChatroomDto openMyChat(HttpServletRequest request, Integer expertNum) {
		
		Chatroom paraChatroom = new Chatroom();
		
		paraChatroom.setExpertNum(expertNum);
		paraChatroom.setUserNum(((Member)request.getSession().getAttribute("loginUser")).getUserNum());

		ChatroomDto expertChatroom = getExpertChatroom(paraChatroom); //나와 전문가 유저와의 챗 목록 확인
		
		System.out.println(expertChatroom);
		
		if (expertChatroom == null || expertChatroom.getChatroom().getChatroomId() == 0) {
			ChatroomDto newChatroom = createChatroom(paraChatroom);
			
			String defaultMsg = newChatroom.getExpert().getExpert().getExpertProfile();
			if(defaultMsg.trim().equals("") || defaultMsg.trim() == null) {
				defaultMsg = "설정된 기본 메세지가 없습니다.";
			}
			sendBotMessage(paraChatroom, defaultMsg); //전문가 프로필 = 기본메세지
		}
		
		return expertChatroom;
		
	}
	
	// 전문가와 채팅방 조회 / 없으면 []
	private ChatroomDto getExpertChatroom(Chatroom paraChatroom) {
		return chDao.getExpertChatroom(sqlSession, paraChatroom);
	}

	// 없으면 새로 만든 후 반환
	private ChatroomDto createChatroom(Chatroom paraChatroom) {
		chDao.createChatroom(sqlSession, paraChatroom);
		return getExpertChatroom(paraChatroom);
	}
	
	//생성 직후에는 bot메세지 보낸다
	private int sendBotMessage(Chatroom paraChatroom, String msg) {
		ChatMessage botMsg = new ChatMessage();
		
		botMsg.setUserNum(paraChatroom.getExpertNum());
		botMsg.setChatroomId(paraChatroom.getChatroomId());
		botMsg.setChatContent(msg);

		return chDao.insertMessage(sqlSession, botMsg);
	}

	@Override
	public int insertMessage(ChatMessage msg) {
		return chDao.insertMessage(sqlSession, msg);
	}

	@Override
	public ArrayList<ChatroomDto> selectRoomList(int userNum) {
		ArrayList<ChatroomDto> roomList = chDao.selectRoomList(sqlSession, userNum);
//		roomList = setRoomList(roomList);
		return roomList;
	}

	private ArrayList<ChatroomDto> setRoomList(ArrayList<ChatroomDto> roomList) {
		for(ChatroomDto r : roomList) {
			ChatMessage lastMessage = selectLastMessage(r.getChatroom().getChatroomId());
			r.setLastMessage(lastMessage.getChatContent());
			r.setLatestSendTime(lastMessage.getSendTime());
			r.setNotReadCount(getNotReadCount(r.getChatroom().getChatroomId()));
			r.setIsPaid(getIsPaid(r.getChatroom().getChatroomId()));
		}
		return roomList;
	}

	private ChatMessage selectLastMessage(int chatroomId) {
		return chDao.selectLastMessage(sqlSession, chatroomId);
	}
	
	private int getNotReadCount(int chatroomId) {
		return chDao.getNotReadCount(sqlSession, chatroomId);
	}

	private String getIsPaid(int chatroomId) {
		return chDao.getIsPaid(sqlSession, chatroomId);
	}
	
	@Override
	public ArrayList<ChatMessage> selectMessageList(Map<String, Object> paraMap) { // "chatroomId" ,"userNum"
		return chDao.selectMessageList(sqlSession, paraMap);
	}
	
	@Override
	public ArrayList<ChatMessage> selectMessageList(int chatroomId, int userNum) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("chatroomId", chatroomId);
		paraMap.put("userNum", userNum);
		return chDao.selectMessageList(sqlSession, paraMap);
	}
	
	@Override
	public int updateIsRead(Map<String, Object> paraMap) { // "chatroomId" ,"userNum"
		return chDao.updateIsRead(sqlSession, paraMap);
	}

	@Override
	public ArrayList<ChatroomDto> selectExpertsRoomList(int loginUserNum) {
		return chDao.selectExpertRoomList(sqlSession, loginUserNum);
	}

	@Override
	public ArrayList<ChatReserv> selectReservList(int loginUserNum) {
		return chDao.selectReservList(sqlSession, loginUserNum);
	}
	
	
}
