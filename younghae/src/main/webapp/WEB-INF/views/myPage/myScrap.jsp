<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>나의 스크랩</title>
<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
<style>
.bn_index ul li {
	list-style: none;
	position: relative;
	display: inline-block;
}

.bn_index a {
	color: black;
}

.bn_index li:last-child a {
	font-weight: 800;
	color: #FD9F28;
}
.product__item__pic {
    height: 200px;
    position: relative;
    overflow: hidden;
}
h1, h2, h3, h4, h5{
         font-family: 'IBM Plex Sans KR', sans-serif;
      }
      .contact a {
         font-family: 'IBM Plex Sans KR', sans-serif;
         font-size: 18px;
         text-decoration: none;
         text-transform: uppercase;
         background: #18e06f;
         display: inline-block;
         padding: 15px 30px;
         border-radius: 5px;
         font-weight: 500;
         color: #fff;
         margin-top: 20px;
      }

</style>
 <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
</head>

<body>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">내 스크랩 관리</a></li>
		</ul>
	</div>
	<section class="product spad" style="margin-top: -2%;">
		<div class="container">
			<div class="section-title"
				style="padding: 30px 0 10px 0; margin-bottom: 0px;">
				<h4>내 스크랩 관리</h4>
				<div style="display: block;">
					<hr style="width: 50vw; background-color: #24E082;">
				</div>
			</div>
			<div class="row justify-content-center">
			<c:if test="${ myClip.size() !=0 }">
                <c:forEach items="${myClip}" var="i">
                    <div class="col-lg-2 col-md-1 col-sm-1" style="margin-left: 30px;">
                        <div class="product__item">
                        	<input type="hidden" name="boardNum" value="${ i.boardNum }">
	                   		<input type="hidden" name="boardUserNum" value="${ loginUser.userNum }">
                            <div class="product__item__pic set-bg">
                                <img src="${i.attachName }" style="margin-top: 30px; ">
                            </div>
                            <div class="product__item__text" style="text-align: left;">
                                <h6 style="display: inline-block;">
                                    <a style="font-size:20pt;" id="boardNum">${i.boardNum}</a>
                                </h6>
                                <h5 class="title">${i.boardTitle }</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </c:if>
                <section class="contact spad">
                <c:if test="${ myClip.size() ==0 }">
                	<div class="section-title" style="padding: 5rem 5rem 5rem 5rem; border:0.5rem solid #24E082;">
                   <h2> 현재 스크랩한 글이없습니다. </h2>
                   <a href="${contextPath}/storyList.st">
					스크랩하러가기.
                   <img src="resources/img/logo_pill_white.svg" alt="흰로고">
                   </a>
               </div>
                </c:if>
                </section>
            </div>
            <c:if test="${ myClip.size() !=0 }">
                <div class="col-lg-12 text-center" style="margin-top: 1%;">
            <div class="product__pagination blog__pagination">
               <c:url var="goBack" value="${ loc }">
                  <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
               </c:url>
               <c:if test="${ pi.currentPage > 1 }">
                  <a href="${ goBack }" aria-label="Previous"><i class="fa fa-long-arrow-left"></i></a>
               </c:if>
               <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                  <c:url var="goNum" value="${ loc }">
                     <c:param name="page" value="${p}"></c:param>
                  </c:url>
                  <a href="${ goNum }">${ p }</a>
               </c:forEach>
               <c:url var="goNext" value="${ loc }">
                  <c:param name="page" value="${ pi.currentPage+1 }"></c:param>
               </c:url>
               <c:if test="${ pi.currentPage < pi.endPage }">
               <a href="${ goNext }"><i class="fa fa-long-arrow-right"></i></a>
               </c:if>
            </div>
         </div>
         </c:if>
         </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script>
    window.onload=()=>{
    	// 이미지, 제목 클릭시 상세보기로 넘기기
		$('.product__item').on('click', function(){
//				console.log($(this).children('input')[1].value);
			const boardNum = $(this).children('input')[0].value;
			const userNum = $(this).children('input')[1].value;
			
			location.href = '${contextPath}/selectStory.st?boardNum='+boardNum+'&userNum='+userNum+'&page='+${pi.currentPage};
		});
        
		 $('.title').on('click', function(){
//				console.log($(this).parents().children('.blog__item__pic').children()[0].value);
			const boardNum = $(this).parents().children('.product__item').children()[0].value;
			const userNum = $(this).parents().children('.product__item').children()[1].value;
			
			location.href = '${contextPath}/selectStory.st?boardNum='+boardNum+'&userNum='+userNum+'&page='+${pi.currentPage};
		}); 
    }
    </script>

</body>

</html>