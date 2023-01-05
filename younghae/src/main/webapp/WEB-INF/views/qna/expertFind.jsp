<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 전문가 찾기</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	
</head>
<body>

    <div class="container">

        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li><b> / </b></li>
                <li><a href="#">전문가 찾기</a></li>
            </ul>
        </div>

        <div class="row mt-5">
            <div class="input-group col">
                <select class="form-select form-select-sm bn_detail-search ">
                    <option selected>카테고리 선택</option>
                    <option value="sortAnswer">답변 많은 순 보기</option>
                    <option value="sortActivity">최근 활동순 보기</option>
                    <option value="sortEnrolldate">최근 가입순 보기</option>
                </select>
            </div>
            <div class="col"></div>
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-light">전체</button>
                <button type="button" class="btn btn-light">의사만</button>
                <button type="button" class="btn btn-light">약사만</button>
            </div> 
        </div>
        <hr>
    </div>
<!-- =================================전문가 섹션=========================================== -->
        <section class="bn_pro">
            <div class="container">
			<c:set var="i" value="0" /><c:set var="j" value="2" /> <!-- 1행에 2열씩 정렬하기 위함(1) -->

            	<c:forEach items="${erespList}" var="eresp">
	            	<c:if test="${i%j == 0 }"><!-- 1행에 2열씩 정렬하기 위함(2) -->
	            		<div class="row">
	           		</c:if>
            		<div class="col-lg-6">
            		<div class="row bn_pro-box m-1">
					<div class="col-lg-7  align-self-center">
						<span  hidden="hidden">${eresp.expert.userNum }</span>
	                    <h5 class="bn_pro-name">
		                    <span >${eresp.member.userName}&nbsp;&nbsp;</span>
		                    <span  class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">
		                    <c:if test="${eresp.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
		                    <c:if test="${eresp.expert.expertSort.trim() eq 'D' }">의사</c:if>
		                    <c:if test="${eresp.expert.expertSort.trim() eq 'C' }">약사</c:if>
		                    </span>
	                    </h5>
	                    <span class="bn_pro-info">답변수 ${eresp.answerListSize} 개</span><br>
	                    <span class="bn_pro-info">전문과목 ${eresp.expert.expertMedi}</span><br>
	                    <span class="bn_pro-info">
		                    <span>소속 : 
		                     <c:if test="${eresp.expert.expertDept.trim() eq 'N' }">선택안함</c:if>
		                     <c:if test="${eresp.expert.expertDept.trim() ne 'N' }">${eresp.expert.expertDept}&nbsp;&nbsp;</c:if>
		                    </span>
		                    <span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">
							<a style="text-decoration:none; color:white;" href="${contextPath}/experthospital.qa?expertNum=${eresp.member.userNum}">
		                      <c:if test="${eresp.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
		                      <c:if test="${eresp.expert.expertSort.trim() eq 'D' }">병원</c:if>
		                      <c:if test="${eresp.expert.expertSort.trim() eq 'C' }">약국</c:if>
		                     정보 보기</a>
		                    </span>
	                    </span><br>
					</div>
					<div class="col-3 align-self-center">
						<c:if test="${eresp.eattach != null }">
						<div class="bn_pro-profile">
							<img style="border-radius:25rem;" src="${contextPath}/resources/uploadFiles/${eresp.eattach.attachRename}"alt="전문가프로필">
						</div>
						</c:if>
						<c:if test="${eresp.eattach == null }">
						<div style="vertical-align:middle; width:7rem; height:7rem; border-radius: 25rem; background-color:#DBE2EA; text-align:center; vertical-align:middle;">
							<img style="margin-top:2.5rem;"src="resources/img/logo_white.svg" style="width:6rem;"alt="흰로고">
						</div>
						</c:if>
					</div>
					
					<div class="col-2 align-self-center">
						<div class="bn_pro-icon" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Disabled popover"><a style="text-decoration:none; color:white;" href="${contextPath}/expertprofile.qa?expertNum=${eresp.member.userNum}"><i class="bi bi-list-ul"></i></a></div>
						<c:if test="${loginUser != null }">
							<div class="bn_pro-icon" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Disabled popover"><a style="text-decoration:none; color:white;" href="${contextPath}/open.ch?expertNum=${eresp.member.userNum}"><i class="bi bi-send"></i></a></div>
						</c:if>
					</div>
					
					
				</div>
				</div>
			    	<c:if test="${i%j ==  j-1 }">
            		</div><!-- 1행에 2열씩 정렬하기 위함(3) -->
            		</c:if>
           		<c:set var="i" value="${i+1 }" /><!-- 1행에 2열씩 정렬하기 위함(4) -->
            </c:forEach>
    </div>
    </section>
    <br>

    <div class="container">
		<div class="product__pagination blog__pagination d-flex justify-content-center mt-3 ">
                   
 		<c:url var="goBack" value="${ loc }">
 			<c:param name="page" value="${pi.currentPage-1 }"></c:param>
 		</c:url>
 		<a href="${goBack}" aria-label="Previous">
 			<span aria-hidden="true"><i class="fa-solid fa-arrow-left-long"></i></span>
 		</a>
      	
      	<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
      		<c:url var="goNum" value="${loc }">
      			<c:param name="page" value="${p }"></c:param>
      		</c:url>
       		<a href="${goNum }">${p }</a>	
      	</c:forEach>
      	
   		<c:url var="goNext" value="${ loc }">
   			<c:param name="page" value="${pi.currentPage+1 }"></c:param>
   		</c:url>
   		<a href="${goNext}" aria-label="Next">
   			<span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
   		</a>
                   
        </div>
        
      <div class="row d-flex justify-content-center">
          <div class="input-group mt-3 col-lg-6 col-md-3">
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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script>
//1 카테고리 선택 : 답변 많은 순, 최근 활동순, 최근 가입순
//2 전체 선택, 의사만 선택, 약사만 선택
//3 검색 : 제목+내용, 제목, 내용, 이름


</script>
</body>
</html>