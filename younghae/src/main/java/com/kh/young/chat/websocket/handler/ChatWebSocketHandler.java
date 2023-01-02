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
	// synchronizedSet : 동기화된 Set 반환(HashSet은 기본적으로 비동기)
	// -> 멀티스레드 환경에서 하나의 컬렉션에 여러 스레드가 접근하여 의도치 않은 문제가 발생되지 않게 하기 위해
	// 동기화를 진행하여 스레드가 여러 순서대로 한 컬렉션에 순서대로 접근할 수 있게 변경

	// afterConnectionEstablished : 클라이언트와 연결이 완료되고 통신할 준비가 되면 수행되는 메서드
	// --> JS : new SockJS("/chattingSock")
	// --> 핸들러 클래스 매핑
	// --> 해당 메서드 실행
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// WebSocketSession session : 클라이언트와 서버간의 전이중 통신을 담달하는 객체
		// + 웹소켓에 접속한 회원의 HttpSession을 훔쳐서 가지고 있음
		System.out.println("afterConnectionEstablished:세션"+session);
		System.out.println("afterConnectionEstablished:id"+session.getId());
		System.out.println("afterConnectionEstablished:uri"+session.getUri());
		System.out.println("afterConnectionEstablished:principal"+session.getPrincipal());
		System.out.println("afterConnectionEstablished:handshake"+session.getHandshakeHeaders());
		System.out.println("afterConnectionEstablished:isOpen"+session.isOpen());
		sessions.add(session);
		// 현재 채팅방에 접속한 회원의 세션을 모아둠
	}

	// handleTextMessage : 클라이언트로부터 텍스트 메세지를 받으면 수행되는 메서드
	// --> JS : chattingSock.send(JSON데이터);
	// --> handleTextMessage수행
	// --> message.getPayLoad() == JSON데이터
	
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

            for(WebSocketSession s : sessions) {
                //  WebSocketSession은 HttpSession의 속성을 가로채서 똑같이 가지고 있기 때문에 회원 정보를 나타내는 loginMember도 가지고 있음.
                
                int loginUserNum = ((Member)s.getAttributes().get("loginUser")).getUserNum();
                logger.debug("loginUserNum : " + loginUserNum);
                
                // 로그인 상태인 회원 중 receivedId나 userNum이 일티하는 회원에게 메세지 전달
                if(loginUserNum == msg.getReceivedId() || loginUserNum == msg.getUserNum()) {
                    logger.info(msg.toString());
                    
                    s.sendMessage(new TextMessage(new Gson().toJson(msg)));
                    									//msg 객체(채팅방 번호, 대상번호, 내용, 보낸사람 번호, 보낸 시간)
                    //chatting.js의 chattingSock.onmessage로 JSON을 보낸다
                }
            }
		}
		
	}

	// afterConnectionClosed : 클라이언트와 연결이 끊기면 수행되는 메서드
	// --> 채팅방 화면(SockJS 객체가 있는 화면)을 벗어나면 연결 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed: " + session + ", " + status );
		System.out.println("afterConnectionClosed :세션"+session);
		System.out.println("afterConnectionClosed : id"+session.getId());
		System.out.println("afterConnectionClosed :uri"+session.getUri());
		System.out.println("afterConnectionClosed :principal"+session.getPrincipal());
		System.out.println("afterConnectionClosed :handshake"+session.getHandshakeHeaders());
		System.out.println("afterConnectionClosed :isOpen"+session.isOpen());
		sessions.remove(session);

	}
}

