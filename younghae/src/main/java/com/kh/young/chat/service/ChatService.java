package com.kh.young.chat.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.chat.dto.ChatroomListDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Orders;

@Service
public interface ChatService {

	ArrayList<ChatroomListDto> selectRoomList(int userNum);
	ArrayList<ChatroomListDto> selectExpertsRoomList(int loginUserNum);

	ChatroomDto selectNowChatroom(Integer expertNum, int loginUserNum);
	ChatroomDto selectRecentChatroom(int loginUserNum);
	
	ChatroomDto getExpertChatroom(Chatroom paraChatroom);
	ChatroomDto createChatroom(Chatroom paraChatroom);
	
	int fullMessageListCount(int loginUserNum);
	ArrayList<ChatMessage> selectMessageList(int chatroomId);

	ChatroomDto selectExpertuserChatroomByChatroomId(int chatroomId);
	ChatroomDto selectGeneraluserChatroomByChatroomId(int chatroomId);
	
	int insertMessage(ChatMessage msg);
	int updateIsRead(Map<String, Object> paramMap);

//	ArrayList<ChatReserv> selectReservList(int loginUserNum);

	int afterPayInsertChatReserv(ChatReserv crInsert, Orders ordInsert);
	
	int unreadHowMany(int receiverNum);

}
