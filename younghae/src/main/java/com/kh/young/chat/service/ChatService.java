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

	/**일반회원이 할 수 있는 거 : 채팅방 생성**/
	ArrayList<ExpertChatroomListDto> selectRoomList(int userNum); // 일반회원은 전문가를
	ExpertChatroomDto selectGeneralRecentChatroom(int loginUserNum);
	ExpertChatroomDto selectGeneraluserChatroomByChatroomId(int chatroomId);

	ExpertChatroomDto getExpertChatroomByMemberNums(Chatroom paraChatroom);
	ExpertChatroomDto createChatroom(Chatroom paraChatroom);
	
	/**전문회원**/
	ArrayList<GeneralChatroomListDto> selectExpertsRoomList(int loginUserNum); //전문가는 일반회원을
	GeneralChatroomDto selectExpertsRecentChatroom(int loginUserNum);
	GeneralChatroomDto selectExpertuserChatroomByChatroomId(int chatroomId);

	/** 공용 **/
	ArrayList<ChatMessage> selectMessageList(int chatroomId);
	int fullMessageListCount(int loginUserNum);
	int insertMessage(ChatMessage msg);
	int unreadHowMany(int receiverNum);
	int updateIsRead(Map<String, Object> paramMap);

	
//	ArrayList<ChatReserv> selectReservList(int loginUserNum);
	int afterPayInsertChatReserv(ChatReserv crInsert, Orders ordInsert);
	
	int reservApprove(int chatroomId);
	int reservDeny(int chatroomId);
	

}
