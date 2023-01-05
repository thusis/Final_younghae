package com.kh.young.qna.service;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.young.chat.dto.ChatPaymentRespDto;
import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Clip;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Reply;
import com.kh.young.qna.dao.QaDao;
import com.kh.young.qna.dto.AnswerRespDto;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.dto.ReplyRespDto;
import com.kh.young.qna.dto.SupplementRespDto;

@Service("QaService")
public class QaServiceImpl implements QaService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QaDao qdao;

	/**간이로그인**/
	@Override
	public void setLoginUser(Integer userNum, HttpServletRequest request) {
		Member loginMember = qdao.setLoginUser(sqlSession,userNum);
		request.getSession().setAttribute("loginUser", loginMember);
	}
	
	/**내 질문목록**/
	@Override
	public ArrayList<QuestionRespDto> getMyQna(HttpServletRequest request) { 
		
//		int userNum = ((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum();
		int userNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
		ArrayList<QuestionRespDto> myQuestions = qdao.getMyQuestions(sqlSession,userNum);
	
		System.out.println("test"+myQuestions);

		return myQuestions;
	}

	@Override
	public int getListCount() {
		return qdao.getListCount(sqlSession);
	}

	@Override
	public ArrayList<QuestionRespDto> getQuestionList(Integer page, int listCount) {
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<QuestionRespDto> questionList = qdao.selectQuestionList(sqlSession, pi);
		
		for(QuestionRespDto q : questionList) {
			q.setWriterInfo(
					writerInfoToString(getWriterInfoMap(q.getBoard().getUserNum()))
					);
		}
		return questionList;
	}
	
	private Map getWriterInfoMap(int userNum) {
		return qdao.getWriterInfoMap(sqlSession, userNum);
	}
	
	/**글쓴이 정보 세팅 ex) 20대 / 남 **/
	private String writerInfoToString(Map paramap) {
		
		String info = "";
		
		Date thisyear = new Date(System.currentTimeMillis());
		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
		
		int currentYear = Integer.parseInt(yyyy.format(thisyear));
		
		int birthYear = Integer.parseInt(paramap.get("USER_BIRTH").toString().split("-")[0]);
		int age = currentYear - birthYear + 1;
		info = (age/10) + "0 대";
		
		String gender = ((String) paramap.get("USER_GENDER")).trim().toString();
		
		if(gender.equals("M")) { info += " / 남"; }
		else if(gender.equals("F")) { info += " / 여"; }
		
		return info;
	}

	@Override
	public ArrayList<QuestionRespDto> getTopTwo() {
		ArrayList<QuestionRespDto> topTwo = qdao.getTopTwo(sqlSession);
		
		for(QuestionRespDto q : topTwo) {
			q.setScrapListSize(
					getScrapCount(q.getBoard().getBoardNum())
					);
			q.setWriterInfo(
					writerInfoToString(getWriterInfoMap(q.getBoard().getUserNum()))
					);
			
			q.getBoard().setBoardContent(
					boardContentToString(q.getBoard().getBoardContent())
					);
			if(q.getAnswerList().size() > 0) {
				q.getAnswerList().get(0).getBoard().setBoardContent(
						boardContentToString(q.getAnswerList().get(0).getBoard().getBoardContent())
						);
			}
		}
		return topTwo;
	}

	private String boardContentToString(String boardContent) {
		String str = boardContent;
//		String newStr2 = str.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		String newStr = str.replaceAll("<[^>]*>", " ");
		
		return newStr;
	}

	@Override
	public ArrayList<SupplementRespDto> searchSupplement(String keyword) {
		return qdao.searchSupplement(sqlSession, keyword);
	}
	
	@Override
	public int insertQuestion(QuestionInsertDto quest, HttpServletRequest request) {
//		quest.setUserNum(((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum());
		quest.setUserNum(((Member)request.getSession().getAttribute("loginUser")).getUserNum());
		
		MultipartFile attachment = quest.getAttachment();
		System.out.println("130+"+attachment);
		
		if(attachment.getOriginalFilename().trim().equals("") || attachment.getOriginalFilename()==null) { //값이 있으면 넘겨서 세팅하고
			quest.setAttachParam(null);
		} else {
			quest.setAttachParam(getAttachParam(attachment, request));
		}
		System.out.println("135+" +quest);
		return qdao.insertQuestion(sqlSession, quest);
	}

	@Override
	public boolean getAlreadyAnswered(int questionNum, HttpServletRequest request) {
		
//		int userNum = ((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum();
		int userNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
		
		QuestionRespDto qresp = qdao.selectQuestion(sqlSession, questionNum);
		for( AnswerRespDto answer : qresp.getAnswerList()) {
			if(userNum == answer.getBoard().getUserNum()) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int insertAnswer(QuestionInsertDto quest, HttpServletRequest request) {
//		quest.setUserNum(((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum());
		quest.setUserNum(((Member)request.getSession().getAttribute("loginUser")).getUserNum());
		
		MultipartFile attachment = quest.getAttachment();
		
		System.out.println(attachment);
		System.out.println(attachment.getOriginalFilename());
		
		if(attachment.getOriginalFilename().trim().equals("") || attachment.getOriginalFilename()==null) { //값이 있으면 넘겨서 세팅하고
			quest.setAttachParam(null);
		} else {
			quest.setAttachParam(getAttachParam(attachment, request));
		}
		System.out.println("226+"+quest.getAttachParam());
		
		return qdao.insertAnswer(sqlSession, quest);
	}

	private Attachment getAttachParam(MultipartFile attachment, HttpServletRequest request) {
		Attachment attachParam = new Attachment();
		attachParam.setAttachName(attachment.getOriginalFilename());
		String[] returnArr = saveFile(attachment, request);// returnArr[0] = savePath; returnArr[1] = rename;
		if(returnArr[1] != null) {
			attachParam.setAttachPath(returnArr[0]);
			attachParam.setAttachRename(returnArr[1]);
		}
		
		System.out.println("152+"+attachParam);
		return attachParam;
	}
	
	private String[] saveFile(MultipartFile attachment, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String rawname = attachment.getOriginalFilename();
		String rename = sdf.format(new Date(System.currentTimeMillis())) + ranNum + rawname.substring(rawname.lastIndexOf("."));
		String fileRoute = folder + "\\" + rename;
		
		try {
			attachment.transferTo(new File(fileRoute));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = rename;
		
		return returnArr;
	}

	@Override
	public QuestionRespDto selectQuestion(int boardNum, HttpServletRequest request) {
		
		QuestionRespDto qresp = qdao.selectQuestion(sqlSession, boardNum);
		qresp.setReplyList(getReplyList(boardNum));
		qresp.setWriterInfo(
				writerInfoToString(getWriterInfoMap(qresp.getBoard().getUserNum()))
		);
		System.out.println("서비스224"+qresp.getScrapList());

		for(AnswerRespDto answer : qresp.getAnswerList()) {
			answer.setReplyList(
					getReplyList(answer.getBoard().getBoardNum())
					);
		}
		
//		if((Member)request.getSession().getServletContext().getAttribute("loginUser") != null) {
//			int userNum = ((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum();
		if((Member)request.getSession().getAttribute("loginUser") != null) {
			int userNum = ((Member)request.getSession().getAttribute("loginUser")).getUserNum();
			
			if(qresp.getBoard().getUserNum() != userNum) {
				qdao.addViewCount(sqlSession, boardNum);
			} else {
				qdao.updateIsRead(sqlSession, boardNum);
			}
		}
		return qresp;
	}

	@Override
	public ExpertRespDto selectExpertResp(int userNum) {
		ExpertRespDto expertResp = qdao.selectExpertResp(sqlSession, userNum);
		String str1 = expertResp.getExpert().getExpertEstimate().split(",")[0];
		String str2 = expertResp.getExpert().getExpertEstimate().split(",")[1];
		String str = str2 + " 원 (" + str1 + "분당)";
		expertResp.getExpert().setExpertEstimate(str);
		expertResp.getExpert().setExpertProfile(
				expertProfileAddEnter(expertResp.getExpert().getExpertProfile())
				);
		return expertResp;
	}

	private String expertProfileAddEnter(String expertProfile) {
		String newStr = expertProfile.replaceAll("/", "<br>");
		System.out.println(newStr);
		return newStr;
	}

	@Override
	public ArrayList<QuestionRespDto> selectExpertQuestionList(int expertNum) {
		return qdao.selectExpertQuestionList(sqlSession, expertNum);
	}

	@Override
	public int insertReply(Reply r) {
		return qdao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<ReplyRespDto> getReplyList(int boardNum) {
		ArrayList<Reply> rList = qdao.getReplyList(sqlSession, boardNum);
		
		
		ArrayList<ReplyRespDto> replyList = new ArrayList<>();
		
		for(int i=0; i<rList.size();i++) {
			replyList.add(new ReplyRespDto( 
					rList.get(i), 
					writerInfoToString(
							getWriterInfoMap(
									rList.get(i).getUserNum()
									)
							) 
					));
		}
		
		System.out.println("서비스"+replyList);

		return replyList;
	}

	@Override
	public int deleteReply(int replyNum) {
		return qdao.deleteReply(sqlSession, replyNum);
	}

	@Override
	public int getScrapCount(int boardNum) {
		return qdao.getScrapCount(sqlSession,boardNum);
	}

	@Override
	public int setScrap(Clip clip) {
		return qdao.setScrap(sqlSession, clip);
	}

	@Override
	public int deleteScrap(Clip clip) {
		return qdao.deleteScrap(sqlSession,clip);
	}

	@Override
	public int updateQuestion(QuestionInsertDto quest, HttpServletRequest request) {
		return 0;
	}

	@Override
	public ArrayList<ExpertRespDto> selectExpertList(Integer page, int listCount) {
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<ExpertRespDto> erespList = qdao.selectExpertList(sqlSession, pi);
		System.out.println("q서비스 332: "+erespList);
		return erespList;
	}

	@Override
	public int getExpertsListCount() {
		return qdao.getExpertsListCount(sqlSession);
	}

	@Override
	public ChatPaymentRespDto getChatPaymentResp(String info) {
		
		ChatPaymentRespDto chatResp = new ChatPaymentRespDto();
		int chatroomId = Integer.parseInt(info.split("_")[0]);
		int expertNum = Integer.parseInt(info.split("_")[1]);
		int generalUserNum = Integer.parseInt(info.split("_")[2]);
		
		chatResp.setChatroom(getChatroom(chatroomId));
		chatResp.setGeneralUser(getGeneralUser(generalUserNum));
		chatResp.setExpertUser(selectExpertResp(expertNum));
		
		return chatResp;
	}

	private Chatroom getChatroom(int chatroomId) {
		return qdao.getChatroom(sqlSession, chatroomId);
	}
	
	private Member getGeneralUser(int generalUserNum) {
		return qdao.getGeneralUser(sqlSession, generalUserNum);
	}

	@Override
	public int deleteQuestion(int boardNum) {
		return qdao.deleteQuestion(sqlSession, boardNum);
	}

	@Override
	public int updateIsSolved(int boardNum) {
		return qdao.updateIsSolved(sqlSession, boardNum);
	}
	
}
