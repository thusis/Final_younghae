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
    <title>마이 페이지</title>
</head>

<body>
    <nav>
        <jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
    </nav>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-2" style="margin-left:-100px; margin-top:50px;">
                    <div class="hero__categories">
                        <ul>
                            <li><a href="#" onclick="location.href='${contextPath}/insertPage.su'">상품관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/adminMember.ad'">회원관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/adminCoupon.ad'">쿠폰관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/AdminReview.su'">리뷰관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/AdminStoryList.st'">이야기 관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/AdminwriteStory.st'">이야기 작성</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/adminDeclare.ad'">신고관리</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="section-title" style="padding: 30px 0 10px 0; margin-bottom: 0px;">
                        <h4>전문가 승인</h4>
                        <div style="display: block;">
                            <hr style="width: 50vw; background-color: #24E082;">
                        </div>
                    </div>
                    <div style="text-align: center;">
                        <img id="img" src="resources/uploadFiles/${ ExpertImage.attachRename }" style="height: 500px; width: 400px;">
                    </div>
                    <button type="button" class="btn btn-primary mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0); width:200px; margin-left:250px;" id="returnMember">확인</button>
                    <button type="button" class="btn btn-primary mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0); width:200px; margin-left:50px;" id="deleteMember">취소</button>
                    <input id="id" type="hidden" value="${ ExpertImage.serialNumber }">
                </div>
                    
            </div>
        </div>
    </section>
    <script>
    $("#returnMember").click(function(){
        
    	var no = document.getElementById('id').value;
		location.href= '${contextPath}/updateMember.ad?id='+no;
    		           
	});
    
    $("#deleteMember").click(function(){
        var no = document.getElementById('id').value;
    		
			location.href= '${contextPath}/deleteMember.ad?id='+no;
    		           
	});
    </script>
</body>

</html>