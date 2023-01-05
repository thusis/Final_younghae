package com.kh.young.chat.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.chat.dto.ChatroomDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Member;
import com.kh.young.qna.dto.ExpertRespDto;

@Repository("chDao")
public class ChatDao {

	public ChatroomDto getExpertChatroom(SqlSessionTemplate sqlSession, Chatroom paraChatroom) {
		return sqlSession.selectOne("chatMapper.getExpertChatroom",paraChatroom);
	}

	public int createChatroom(SqlSessionTemplate sqlSession, Chatroom paraChatroom) {
		return sqlSession.insert("chatMapper.createChatroom", paraChatroom);
	}

	public int insertMessage(SqlSessionTemplate sqlSession, ChatMessage msg) {
		return sqlSession.insert("chatMapper.insertMessage", msg);
	}

	public ArrayList<ChatroomDto> selectRoomList(SqlSessionTemplate sqlSession, int userNum) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectRoomList", userNum);
	}
	
	public ArrayList<ChatMessage> selectMessageList(SqlSessionTemplate sqlSession, int chatroomId) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectMessageList", chatroomId);
	}

	public int updateIsRead(SqlSessionTemplate sqlSession, Map<String, Object> paraMap) {
		return sqlSession.update("chatMapper.updateIsRead",paraMap);
	}

	/** ================여기 위 까지가 기본 채팅 기능인 것 같음================ **/
	
	public ChatMessage selectLastMessage(SqlSessionTemplate sqlSession, int chatroomId) {
		return sqlSession.selectOne("chatMapper.getLastMessage", chatroomId);
	}
	
	public int getNotReadCount(SqlSessionTemplate sqlSession, int chatroomId) {
		return sqlSession.selectOne("chatMapper.getNotReadCount", chatroomId);
	}
	
	public String getIsPaid(SqlSessionTemplate sqlSession, int chatroomId) {
		int result = sqlSession.selectOne("chatMapper.getIsPaid", chatroomId);
		String str = "";
		
		if(result == 0) {
			str = "N";
		} else {
			str = "Y";
		}
		return str;
	}

	public ArrayList<ChatroomDto> selectExpertRoomList(SqlSessionTemplate sqlSession, int loginUserNum) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectExpertRoomList", loginUserNum);
	}

	public ArrayList<ChatReserv> selectReservList(SqlSessionTemplate sqlSession, int loginUserNum) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectReservList",loginUserNum);
	}

	 // 메세지가 존재하는 경우에만 사용 가능하다
	public ChatroomDto selectRecentChatroom(SqlSessionTemplate sqlSession, int loginUserNum){
		int myLatestChatId = sqlSession.selectOne("chatMapper.selectMyLatestChatId", loginUserNum);
		int otherLatestChatId = sqlSession.selectOne("chatMapper.selectOtherLatestChatId", loginUserNum);
		System.out.println(myLatestChatId+"최신채팅메세지조회중"+ otherLatestChatId);
		
		ChatroomDto resultChatroom;
		
		if(myLatestChatId==0 && otherLatestChatId==0) {
			return null;
		} else {
			int cnum = selectCnum(sqlSession, loginUserNum);
			
			if( cnum == 1 ) { //일반유저의 최신 채팅방 조회
				resultChatroom = sqlSession.selectOne("chatMapper.selectGeneralRecentChatroom", Math.max(myLatestChatId, otherLatestChatId));
			} else { // 전문가유저의 최신 채팅방 조회 
				resultChatroom =  sqlSession.selectOne("chatMapper.selectExpertRecentChatroom", Math.max(myLatestChatId, otherLatestChatId));
			}
			System.out.println("ch다오88: "+ resultChatroom);
			return resultChatroom;
		}
	}
	
	public int selectCnum(SqlSessionTemplate sqlSession, int loginUserNum) {
		return sqlSession.selectOne("chatMapper.selectCnum", loginUserNum);
	}
	
	/**=================================================================== */
	/** -----내가 일반회원이면 상대는 >>EXPERT<< ----- **/
	public ChatroomDto selectExpertChatroomByChatroomId(SqlSessionTemplate sqlSession, int chatroomId) {
		return sqlSession.selectOne("chatMapper.selectExpertChatroomByChatroomId", chatroomId);
	}

	/** -----내가 전문가면 상대는 >>GENERAL<< ----- **/
	public ChatroomDto selectGeneralChatroomByChatroomId(SqlSessionTemplate sqlSession, int chatroomId) {
		return sqlSession.selectOne("chatMapper.selectGeneralChatroomByChatroomId", chatroomId);
	}

	public int fullMessageListCount(SqlSessionTemplate sqlSession, int loginUserNum) {
		return sqlSession.selectOne("chatMapper.fullMessageListCount", loginUserNum);
	}

	public int afterPayInsertChatReserv(SqlSessionTemplate sqlSession, Map<String, Object> paraMap) {
		return sqlSession.insert("chatMapper.afterPayInsertChatReserv", paraMap);
	}

	public int upreadHowMany(SqlSessionTemplate sqlSession, int receiverNum) {
		return sqlSession.selectOne("chatMapper.upreadHowMany", receiverNum);
	}

	
	
	

}
