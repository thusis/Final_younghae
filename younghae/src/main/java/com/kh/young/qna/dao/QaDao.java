package com.kh.young.qna.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Supplement;
import com.kh.young.qna.dto.QuestionRespDto;

@Repository("QaDAO")
public class QaDao {

	public Member setLoginUser(SqlSessionTemplate sqlSession, Integer userNum) {
		return sqlSession.selectOne("qnaMapper.login", userNum);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}

	public ArrayList<QuestionRespDto> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<QuestionRespDto> list = (ArrayList)sqlSession.selectList("qnaMapper.selectQuestionList", null, rowBounds);
		return list;
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

	public ArrayList<QuestionRespDto> getToptwo(SqlSessionTemplate sqlSession) {
		List<Integer> tops = sqlSession.selectList("qnaMapper.getToptwoNum");
		return (ArrayList)sqlSession.selectList("qnaMapper.getToptwo", tops);
	}

	public ArrayList<Supplement> searchSupplement(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("qnaMapper.searchSupplement", keyword);
	}



}
