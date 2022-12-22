<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 최신글보기</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	
</head>
<body>

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> / </li>
                <li><a href="#">둘러보기</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">Q&A최신글</a></li>
            </ul>
        </div>

        <div class="bn_boardlist mt-2">
            <table class="table">
                <thead>
                  <tr class="text-teal-100">
                    <div class="col-lg-3">
                        <th scope="col">해결되었어요</th>
                        <th scope="col">글번호</th>
                    </div>
                    <th scope="col" class="col-lg-4">제목</th>
                    <th scope="col" class="col-lg-1">글쓴이</th>
                    <th scope="col" class="col-lg-1">답변수</th>
                    <th scope="col" class="col-lg-1">조회수</th>
                    <th scope="col" class="col-lg-2">날짜</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${respMap.board}" var="b" varStatus="bi" >
	                    <tr>
	                    	<c:if test="${respMap.isSolved[bi.index]  eq 'Y'}">
	                        	<th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square-fill"></i></th>
	                        </c:if>
	                    	<c:if test="${respMap.isSolved[bi.index]  eq 'N'}">
	                        	<th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square"></i></th>
	                        </c:if>
	                        <td>${b.boardNum}</td>
	                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${b.boardTitle}</td>
	                        <td>${respMap.writerInfo[bi.index].info}</td>
	                        <td>${respMap.answerCount[bi.index]}</td>
	                        <td>${b.boardView }</td>
	                        <td>${b.boardCreateDate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            <div class="product__pagination blog__pagination d-flex justify-content-center mt-3 ">
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>

            <div class="row d-flex justify-content-center">
                <div class="input-group mt-3 col-lg-6">
                    <select class="form-select form-select-sm bn_detail-search">
                        <option selected>카테고리 선택</option>
                        <option value="제목내용">제목+내용</option>
                        <option value="제목">제목</option>
                        <option value="내용">내용</option>
                        <option value="글쓴이">글쓴이</option>
                    </select>
                    <input type="text" class="form-control" id="bn_detail-search-point" placeholder="내용을 입력하세요">
                    <button class="btn bn_btn_search2" >검색</button>
                </div>
            </div>
    </div>
</body>
</html>