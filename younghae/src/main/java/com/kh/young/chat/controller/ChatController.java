package com.kh.young.chat.controller;

import java.util.ArrayList;
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
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Member;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.service.QaService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chService;
	
	@Autowired
	private QaService qService;
	
	/**
	 * 일단 참고하는 url로 진행해보고 추후 변경/
	
	/**채팅방**/
	
	
//    @GetMapping("/chatting/enter")
	@GetMapping("enter.ch")
	public String openChat(
			HttpServletRequest request, 
			@RequestParam(value="expertNum") Integer expertNum,
			RedirectAttributes ra) {
		
		ChatroomDto expertChatroom = chService.openMyChat(request, expertNum);
		ExpertRespDto expert = qService.selectExpertResp(expertNum);
        ra.addFlashAttribute("expertChatroom", expertChatroom);
        ra.addFlashAttribute("expert", expert);
        
        System.out.println(expertChatroom);
        System.out.println(expert);
        
        return "redirect:open.ch";
	}
	
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
    	 * 		있다면 nowChatroom, ArrayList<ChatMessage> 을 반환하는데,  
    	 * 		-> loginUserNum!=expertNum 
    	 * 		-> loginUserNum==expertNum 이라면 
    	 * 
    	 * 		없다면 nowChatroom = recentChatroom
    	 */

    	int loginUserNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
    	int cNum = ((Member)request.getSession().getAttribute("loginUser")).getUserCNumber();
    	
    	ArrayList<ChatroomDto> roomList = new ArrayList();

    	if(cNum==1) {
			roomList = chService.selectRoomList(loginUserNum); // expert 객체 보유
    	}else if(cNum==2) {
    		roomList = chService.selectExpertsRoomList(loginUserNum); // member 객체 보유
//    		ArrayList<ChatReserv> reservList = chService.selectReservList(loginUserNum); //결제 구현되기 전까진 막아놓기
    	}
    	
    	if(expertNum == null) {
    		
    	} else {
    		
    	}
    	
    	if(expertNum != loginUserNum) { //로그인 유저가 일반유저면
    		
    	}
    	
    	ChatroomDto nowChatroom = chService.openMyChat(request, expertNum);
		ExpertRespDto expert = qService.selectExpertResp(expertNum);
    	ArrayList<ChatMessage> messageList = chService.selectMessageList(nowChatroom.getChatroom().getChatroomId(),((Member)request.getSession().getAttribute("loginUser")).getUserNum() );
    	
    	ArrayList<ChatroomDto> roomList2 = chService.selectRoomList(loginUserNum);
    	
    	System.out.println(nowChatroom);
    	System.out.println(roomList);
    	
    	model.addAttribute("nowChatroom", nowChatroom);
    	model.addAttribute("expert", expert);
    	model.addAttribute("messageList", messageList);
        model.addAttribute("roomList", roomList);
        
        return "chat";
    }
    
	// 비동기로 메세지 목록을 조회하는 함수
    @GetMapping("selectMessage.ch")
    @ResponseBody
    public String selectMessageList(@RequestParam Map<String, Object> paraMap) {
    	
        System.out.println(paraMap); //chatroomId , loginUserNum
        ArrayList<ChatMessage> messageList = chService.selectMessageList(paraMap);
        return new Gson().toJson(messageList);
    }

    // 채팅방 목록을 비동기 조회
    @GetMapping("roomList.ch")
    @ResponseBody
    public String selectRoomList(int userNum) {
    	ArrayList<ChatroomDto> roomList = chService.selectRoomList(userNum);
        return new Gson().toJson(roomList);
    }

    // 읽음 비동기 처리
    @GetMapping("updateRead.ch")
    @ResponseBody
    public int updateReadFlag(@RequestParam Map<String, Object> paramMap) {
        return chService.updateIsRead(paramMap);
    }

	
}
