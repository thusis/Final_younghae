<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석 이벤트</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>
<!--Soyeon-->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">

</head>
<body>
	<br>
	<br>
	<h4 id="eventTitle">✨🎯1월 출석체크 이벤트! !🎯✨</h4>

	<hr width="80%" style="border: 2px solid #24E082;" noshade />
	<br>
	<br>
	<div class="attendance">
		<img src="resources/img/event/attend1.png"
			 usemap="#attendanceMap" class="attendanceImg"/>
<!-- 			 <h2 class="attendanceCount">7</h2> 출석횟수 -->
		<map name="attendanceMap" id="attendanceMap" >
		<area shape="rect" coords="361, 854, 723, 946" style="cursor:pointer;">
		</map>
		<div style="left: 100px; width: 2400px; bottom: 80px; font-size: 2.2em; font-weight: bold; color:orange; position: absolute;">
			${atCount }
		</div>
	</div>
	<div class="attendance">
		<img src="resources/img/event/attend2.png"
			style="width: 1080px; height: 600px;">
	</div>

	<br>
	<br>
	
	<!-- 이벤트 버튼 -->
	<div id="eventAttendanceBtn">
		<a href="#" class="btn-3d purple"  data-bs-toggle="modal"  id="atAward">출석 보상받기</a>
	</div>
	
	     <!-- 출석체크 / 1 -->
        <div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/sweat.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 80px; color:orange;" >출석이벤트는 하루에 한번만 참여 가능합니다😥</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 출석체크 / 2 -->
        <div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/stamp.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 120px; color:orange;">❤ 출석체크가 완료되었습니다 ❤</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 출석체크 / 3 -->
        <div class="modal fade" id="modal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/sad.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 100px; color:#24E082;">출석체크에 실패하였습니다😥</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 출석보상 / 1 -->
        <div class="modal fade" id="modal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/firecracker.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 100px; color:#24E082;">알약 포인트 지급이 완료되었습니다</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 출석보상 / 2 -->
        <div class="modal fade" id="modal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/sad.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 100px; color:#24E082;">출석체크에 실패하였습니다</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 출석보상 / 3 -->
        <div class="modal fade" id="modal6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/sad.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 100px; color:#24E082;">이미 포인트 지급이 완료되었습니다</b>
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
	
	<script type="text/javascript" >
	
				<!-- 보상받기 버튼 효과 -->
				$('.purple').click(function(event) {
					event.preventDefault();
				});

			 
			<!-- 출석하기 -->
			document.getElementById('attendanceMap').addEventListener("click", function() {
				console.log("출석하기 클릭 요청 들어오나?")
				$.ajax({
					url: '${contextPath}/insertAttendance.ev',
					data : {userNum:'${loginUser.userNum}'},
					success: (data) => {
						if(data == 1) {
//	 					var modal1 = document.getElementById('modal1');
							$('#modal1').modal('show');
							console.log("이미 출석체크 됨");
						} else if (data == 2) {
							$('#modal2').modal('show');
							console.log("출석체크 완료");
							window.location.reload();
						} else if (data == 3) {
							$('#modal3').modal('show');
							console.log("출석체크 실패");
						}
					},
					error: (data) => {
						
					}
				});
			});
			
			<!-- 출석보상 -->
			document.getElementById('atAward').addEventListener('click', function() {
				console.log("출석보상버튼");
				$.ajax({
					 url:'${contextPath}/attendanceEventAward.ev',
					 data: {userNum:'${loginUser.userNum}'},
					 success: (data)=>{
						 
						 console.log("출석보상요청성공")
						 console.log(data);
						 if(data == 1){
							 $('#modal4').modal('show');
							 console.log("포인트 지급 성공")
						 }else if(data == 0){
							 $('#modal5').modal('show');
							 console.log("포인트 지급 실패")
						 } else if(data == 2 )
							 //이미 포인트 지급된 경우
							 $('#modal6').modal('show');
					 },
					 error: (data)=>{
						 console.log("출석보상 요청실패")
						 alert("요청을 실패하였습니다")
					 },
					 complete : (data)=>{
						 console.log("출석보상 요청완료")
					 }
				});
			});
			

			
	</script>
</body>
</html>