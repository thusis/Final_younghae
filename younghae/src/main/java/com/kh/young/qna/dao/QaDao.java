package com.kh.young.qna.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Clip;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Reply;
import com.kh.young.qna.dto.AnswerRespDto;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.dto.SupplementRespDto;

@Repository("QaDAO")
public class QaDao {

	// 컨트롤러에서 reqDto ㅡ> 서비스에서 reqDtoㅡ>entity ㅡ> entity를 DAO에 넣고 반환값을 다시 서비스로 ㅡ> 그 반환값을 resDto 컨트롤러
	
	public Member setLoginUser(SqlSessionTemplate sqlSession, Integer userNum) {
		return sqlSession.selectOne("qnaMapper.login", userNum);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}

	public ArrayList<QuestionRespDto> getMyQuestions(SqlSessionTemplate sqlSession, int userNum) {
		ArrayList<QuestionRespDto> myQuestions = (ArrayList)sqlSession.selectList("qnaMapper.getMyQuestions", userNum);

		for(QuestionRespDto myQuest : myQuestions) {
			myQuest.setSresp(getQuestSresp(sqlSession, myQuest.getBoard().getBoardNum()));
			
			for(AnswerRespDto answer : myQuest.getAnswerList()) {
				answer.setSresp(getQuestSresp(sqlSession, answer.getBoard().getBoardNum()));
				answer.setEresp(selectExpertResp(sqlSession, answer.getBoard().getUserNum()));
			}
		}
		
		return myQuestions;
	}
	
	public SupplementRespDto getQuestSresp(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("qnaMapper.selectQuestSresp", boardNum);
	}
	
	public SupplementRespDto getAnswerSresp(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("qnaMapper.selectAnswerSresp", boardNum);
	}

	public ArrayList<QuestionRespDto> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQuestionList", null, rowBounds);
	}

	public Map getWriterInfoMap(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("qnaMapper.getWriterInfoMap", userNum);
	}

	public ArrayList<QuestionRespDto> getTopTwo(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("qnaMapper.getTopTwo");
	}

	public ArrayList<SupplementRespDto> searchSupplement(SqlSessionTemplate sqlSession, String keyword) {
		keyword="%"+keyword+"%";
		return (ArrayList)sqlSession.selectList("qnaMapper.searchSupplement", keyword);
	}

	public int insertQuestion(SqlSessionTemplate sqlSession, QuestionInsertDto quest) {
		return sqlSession.insert("qnaMapper.insertQuestion", quest);
	}

	public QuestionRespDto selectQuestion(SqlSessionTemplate sqlSession, int boardNum) {
		QuestionRespDto qresp = sqlSession.selectOne("qnaMapper.selectQuestion", boardNum);
		qresp.setSresp(getQuestSresp(sqlSession, qresp.getBoard().getBoardNum()));
		
		for(AnswerRespDto answer : qresp.getAnswerList()) {
			answer.setSresp(getQuestSresp(sqlSession, answer.getBoard().getBoardNum()));
			answer.setEresp(selectExpertResp(sqlSession, answer.getBoard().getUserNum()));
		}
		
		return qresp;
	}

	public void addViewCount(SqlSessionTemplate sqlSession, int boardNum) {
		sqlSession.update("qnaMapper.addViewCount", boardNum);
	}

	public void updateIsRead(SqlSessionTemplate sqlSession, int boardNum) {
		sqlSession.update("qnaMapper.updateIsRead", boardNum);
	}

	public int insertAnswer(SqlSessionTemplate sqlSession, QuestionInsertDto quest) {
		System.out.println(quest);
		return sqlSession.insert("qnaMapper.insertAnswer", quest);
	}

	public ExpertRespDto selectExpertResp(SqlSessionTemplate sqlSession, int userNum) {
		ExpertRespDto eresp = sqlSession.selectOne("qnaMapper.selectExpertResp", userNum);
		eresp.setAnswerListSize(selectExpertAnswerListSize(sqlSession, userNum));
		return eresp;
	}

	private int selectExpertAnswerListSize(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("qnaMapper.selectAnswerListSize", userNum);
	}
	
	private Attachment selectEattach(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("qnaMapper.selectEattach", userNum);
	}

	public ArrayList<QuestionRespDto> selectExpertQuestionList(SqlSessionTemplate sqlSession, int expertNum) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQuestionListByExpertNum", expertNum);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("qnaMapper.insertReply", r);
	}

	public ArrayList<Reply> getReplyList(SqlSessionTemplate sqlSession, int boardNum) {
		return (ArrayList)sqlSession.selectList("qnaMapper.getReplyList", boardNum);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNum) {
		return sqlSession.update("qnaMapper.updateReplyToDelete", replyNum);
	}

	public int getScrapCount(SqlSessionTemplate sqlSession, int boardNum) {
		List<Object> scrapList = sqlSession.selectList("qnaMapper.selectScrapList", boardNum);
		return scrapList.size();
	}

	public int setScrap(SqlSessionTemplate sqlSession, Clip clip) {
		return sqlSession.insert("qnaMapper.insertScrap", clip);
	}

	public int deleteScrap(SqlSessionTemplate sqlSession, Clip clip) {
		return sqlSession.delete("qnaMapper.deleteScrap",clip);
	}

	public int getExpertsListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.getExpertsListCount");
	}

	public ArrayList<ExpertRespDto> selectExpertList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<ExpertRespDto> erespList = (ArrayList)sqlSession.selectList("qnaMapper.selectExpertList", null, rowBounds);
		for(ExpertRespDto eresp : erespList) {
			int userNum = eresp.getMember().getUserNum();
			eresp.setAnswerListSize(selectExpertAnswerListSize(sqlSession, userNum));
		}
		return erespList;
	}

	public Chatroom getChatroom(SqlSessionTemplate sqlSession, int chatroomId) {
		return sqlSession.selectOne("chatMapper.getChatroom", chatroomId);
	}

	public Member getGeneralUser(SqlSessionTemplate sqlSession, int generalUserNum) {
		return sqlSession.selectOne("chatMapper.getGeneralUser", generalUserNum);
	}

	public int deleteQuestion(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.update("qnaMapper.deleteQuestion", boardNum);
	}

	public int updateIsSolved(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.update("qnaMapper.updateIsSolved", boardNum);
	}

}
