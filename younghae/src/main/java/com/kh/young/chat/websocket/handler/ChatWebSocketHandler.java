package com.kh.young.chat.websocket.handler;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.young.chat.service.ChatService;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.Member;

public class ChatWebSocketHandler extends TextWebSocketHandler  {

	private Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);

	@Autowired
	private ChatService chService;

	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// WebSocketSession session : 클라이언트와 서버간의 전이중 통신을 담달하는 객체
		// + 웹소켓에 접속한 회원의 HttpSession을 훔쳐서 가지고 있음
		System.out.println("afterConnectionEstablished:세션 열렸니?"+session+session.isOpen());
//		System.out.println("afterConnectionEstablished:id"+session.getId());
//		System.out.println("afterConnectionEstablished:uri"+session.getUri());
//		System.out.println("afterConnectionEstablished:principal"+session.getPrincipal());
//		System.out.println("afterConnectionEstablished:handshake"+session.getHandshakeHeaders());
//		System.out.println("afterConnectionEstablished:isOpen"+session.isOpen());
		sessions.add(session);
		// 현재 채팅방에 접속한 회원의 세션을 모아둠
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println(session.toString());
		System.out.println("전달 받는 내용 : " + message.getPayload());
		
		ObjectMapper objectMapper = new ObjectMapper();

		ChatMessage msg = objectMapper.readValue(message.getPayload(), ChatMessage.class);
		// JSON , 변경할 VO 클래스
		logger.debug(msg.toString());

		// 메세지 DB에 insert
		int result = chService.insertMessage(msg);

		if (result > 0) {
			// 보낸시간에 DB에 있고 msg객체에는 없는 상태 -> 보낸시간 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
			msg.setSendTime(sdf.format(new Date()));

            for(WebSocketSession s : sessions) {//  WebSocketSession은 HttpSession의 속성을 가로채서 똑같이 가지고 있기 때문에 회원 정보를 나타내는 loginMember도 가지고 있음.
                
                int loginUserNum = ((Member)s.getAttributes().get("loginUser")).getUserNum();
                logger.debug("loginUserNum : " + loginUserNum);
                
                // 로그인 상태인 회원 중 receivedId나 userNum이 일티하는 회원에게 메세지 전달
                if(loginUserNum == msg.getReceiverNum() || loginUserNum == msg.getSenderNum()) {
                    logger.info(msg.toString());
                    
                    s.sendMessage(new TextMessage(new Gson().toJson(msg)));
                }
            }
		}
		
	}

	// --> 채팅방 화면(SockJS 객체가 있는 화면)을 벗어나면 연결 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed :세션 닫혔니?"+session+session.isOpen()+ ", " + status );
		sessions.remove(session);

	}
}

