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

	ChatroomDto selectNowChatroom(Integer expertNum, int loginUserNum);

	int insertMessage(ChatMessage msg);

	ArrayList<ChatroomDto> selectRoomList(int userNum);

	int updateIsRead(Map<String, Object> paramMap);

	ArrayList<ChatMessage> selectMessageList(int chatroomId);

	ArrayList<ChatroomDto> selectExpertsRoomList(int loginUserNum);

	ChatroomDto getExpertChatroom(Chatroom paraChatroom);

	ChatroomDto selectExpertChatroomByChatroomId(int chatroomId);
	ChatroomDto selectGeneralChatroomByChatroomId(int chatroomId);

//	ArrayList<ChatReserv> selectReservList(int loginUserNum);

}
