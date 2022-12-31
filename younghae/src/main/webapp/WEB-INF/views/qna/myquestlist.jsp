<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 내가 남긴 질문 더보기</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	
</head>
<body>

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> <b>/</b> </li>
                <li><a href="#">내가 남긴 질문 더보기</a></li>
            </ul>
        </div>
        
		<c:if test="${myQuest.size() eq 0 }">
			<div class="row">
				<div class="col-lg-10 bn_card-top">
					<h3><i class="bi bi-x-square-fill"></i>아직 작성한 질문이 없어요!</h3>
					<span>질문을 남겨 영양제에 대해 궁금한 점을 물어보세요!</span>
				</div>
			</div>
		</c:if>
		
		<c:if test="${myQuest.size() ne 0 }">
        <div class="bn_boardlist mt-2" style="background-color: #ffffff;">
            <table class="table" >
                <thead>
                  <tr class="text-teal-100">
                    <th scope="col">해결되었어요</th>
                    <th scope="col">글번호</th>
                    <th scope="col" class="col-lg-4">제목</th>
                    <th scope="col">글쓴이</th>
   	                <th scope="col">답변수</th>
                    <th scope="col">조회수</th>
                    <th scope="col" class="col-lg-2">날짜</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${myQuest}" var="q" >
	                    <tr class="questionTr">
	                    	<c:if test="${q.question.isSolved  eq 'Y'}">
	                        	<th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square-fill"></i></th>
	                        </c:if>
	                    	<c:if test="${q.question.isSolved eq 'N'}">
	                        	<th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square"></i></th>
	                        </c:if>
	                        <td>${q.board.boardNum}</td>
	                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${q.board.boardTitle}</td>
	                        <td>${q.writerInfo}</td>
	                        <td>${q.answerList.size()}</td>
	                        <td>${q.board.boardView }</td>
	                        <td>${q.board.boardCreateDate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        </c:if>

    </div>
</body>
</html>