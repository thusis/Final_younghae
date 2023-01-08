package com.kh.young.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.chat.service.ChatService;
import com.kh.young.chat.service.ExpertChatroomDto;
import com.kh.young.chat.service.ExpertChatroomListDto;
import com.kh.young.chat.service.GeneralChatroomDto;
import com.kh.young.chat.service.GeneralChatroomListDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Orders;
import com.kh.young.qna.service.QaService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chService;
	
	@Autowired
	private QaService qService;
	
    @GetMapping("open.ch") // 채팅창 켰을 때 
    public String chatting( /**ok**/
    		HttpServletRequest request, 
			@RequestParam(value="expertNum", required=false) Integer expertNum,
    		Model model) {

    	int loginUserNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
    	int cNum = ((Member)request.getSession().getAttribute("loginUser")).getUserCNumber();
    	
    	if(cNum==1 && expertNum == null) {
    		ArrayList<ExpertChatroomListDto> roomList = chService.selectRoomList(loginUserNum);
    		System.out.println("ch컨트롤62"+roomList);
    		if ( roomList.size() == 0 ) {
    			model.addAttribute("chatErrorMsg", "채팅 가능한 방이 없습니다.");
    		} else {
//    			ChatroomDto nowChatroom = chService.selectRecentChatroom(loginUserNum);
    			ExpertChatroomDto nowChatroom = chService.selectGeneralRecentChatroom(loginUserNum);
    			updateRead(nowChatroom, null);
    			model.addAttribute("nowChatroom", nowChatroom);
    			model.addAttribute("messageList",nowChatroom.getMessageList());
    			model.addAttribute("roomList", roomList);
    		}
    	} else if (cNum==1 && expertNum != null ) {
			Chatroom paraChatroom = new Chatroom();
			paraChatroom.setExpertNum(expertNum);
			paraChatroom.setUserNum(loginUserNum);
			ExpertChatroomDto nowChatroom = chService.getExpertChatroomByMemberNums(paraChatroom);
    		if( nowChatroom == null ) {
    			nowChatroom = chService.createChatroom(paraChatroom);// 새로 만들었기 때문에 MessageList도 없고, chatreserv도 없음
    		}
    		updateRead(nowChatroom, null);
			model.addAttribute("nowChatroom", nowChatroom);
			model.addAttribute("messageList",nowChatroom.getMessageList());
			model.addAttribute("roomList", chService.selectRoomList(loginUserNum)); // 일반 -> 상대는 expert 객체 보유
    	} else if ( cNum == 2 
    			&& ((expertNum != null && expertNum == loginUserNum) || expertNum == null ) ) {
    		//전문회원이면서 내 이름의 채팅방 조회한 경우
    		//전문회원이면서 그냥 채팅방 조회한 경우
    		ArrayList<GeneralChatroomListDto> roomList = chService.selectExpertsRoomList(loginUserNum);
    		if( roomList == null || roomList.size() == 0 ) {
    			model.addAttribute("chatErrorMsg", "채팅 가능한 방이 없습니다. 열심히 활동해서 인지도를 쌓아보세요");
    		} else {
    			int msgCount = chService.fullMessageListCount(loginUserNum);
    			if(msgCount>0) {
//    				ChatroomDto nowChatroom = chService.selectRecentChatroom(loginUserNum);
    				GeneralChatroomDto nowChatroom = chService.selectExpertsRecentChatroom(loginUserNum);
    				updateRead(null, nowChatroom);
    				model.addAttribute("nowChatroom", nowChatroom);
    				model.addAttribute("messageList", nowChatroom.getMessageList());
    			}else {
    				model.addAttribute("nowChatroom", roomList.get(0));
    				model.addAttribute("messageList", null);
    			}
    			model.addAttribute("roomList", roomList);
    		}
    	} else if ( cNum == 2 && (expertNum != null && expertNum != loginUserNum) ) {
    		model.addAttribute("chatErrorMsg", "잘못된 접근입니다");
    	}
        return "chat";
    }
    
	// 비동기로 메세지 목록을 조회하는 함수
    @ResponseBody
    @RequestMapping(value="selectMessage.ch", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
    public String selectMessageList(
    		HttpServletRequest request, 
    		@RequestParam int chatroomId, 
    		@RequestParam int expertNum, 
    		@RequestParam int generalUserNum) {
    	
    	int loginUserNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
    	Map<String, Object> resultMap = new HashMap<>();
    	
    	if ( loginUserNum == expertNum	) {
    		GeneralChatroomDto nowChatroom = chService.selectExpertuserChatroomByChatroomId(chatroomId);
        	resultMap.put("nowChatroom", nowChatroom);
        	resultMap.put("reserv", nowChatroom.getReserv());
        	resultMap.put("messageList", nowChatroom.getMessageList());
    	} else {
    		ExpertChatroomDto nowChatroom = chService.selectGeneraluserChatroomByChatroomId(chatroomId);
    		resultMap.put("nowChatroom", nowChatroom);
    		resultMap.put("reserv", nowChatroom.getReserv());
    		resultMap.put("messageList", nowChatroom.getMessageList());
    	}
        
        return new Gson().toJson(resultMap);
    }

    // 채팅방 목록을 비동기 조회 // 를 조회할 일이 없는데??????????????? (2023-01-08 20시 기준)
    @GetMapping("roomList.ch")
    @ResponseBody
    public String selectRoomList(HttpServletRequest request) {
    	int loginUserNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
    	int cNum = ((Member)request.getSession().getAttribute("loginUser")).getUserCNumber();
    	
    	if(cNum==1) {
			return new Gson().toJson(chService.selectRoomList(loginUserNum)); // 일반 -> 상대는 expert 객체 보유
    	} else {
    		return new Gson().toJson(chService.selectExpertsRoomList(loginUserNum)); // 일반 -> 상대는 expert 객체 보유
//    		ArrayList<ChatReserv> reservList = chService.selectReservList(loginUserNum); //결제 구현되기 전까진 막아놓기
    	}
    }

    // 읽음 비동기 처리
    @GetMapping("updateRead.ch")
    @ResponseBody
    public int updateRead(@RequestParam Map<String, Object> paraMap) { // "chatroomId" ,"userNum"
    	System.out.println("ch컨트롤러136: " + paraMap);
        return chService.updateIsRead(paraMap);
    }
    
    public int updateRead(ExpertChatroomDto ex, GeneralChatroomDto gn) {
    	Map<String, Object> paraMap = new HashMap<>();
    	if(gn == null) {
    		paraMap.put("chatroomId", ex.getChatroomId());
    		paraMap.put("userNum", ex.getChatroom().getUserNum());
    	} else {
    		paraMap.put("chatroomId", gn.getChatroomId());
    		paraMap.put("userNum", gn.getChatroom().getExpertNum());
    	}
    	return chService.updateIsRead(paraMap);
    }

	/**
	 * 결제와 예약======================================================================================
	 * 	private int reservId;
		private int chatroomId;
		private int paymentId;
		private Date reservSchedule;
		private String isApproved;
		private String isCompleted;
	 */
    @PostMapping("checkChatReservTime.ch")
    @ResponseBody
    public String checkChatReservTime(@RequestParam Map<String, Object> paraMap) {
    	System.out.println(paraMap);
    	System.out.println(paraMap.get("reservSchedule"));
    	System.out.println(paraMap.get("reservSchedule").getClass().getName());
    	
    	return 1+"";
    }
    
    @PostMapping("afterPayInsertChatReserv.ch")
    @ResponseBody
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
    public String afterPayInsertChatReserv(@ModelAttribute ChatReserv crInsert, @ModelAttribute Orders ordInsert) {
    	System.out.println(crInsert);
    	System.out.println(ordInsert);
    	
    	int result = chService.afterPayInsertChatReserv(crInsert, ordInsert);
    	
    	return String.valueOf(result);
    }
    
    // 몇 개 메세지 안 읽었는지 비동기 조회
    @GetMapping("unreadHowMany.ch")
    @ResponseBody
    public String unreadHowMany(@RequestParam int receiverNum) {
    	int unreadHowMany = chService.unreadHowMany(receiverNum);
    	return String.valueOf(unreadHowMany);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

