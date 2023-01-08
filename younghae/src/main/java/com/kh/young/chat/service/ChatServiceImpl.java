package com.kh.young.chat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.chat.dao.ChatDao;
import com.kh.young.chat.dao.ExpertcrDto;
import com.kh.young.chat.dao.GeneralcrDto;
import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.chat.dto.ChatroomListDto;
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
	public ExpertChatroomDto selectGeneralRecentChatroom(int loginUserNum) {
		int[] a = chDao.searchLatestChats(sqlSession, loginUserNum);
		if(a[0]==0 && a[1]==0) {
			return null;
		} else {
			ExpertcrDto e = chDao.selectGeneralRecentChatroom(sqlSession, Math.max(a[0], a[1]));
			ExpertChatroomDto ex = new ExpertChatroomDto(e);
			ex.setReserv(getIfReserv(ex.getChatroomId()));
			ex.setMessageList(selectMessageList(ex.getChatroomId()));
			return ex;
		}
	}
	
	@Override
	public GeneralChatroomDto selectExpertsRecentChatroom(int loginUserNum) {
		int[] a = chDao.searchLatestChats(sqlSession, loginUserNum);
		if(a[0]==0 && a[1]==0) {
			return null;
		} else {
			GeneralcrDto g= chDao.selectExpertsRecentChatroom(sqlSession, Math.max(a[0], a[1]));
			GeneralChatroomDto gn = new GeneralChatroomDto(g);
			gn.setReserv(getIfReserv(gn.getChatroomId()));
			gn.setMessageList(selectMessageList(gn.getChatroomId()));
			return gn;
		}
	}

	// 전문가와 채팅방 조회 / 없으면 []
	@Override
	public ExpertChatroomDto getExpertChatroomByMemberNums(Chatroom paraChatroom) {
		ExpertChatroomDto ex = new ExpertChatroomDto(chDao.getExpertChatroomByMemberNums(sqlSession, paraChatroom));
		ex.setMessageList(selectMessageList(ex.getChatroomId()));
		ex.setReserv(getIfReserv(ex.getChatroomId()));
		return ex;
	}

	// 없으면 새로 만든 후 반환
	@Override
	public ExpertChatroomDto createChatroom(Chatroom paraChatroom) {
		chDao.createChatroom(sqlSession, paraChatroom);
		return getExpertChatroomByMemberNums(paraChatroom);
	}

	@Override
	public int insertMessage(ChatMessage msg) {
		return chDao.insertMessage(sqlSession, msg);
	}

	@Override /**ok**/
	public ArrayList<ExpertChatroomListDto> selectRoomList(int userNum) {
		ArrayList<ExpertcrDto> roomList = chDao.selectRoomList(sqlSession, userNum);
		System.out.println("ch서비스 97:" + roomList);
		
		ArrayList<ExpertChatroomListDto> resultRoomList = new ArrayList<>();

		for(ExpertcrDto e : roomList) {
			ExpertChatroomListDto ex = new ExpertChatroomListDto(e);
			ex.setLastMessage(selectLastMessage(ex.getChatroomId()));
			ex.setReserv(getIfReserv(ex.getChatroomId()));
			ex.setNotReadCount(getNotReadCount(ex.getChatroomId()));
			resultRoomList.add(ex);
		}
		
		System.out.println("ch서비스118:"+resultRoomList);
		return resultRoomList;
	}
	
	@Override /**ok**/
	public ArrayList<GeneralChatroomListDto> selectExpertsRoomList(int loginUserNum) {
		ArrayList<GeneralcrDto> roomList = chDao.selectExpertRoomList(sqlSession, loginUserNum);
		System.out.println("ch서비스 97:" + roomList);
		
		ArrayList<GeneralChatroomListDto> resultRoomList = new ArrayList<>();

		for(GeneralcrDto g : roomList) {
			GeneralChatroomListDto gn = new GeneralChatroomListDto(g);
			gn.setLastMessage(selectLastMessage(gn.getChatroomId()));
			gn.setReserv(getIfReserv(gn.getChatroomId()));
			gn.setNotReadCount(getNotReadCount(gn.getChatroomId()));
			resultRoomList.add(gn);
		}
		
		System.out.println("ch서비스137:"+resultRoomList);
		return resultRoomList;
	}

	private ChatReserv getIfReserv(int chatroomId) {/**ok**/
		ChatReserv reserv = chDao.getIfReserv(sqlSession, chatroomId);
		System.out.println(reserv);
		if( reserv == null ) {
			reserv = new ChatReserv(); // reserv 내역이 없으면 id 를 0으로 처리할 것
//			reserv = new ChatReserv(0, 0, 0, null, null, null, 0 );// reserv 내역이 없으면 id 를 0으로 처리할 것
		}
		return reserv;
	}

	private ChatMessage selectLastMessage(int chatroomId) {/**ok**/
		ChatMessage lastMessage = chDao.selectLastMessage(sqlSession, chatroomId);
		System.out.println(lastMessage);
		if(lastMessage == null) {
			lastMessage = new ChatMessage(0, null, null, null, 0, 0, 0);
		}
		return lastMessage;
	}

	private int getNotReadCount(int chatroomId) {/**ok**/
		return chDao.getNotReadCount(sqlSession, chatroomId);
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
	public GeneralChatroomDto selectExpertuserChatroomByChatroomId(int chatroomId) {
		GeneralcrDto g=  chDao.selectExpertuserChatroomByChatroomId(sqlSession, chatroomId);
		GeneralChatroomDto gn = new GeneralChatroomDto(g);
		gn.setReserv(getIfReserv(gn.getChatroomId()));
		gn.setMessageList(selectMessageList(gn.getChatroomId()));
		return gn;
	}

	@Override
	public ExpertChatroomDto selectGeneraluserChatroomByChatroomId(int chatroomId) {
		ExpertcrDto e = chDao.selectGeneraluserChatroomByChatroomId(sqlSession, chatroomId);
		ExpertChatroomDto ex = new ExpertChatroomDto(e);
		ex.setReserv(getIfReserv(ex.getChatroomId()));
		ex.setMessageList(selectMessageList(ex.getChatroomId()));
		return ex;
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
	public int unreadHowMany(int receiverNum) {
		return chDao.unreadHowMany(sqlSession, receiverNum);
	}




}
