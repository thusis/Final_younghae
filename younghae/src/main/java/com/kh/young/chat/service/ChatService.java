package com.kh.young.chat.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;

@Service
public interface ChatService {

	ChatroomDto openMyChat(HttpServletRequest request, Integer expertNum);

	int insertMessage(ChatMessage msg);

	ArrayList<ChatroomDto> selectRoomList(int userNum);

	ArrayList<ChatMessage> selectMessageList(Map<String, Object> paraMap);

	int updateIsRead(Map<String, Object> paramMap);

	ArrayList<ChatMessage> selectMessageList(int chatroomId, int userNum);

	ArrayList<ChatroomDto> selectExpertsRoomList(int loginUserNum);

	ArrayList<ChatReserv> selectReservList(int loginUserNum);

}
