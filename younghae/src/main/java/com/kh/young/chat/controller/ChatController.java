package com.kh.young.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.chat.service.ChatService;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.Member;
import com.kh.young.qna.dto.ExpertRespDto;
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
    	
    	ChatroomDto nowChatroom = chService.selectNowChatroom(expertNum, loginUserNum);
    	System.out.println("ch컨트롤러 nowChatroom 58: "+ nowChatroom);
    	ArrayList<ChatMessage> messageList = new ArrayList<ChatMessage>();

    	if(nowChatroom == null) {
    		model.addAttribute("msg", "채팅 가능한 방이 없습니다.");
    	} else {
    		model.addAttribute("nowChatroom",nowChatroom);
    		messageList = chService.selectMessageList(nowChatroom.getChatroom().getChatroomId());
    		model.addAttribute("messageList",messageList);
    	}
    	ArrayList<ChatroomDto> roomList = new ArrayList<ChatroomDto>(); //expert 나 general 둘 중 하나만 가짐
    	
    	if(cNum==1) {
			model.addAttribute("roomList", chService.selectRoomList(loginUserNum)); // 일반 -> 상대는 expert 객체 보유
    	}else if(cNum==2) {
    		model.addAttribute("roomList", chService.selectExpertsRoomList(loginUserNum)); // 전문가 -> 상대는 member 객체 보유
//    		ArrayList<ChatReserv> reservList = chService.selectReservList(loginUserNum); //결제 구현되기 전까진 막아놓기
    	}
    	
    	
    	System.out.println(roomList);
    	System.out.println(nowChatroom);
    	System.out.println(messageList);
        
        return "chat";
    }
    
	// 비동기로 메세지 목록을 조회하는 함수
    @GetMapping("selectMessage.ch")
    @ResponseBody
    public String selectMessageList(@RequestParam int chatroomId) {
        ArrayList<ChatMessage> messageList = chService.selectMessageList(chatroomId);
        return new Gson().toJson(messageList);
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
    public int updateRead(@RequestParam Map<String, Object> paramMap) { // "chatroomId" ,"userNum"
        return chService.updateIsRead(paramMap);
    }

	
}
