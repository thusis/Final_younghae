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
			<h3><strong>신고 관리 페이지</strong></h3>
		</div>
		<hr>
		<div style="box-shadow: 0 4px 16px rgb(0 0 0 / 10%); height: 100%; border-radius: 30px; overflow: hidden;">
			<table class="table table-striped m-2" style="table-layout:fixed; ">
				<thead>
				    <tr style="font-size:0.8rem; color:">
					   	<th scope="col">선택</th>
				        <th scope="col">게시판</th>
				        <th scope="col" class="col-lg-2">제목</th>
				        <th scope="col" class="col-lg-3" >내용</th>
				        <th scope="col">신고<br>사유</th>
				        <th scope="col">신고<br>날짜</th>
				        <th scope="col">처리<br>여부</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
				   	<tr>
						<td><input class="goToDelete" type="checkbox" name="boardNum" value="${list.declaration.boardNum}-${list.declaration.declNum}"></td>
						<td>
						<c:if test="${ list.board.boardType eq 5 }">질문</c:if>
						<c:if test="${ list.board.boardType eq 8 }">응답</c:if>
						<c:if test="${ list.board.boardType eq 11 }">자유</c:if>
						<c:if test="${ list.board.boardType eq 12 }">자유</c:if>
						<c:if test="${ list.board.boardType eq 13 }">자유</c:if>
						<c:if test="${ list.board.boardType eq 14 }">자유</c:if>
						</td>
						<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${ list.board.boardTitle }</td>
						<td class="col-lg-3" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${ list.board.boardContent }</td>
						
						<td>
						<c:if test="${ list.declaration.declContent eq 1 }">스팸홍보/도배글</c:if>
						<c:if test="${ list.declaration.declContent eq 2 }">음란물</c:if>
						<c:if test="${ list.declaration.declContent eq 3 }">욕설/생명경시/혐오/차별적 표현</c:if>
						<c:if test="${ list.declaration.declContent eq 4 }">불쾌한 표현</c:if>
						<c:if test="${ list.declaration.declContent eq 5 }">기타</c:if>
						</td>
						<td>${ list.declaration.declDate }</td>
						<td class="checkedTd" id="${list.declaration.boardNum}-${list.declaration.declNum}" style="font-weight:700;">
						<c:if test="${ list.declaration.declStatus eq 'Y' }">O</c:if>
						<c:if test="${ list.declaration.declStatus ne 'Y' }">X</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
		    </table>
	    </div>
	    <br>
	    
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
	    
	    
		<div class="row align-items">
		    <div class="col"></div>
		    <button onclick="deleteBoard()" class="btn btn-sm btn-primary col-lg-1">선택 게시글 비공개 처리</button>
		    <div class="col-1"></div>
		</div>
    </div>
    
    <script>
	    function deleteBoard(){
	    	const checkBoxes=document.getElementsByClassName('goToDelete');
	    	const arr = [];
	    	for(const checkBox of checkBoxes){
	    		if(checkBox.checked==true){
	    			arr.push(checkBox.value);
	    		}
	    	}
	    	console.log(arr);
	    	$.ajax({
	    		url:'${contextPath}/deleteDeclaredBoard.ad',
	    		type : 'POST',
	    		traditional : true,
	    		data : {
	    			parameter : arr
	    		},
	    		success : (data)=>{
	    			console.log(data);
	    			
	    	    	for(const checkBox of checkBoxes){
	    	    		if(checkBox.checked==true){
	    	    			const idCheck = checkBox.value;
	    	    			console.log(checkBox.parentNode.parentNode);
	    	    			const checkedTd = document.getElementById(idCheck);
	    	    			checkedTd.innerText = 'O';
	    	    		}
	    	    		checkBox.checked = false;
	    	    	}
	    			// x -> 완료 로 바꿔야함
	    		},
	    		error : (data)=>{
	    			alert('실패');
	    		}
	    	}); // ajax 끝
	    } // 신고된 게시글 삭제 끝
    </script>

</body>
</html>