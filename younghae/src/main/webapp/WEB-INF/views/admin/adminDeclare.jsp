<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 신고관리</title>

    <script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"crossorigin="anonymous"></script>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">

</head>
<body>

    <div class="container">
		<div class="row text-center mb-1 d-flex align-items-center" style="margin-top:50px;">
			<h1><strong>신고 관리 페이지</strong></h1>
			<div class="text-center col-lg-6 align-content-center">
				<div class="col-lg-6">
					<h3>신고사유 구분</h3>
				    <ul style="list-style:none;">
				         <li>1 . 스팸홍보/도배글</li>
				         <li>2 . 음란물</li>
				         <li>3 . 욕설/생명경시/혐오/차별적 표현</li>
				         <li>4 . 불쾌한 표현</li>
				         <li>5 . 기타</li>
				     </ul>
				 </div>
			</div>
		</div>
		<hr>
		<div style="box-shadow: 0 4px 16px rgb(0 0 0 / 10%); height: 100%; border-radius: 30px; overflow: hidden;">
			<table class="table table-striped m-2" style="table-layout:fixed; ">
				<thead>
				    <tr style="font-size:0.8rem; color:">
				   	<th scope="col">선택</th>
				       <th scope="col">신고<br>번호</th>
				       <th scope="col" style="font-weight:600; color:#0d6efd;">신고당한<br>사용자</th>
				        <th scope="col">게시판</th>
				        <th scope="col" class="col-lg-2">제목</th>
				        <th scope="col" class="col-lg-5" >내용</th>
				        <th scope="col">신고<br>사유</th>
				        <th scope="col">처리<br>여부</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
				   	<tr>
						<td><input class="goToDelete" type="checkbox" name="boardNum" value="${list.boardNum}-${list.declNum}"></td>
						<td>${ list.index }</td>
						<td>
						<c:if test="${ list.boardType eq 1 }">질문</c:if>
						<c:if test="${ list.boardType eq 2 }">응답</c:if>
						<c:if test="${ list.boardType eq 3 }">자유</c:if>
						</td>
						<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${ list.boardTitle }</td>
						<td class="col-lg-3" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${ list.boardContent }</td>
						
						<td>
						<c:if test="${ list.declContent eq 1 }">스팸홍보/도배글</c:if>
						<c:if test="${ list.declContent eq 2 }">음란물</c:if>
						<c:if test="${ list.declContent eq 3 }">욕설/생명경시/혐오/차별적 표현</c:if>
						<c:if test="${ list.declContent eq 4 }">불쾌한 표현</c:if>
						<c:if test="${ list.declContent eq 5 }">기타</c:if>
						</td>
						<td>
						<c:if test="${ list.declareStatus eq Y }">O</c:if>
						<c:if test="${ list.declareStatus ne Y }">X</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
		    </table>
	    </div>
	    <br>
		<div class="row align-items">
		    <div class="col"></div>
		    <button onclick="deleteBoard()" class="btn btn-sm btn-primary col-lg-1">선택 게시글 비공개 처리</button>
		    <div class="col-1"></div>
		</div>
    </div>
    
    <script>
    function deleteBoard(){
    	const checkBoxes=document.getElementsByClassName('goToDelete')
    	const arr = [];
    	for(const checkBox of checkBoxes){
    		if(checkBox.checked==true){
    			arr.push(checkBox.value);
    		}
    	}
    	console.log(arr);
    	$ajax({
    		url:'${contextPath}/deleteDeclaredBoard.ad',
    		data : arr,
    		type : "post",
    		success : (data)=>{
    			conole.log(data);
    		}
    	})
    }
    
    </script>

</body>
</html>