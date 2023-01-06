<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>생일 이벤트</title>

<!--Soyeon-->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">

</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<br>
	<br>
	<h4 id="eventTitle">✨🎉🎂영해의 생일 이벤트 🍰🎉✨</h4>

	<hr width="80%" style="border: 2px solid #24E082;" noshade />
	<br>
	<br>
	<div class="attendance">
		<img src="resources/img/event/birth2.png"
			style="width: 800px; height: 800px;">
	</div>

	<br>
	<br>

	<!--이벤트 버튼-->
	<div id="eventBirthdayBtn">
		<a href="#" class="btn-3d yellow" data-bs-toggle="modal"   id="birthAward">생일 보상받기</a>
	</div>
	
		<!-- 생일보상 / 1 -->
        <div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/cake.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 80px; color:orange;" >🎂생일기념 쿠폰이 지급되었습니다🎂</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
	
		<!-- 생일보상 / 2 -->
        <div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/sweat.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 80px; color:orange;" >생일쿠폰 발급 실패😥</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
	
		<!-- 생일보상 / 3 -->
        <div class="modal fade" id="modal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/sweat.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 140px; color:orange;" >생일자가 아닙니다 😥</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
	
		<!-- 생일보상 / 4 -->
        <div class="modal fade" id="modal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/sweat.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 80px; color:orange;" >이미 쿠폰을 발급 받으셨습니다😥</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
 
	<br>
	<br>
 		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
	
	
	
	<!-- 보상받기 버튼 효과 -->
		$('.yellow').click(function(event) {
			event.preventDefault();
		});
	
	<!-- 생일보상 -->
	document.getElementById('birthAward').addEventListener('click', function() {
		console.log("생일보상버튼");
		$.ajax({
			url:'${contextPath}/birthdayEvent.ev',
		 	data: {userNum:'${loginUser.userNum}'},
		 	success: (data) => {
		 		if(data == 1) {
		 			$('#modal1').modal('show');
		 			console.log("생일 쿠폰 지급 완료");
		 		} else if(data == 2) {
		 			$('#modal2').modal('show');
		 			console.log("생일 쿠폰 발급 실패");
		 		} else if(data == 3) {
		 			$('#modal3').modal('show');
		 			console.log("생일자가 아닙니다");
		 		} else if(data == 4) {
		 			$('#modal4').modal('show');
		 			console.log("이미 쿠폰을 발급받으셨습니다");
		 		} 
		 	},
		 	error: (data) => {
		 		console.log("생일보상 요청 실패")
		 		alert("요청 실패하였습니다")
		 	},
			 complete : (data)=>{
				 console.log("생일보상 요청완료")
			 }
		});
	});

	</script>



</body>
</html>