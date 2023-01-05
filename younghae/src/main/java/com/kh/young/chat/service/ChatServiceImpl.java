package com.kh.young.chat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.chat.dao.ChatDao;
import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Orders;

@Service("chService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chDao;

	@Override
	public ChatroomDto selectNowChatroom(Integer expertNum, int loginUserNum) {
		 
		if( expertNum == loginUserNum ) {
			ArrayList<ChatroomDto> rl = selectExpertsRoomList(loginUserNum);
			if( rl != null ) {
				return selectRecentChatroom(loginUserNum); 
			} else {
				return null; // 채팅방은 있는데 보낸 메세지가 없으면 null 만! 전문가회원은 자기가 새로운 채팅방 못 만들어
			}
		} else {
			if(expertNum==0) {
				return null;  // 일반유저가 expertNum이라는 parameter 없이 채팅방 들어온 경우 아무것도 생성되선 안 됨. 새로고침도 마찬가지
			}else {
				Chatroom paraChatroom = new Chatroom();
				paraChatroom.setExpertNum(expertNum);
				paraChatroom.setUserNum(loginUserNum);
				ChatroomDto expertChatroom = getExpertChatroom(paraChatroom); //나와 전문가 유저와의 챗 목록 확인
				
				System.out.println("c서비스39"+paraChatroom);
				System.out.println("c서비스40"+expertChatroom);
				
				if (expertChatroom == null || expertChatroom.getChatroom().getChatroomId() == 0) {
					ChatroomDto newChatroom = createChatroom(paraChatroom);
					System.out.println("c서비스45: 새로운챗룸생성"+newChatroom);
					
					/*
				String defaultMsg = newChatroom.getExpert().getExpert().getExpertProfile();
				if(defaultMsg.trim().equals("") || defaultMsg.trim() == null) {
					defaultMsg = "설정된 기본 메세지가 없습니다.";
				}
				sendBotMessage(paraChatroom, defaultMsg); //전문가 프로필 = 기본메세지
					 */
					return newChatroom;
				} else {
					return expertChatroom;
				}
			}
		}
	}
	
	@Override
	public ChatroomDto selectRecentChatroom(int loginUserNum){
		return chDao.selectRecentChatroom(sqlSession, loginUserNum);
	}

	// 전문가와 채팅방 조회 / 없으면 []
	@Override
	public ChatroomDto getExpertChatroom(Chatroom paraChatroom) {
		return chDao.getExpertChatroom(sqlSession, paraChatroom);
	}

	// 없으면 새로 만든 후 반환
	@Override
	public ChatroomDto createChatroom(Chatroom paraChatroom) {
		chDao.createChatroom(sqlSession, paraChatroom);
		return getExpertChatroom(paraChatroom);
	}
	
	//생성 직후에는 bot메세지 보낸다
	private int sendBotMessage(Chatroom paraChatroom, String msg) {
		ChatMessage botMsg = new ChatMessage();
		
		botMsg.setSenderNum(paraChatroom.getExpertNum());
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
		System.out.println("ch서비스 97:" + roomList);
		roomList = setRoomList(roomList);
		return roomList;
	}
	
	@Override
	public ArrayList<ChatroomDto> selectExpertsRoomList(int loginUserNum) {
		return chDao.selectExpertRoomList(sqlSession, loginUserNum);
	}

	/*
	@Override
	public ArrayList<ChatReserv> selectReservList(int loginUserNum) {
		return chDao.selectReservList(sqlSession, loginUserNum);
	}
	*/

//	 roomList 세팅
		private ArrayList<ChatroomDto> setRoomList(ArrayList<ChatroomDto> roomList) {
			for(ChatroomDto r : roomList) {
//				ChatMessage lastMessage = selectLastMessage(r.getChatroom().getChatroomId());
//				r.setLastMessage(lastMessage.getChatContent());
//				r.setLatestSendTime(lastMessage.getSendTime());
				r.setNotReadCount(getNotReadCount(r.getChatroom().getChatroomId()));
				r.setIsPaid(getIsPaid(r.getChatroom().getChatroomId()));
			}
			return roomList;
		}
	
//		private ChatMessage selectLastMessage(int chatroomId) {
//			return chDao.selectLastMessage(sqlSession, chatroomId);
//		}
		
		private int getNotReadCount(int chatroomId) {
			return chDao.getNotReadCount(sqlSession, chatroomId);
		}
	
		private String getIsPaid(int chatroomId) {
			return chDao.getIsPaid(sqlSession, chatroomId);
		}
	
		
	@Override
	public ArrayList<ChatMessage> selectMessageList(int chatroomId) {
		return chDao.selectMessageList(sqlSession, chatroomId);
	}
	
	@Override
	public int updateIsRead(Map<String, Object> paraMap) { // "chatroomId" ,"userNum"
		return chDao.updateIsRead(sqlSession, paraMap);
	}

	@Override
	public ChatroomDto selectExpertChatroomByChatroomId(int chatroomId) {
		return chDao.selectExpertChatroomByChatroomId(sqlSession, chatroomId);
	}

	@Override
	public ChatroomDto selectGeneralChatroomByChatroomId(int chatroomId) {
		return chDao.selectGeneralChatroomByChatroomId(sqlSession, chatroomId);
	}

	@Override
	public int fullMessageListCount(int loginUserNum) {
		return chDao.fullMessageListCount(sqlSession, loginUserNum);
	}

    /**
    ChatReserv(
    reservId=0, 
    chatroomId=26, 
    orderNum=0, 
    reservSchedule=2023/01/06 10:40, 
    isApproved=null, 
    isCompleted=null, 
    reservHowLong=2)
    
    Orders(
    orderNum=0, 
    orderCode=CHAT_1672819824571, 
    userNum=150, 
    userId=young04, 
    orderDate=2023. 1. 4. 오후 5:10:24, 
    orderStatus=null, 
    orderPayAmount=100, 
    orderTotalPrice=0, 
    orderUserName=성수현, 
    orderPaymethod=card, 
    orderCouponPrice=0, 
    orderImpCode=imp_689824461093, 
    orderPhone=01012341234, 
    addressNum=0)
     */
	@Override
	public int afterPayInsertChatReserv(ChatReserv crInsert, Orders ordInsert) {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("crInsert", crInsert);
		paraMap.put("ordInsert", ordInsert);
		return chDao.afterPayInsertChatReserv(sqlSession, paraMap);
	}

	@Override
	public int upreadHowMany(int receiverNum) {
		return chDao.upreadHowMany(sqlSession, receiverNum);
	}




}
