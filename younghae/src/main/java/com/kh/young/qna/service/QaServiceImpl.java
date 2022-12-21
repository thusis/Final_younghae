package com.kh.young.qna.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Supplement;
import com.kh.young.qna.dao.QaDao;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;

@Service("QaService")
public class QaServiceImpl implements QaService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QaDao qdao;

	@Override
	public void setLoginUser(Integer userNum, HttpServletRequest request) {
		Member loginMember = qdao.setLoginUser(sqlSession,userNum);
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("loginUser", loginMember);
		System.out.println("서비스임플"+((Member)application.getAttribute("loginUser")).getUserId());
	}

	@Override
	public int getListCount() {
		return qdao.getListCount(sqlSession);
	}

	@Override
	public ArrayList<QuestionRespDto> selectQuestionList(Integer page, int listCount) {
		
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<QuestionRespDto> list = qdao.selectQuestionList(sqlSession, pi);
		return list;
	}

	@Override
	public Object getMyQna(HttpServletRequest request) {
		int userNum = ((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum();
		// 유저아이디로 검색 => (1)질문 수 (2)확인하지 않은 답변 여부 (3)최근 세 개 게시글의 [boardNum, 제목, 답변 수, 답변 확인 여부]
		int count = qdao.getMyQuestionCount(sqlSession, userNum);
		boolean isRead = qdao.getIsRead(sqlSession, userNum);
		HashMap<Integer, ArrayList> recentQuestions = qdao.getMyRecentQuestions(sqlSession, userNum);
		
		return null;
	}

	@Override
	public ArrayList<QuestionRespDto> getTopTwo() {
//		ArrayList<QuestionRespDto> toptwo = qdao.getToptwo(sqlSession);
//		return toptwo;
		return null;
	}

	@Override
	public int insertQuestion(QuestionInsertDto quest, HttpServletRequest request) {
		return 0;
	}

	@Override
	public ArrayList<Supplement> searchSupplement(String keyword) {
		return qdao.searchSupplement(sqlSession, keyword);
	}
	
}
