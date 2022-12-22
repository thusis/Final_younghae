package com.kh.young.qna.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Supplement;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.SupplementRespDto;

@Repository("QaDAO")
public class QaDao {

	public Member setLoginUser(SqlSessionTemplate sqlSession, Integer userNum) {
		return sqlSession.selectOne("qnaMapper.login", userNum);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}

	public HashMap<String, ArrayList> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Board> boardList = (ArrayList)sqlSession.selectList("qnaMapper.selectBoardList", null, rowBounds);
		ArrayList<Map> writerInfo = new ArrayList();
		ArrayList<Integer> answerCount = new ArrayList();
		ArrayList<String> isSolved = new ArrayList();
		
		for(int i=0; i<boardList.size(); i++) {
			int userNum = boardList.get(i).getUserNum();
			Map result = sqlSession.selectOne("qnaMapper.selectWriterInfo",userNum);
			writerInfo.add(result);

			int boardNum = boardList.get(i).getBoardNum();
//			int count = sqlSession.selectOne("qnaMapper.selectAnswerCount", boardNum);
			answerCount.add(sqlSession.selectOne("qnaMapper.selectAnswerCount", boardNum));
//			String solved = sqlSession.selectOne("qnaMapper.getIsSolved", boardNum);
			isSolved.add(sqlSession.selectOne("qnaMapper.getIsSolved", boardNum));
		}
		
		HashMap<String, ArrayList> respMap = new HashMap<>();
		respMap.put("board", boardList);
		respMap.put("writerInfo", writerInfo);
		respMap.put("answerCount", answerCount);
		respMap.put("isSolved", isSolved);
		
		return respMap;
	}

	public int getMyQuestionCount(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("qnaMapper.getMyQuestionCount", userNum);
	}

	public boolean getIsRead(SqlSessionTemplate sqlSession, int userNum) {
		boolean isRead = true;
		if((Integer)sqlSession.selectOne("qnaMapper.getIsRead", userNum)> 0) {
			isRead = false; //=>초록불
		}
		return isRead;
	}

	public HashMap<Integer, ArrayList> getMyRecentQuestions(SqlSessionTemplate sqlSession, int userNum) {
		return (HashMap<Integer, ArrayList>) sqlSession.selectList("qnaMapper.getMyRecentQuestions", userNum);
	}

	public ArrayList<Supplement> searchSupplement(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("qnaMapper.searchSupplement", keyword);
	}

	public int insertQuestion(SqlSessionTemplate sqlSession, QuestionInsertDto quest) {
		return sqlSession.insert("qnaMapper.insertQuestion", quest);
	}

	public HashMap<String, ArrayList> getTop(SqlSessionTemplate sqlSession) {
		
		ArrayList<Board> board = (ArrayList)sqlSession.selectList("qnaMapper.getTopTwo");
		ArrayList<Map> writerInfo = new ArrayList();
		
		for ( int i=0; i<2; i++) {
			int userNum = board.get(i).getUserNum();
			writerInfo.add(sqlSession.selectOne("qnaMapper.selectWriterInfo",userNum));
		}
		
		HashMap<String, ArrayList> respMap = new HashMap<>();
		respMap.put("board", board);
		respMap.put("writerInfo", writerInfo);
		
		return respMap;
	}

	public Board selectQuestion(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("qnaMapper.selectQuestion", boardNum);
	}

	public void addViewCount(SqlSessionTemplate sqlSession, int boardNum) {
		sqlSession.update("qnaMapper.addViewCount", boardNum);
	}

	public void updateIsRead(SqlSessionTemplate sqlSession, int boardNum) {
		sqlSession.update("qnaMapper.updateIsRead", boardNum);
	}

	public SupplementRespDto selectSupplement(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("qnaMapper.selectSupplement", boardNum);
	}



}
