package com.kh.young.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.young.chat.dto.ChatPaymentRespDto;
import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.chat.service.ChatService;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Member;
import com.kh.young.qna.common.Qexception;
import com.kh.young.qna.service.QaService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chService;
	
	@Autowired
	private QaService qService;
	
    @GetMapping("open.ch") // 채팅창 켰을 때
    public String chatting(
    		HttpServletRequest request, 
			@RequestParam(value="expertNum", required=false) Integer expertNum,
    		Model model) {
    	/**
    	 * [[ 고려해야할 경우의 수 ]]
    	 * 1. 로그인 유저가 일반유저인가? - member.getUserCNumber == 2 인지
    	 * 		일반유저라면  -> ArrayList<chatroomDto (+ expert)>
    	 * 		전문가유저라면 -> ArrayList<chatroomDto (+ member)> + ArrayList<ChatReserv>
    	 * 2. expertNum 이 있는가? - 전문가회원의 채팅뱃지를 통해 채팅창을 켰는지, topmenubar를 통해 켰는지
    	 * 		있다면 
    	 * 		(1) 챗룸 있는지 조회 후 없으면 create
    	 * 		(2) nowChatroom, ArrayList<ChatMessage> 을 반환하는데,  
    	 * 		-> loginUserNum!=expertNum 
    	 * 		-> loginUserNum==expertNum 이라면 
    	 * 
    	 * 		없다면 nowChatroom = recentChatroom
    	 */

    	int loginUserNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
    	int cNum = ((Member)request.getSession().getAttribute("loginUser")).getUserCNumber();
    	
    	if(cNum==1 && expertNum == null) {
    		ArrayList<ChatroomDto> roomList = chService.selectRoomList(loginUserNum);
    		System.out.println("ch컨트롤62"+roomList);
    		if ( roomList.size() == 0 ) {
    			model.addAttribute("chatErrorMsg", "채팅 가능한 방이 없습니다.");
    		} else {
    			ChatroomDto nowChatroom = chService.selectRecentChatroom(loginUserNum);
    			model.addAttribute("nowChatroom", nowChatroom);
    			model.addAttribute("messageList",chService.selectMessageList(nowChatroom.getChatroom().getChatroomId()));
    			model.addAttribute("roomList", roomList);
    		}
    	} else if (cNum==1 && expertNum != null ) {
			Chatroom paraChatroom = new Chatroom();
			paraChatroom.setExpertNum(expertNum);
			paraChatroom.setUserNum(loginUserNum);
    		ChatroomDto nowChatroom = chService.getExpertChatroom(paraChatroom);
    		if( nowChatroom == null ) {
    			nowChatroom = chService.createChatroom(paraChatroom);
    		}
			model.addAttribute("nowChatroom", nowChatroom);
			model.addAttribute("messageList",chService.selectMessageList(nowChatroom.getChatroom().getChatroomId()));
			model.addAttribute("roomList", chService.selectRoomList(loginUserNum)); // 일반 -> 상대는 expert 객체 보유
    	} else if ( cNum == 2 
    			&& ((expertNum != null && expertNum == loginUserNum) || expertNum == null ) ) {
    		//전문회원이면서 내 이름의 채팅방 조회한 경우
    		//전문회원이면서 그냥 채팅방 조회한 경우
    		ArrayList<ChatroomDto> roomList = chService.selectExpertsRoomList(loginUserNum);
    		if( roomList == null || roomList.size() == 0 ) {
    			model.addAttribute("chatErrorMsg", "채팅 가능한 방이 없습니다. 열심히 활동해서 인지도를 쌓아보세요");
    		} else {
    			int msgCount = chService.fullMessageListCount(loginUserNum);
    			if(msgCount>0) {
    				ChatroomDto nowChatroom = chService.selectRecentChatroom(loginUserNum);
    				model.addAttribute("nowChatroom", nowChatroom);
    				model.addAttribute("messageList",chService.selectMessageList(nowChatroom.getChatroom().getChatroomId()));
    			}else {
    				model.addAttribute("nowChatroom", roomList.get(0));
    				model.addAttribute("messageList",null);
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
    	
//    	response.setContentType("application/json; charset=UTF-8");
    	int loginUserNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
    	ChatroomDto nowChatroom;
    	if ( loginUserNum == expertNum	) {
    		nowChatroom = chService.selectExpertChatroomByChatroomId(chatroomId);
    	} else {
    		nowChatroom = chService.selectGeneralChatroomByChatroomId(chatroomId);
    	}
    	ArrayList<ChatMessage> messageList = chService.selectMessageList(chatroomId);
    	
    	Map<String, Object> resultMap = new HashMap<>();
    	resultMap.put("nowChatroom", nowChatroom);
    	resultMap.put("messageList", messageList);
        
        return new Gson().toJson(resultMap);
    }

    // 채팅방 목록을 비동기 조회
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

	
}

