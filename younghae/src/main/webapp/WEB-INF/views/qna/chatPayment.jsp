<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 상담 결제하기</title>

    <script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"crossorigin="anonymous"></script>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	<style>
		a{
		text-decoration:none;
		}
		h1, h2, h3, h4, h5, h6, span, p {
			font-family: 'IBM Plex Sans KR', sans-serif; 
		}
        .chatPayInfoBox{
            margin-top: 1rem;
            padding: 3rem;
            border: 0.2rem solid rgb(234, 234, 234);

        }
        .chatPayInfoDiv span, 
        .chatPayInfoDiv h3,
        .chatPayInfoDiv h4,
        .chatPayInfoDiv h5,
        .chatPayInfoDiv h6{
            display: inline-block;
            margin-top: 1rem;
        }
	</style>
	<!-- 결제 API -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
</head>
<body>

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>채팅</li>
                <li> <b>/</b> </li>
                <li><a href="#">채팅 상담 결제하기</a></li>
            </ul>
        </div>

    <div class="container">
        <div class="row" style="padding:10px 20px; ">
            <h3 style="padding-top:20px; maring-top: 70px;">${ loginUser.userName } 님의 채팅 상담 예약/결제 페이지</h3>
        </div>
        
        <div class="container chatPayInfoBox">
            <div class="row">
                <div class="col-lg-8 chatPayInfoDiv">
                    <h4> 전문가 회원 정보 </h4><br>
                    <span id="chatPayExpertNum" hidden="hidden">${chatResp.expertUser.member.userNum}</span>
                    <span id="chatPayChatroomId" hidden="hidden">${chatResp.chatroom.chatroomId}</span>

                    <span style="width:10rem;">전문가 회원명</span><h5>: ${chatResp.expertUser.member.userName}</h5><br>
                    <span style="width:10rem;">구분</span>
                    <h5>: 
	                 	<c:if test="${chatResp.expertUser.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
						<c:if test="${chatResp.expertUser.expert.expertSort.trim() eq 'D' }">의사</c:if>
						<c:if test="${chatResp.expertUser.expert.expertSort.trim() eq 'C' }">약사</c:if>
                    </h5><br>
                    
                    <span style="width:10rem;">전공과목</span>
                    <h5>: 
                    	<c:if test="${chatResp.expertUser.expert.expertMedi.trim() eq 'N' }">선택안함</c:if>
                    	<c:if test="${chatResp.expertUser.expert.expertMedi.trim() ne 'N' }">${chatResp.expertUser.expert.expertDept}</c:if>
                    </h5><br>
                    
                    <span style="width:10rem;">소속</span>
                    <h5>: 
                    	<c:if test="${chatResp.expertUser.expert.expertDept.trim() eq 'N' }">선택안함</c:if>
                    	<c:if test="${chatResp.expertUser.expert.expertDept.trim() ne 'N' }">${chatResp.expertUser.expert.expertDept}</c:if>
                    </h5><br>
                    
                    <span style="width:10rem;">직장</span>
                    <h5>: ${chatResp.expertUser.expert.expertAddress}
                    </h5><br>
                    
                    <span style="width:10rem; margin-top:0.2rem;"></span>
                    <h5 style="margin-top:0.2rem;"> &nbsp;&nbsp;${chatResp.expertUser.expert.expertAddDetail}
                    </h5><br>
                    
                    <span style="width:10rem;">견적</span>
                    <h5>: ${chatResp.expertUser.expert.expertEstimate}</h5><br>
                    
                    <span style="width:10rem;">답변 수</span>
                    <h5>: ${chatResp.expertUser.answerListSize}</h5><br>
                    

                    <br><hr><br>

                    <h4> 채팅상담 예약 정보 </h4>
                    <div class="row" style="padding : 0 15px;">
                        <div class="col">
                            <span class="row" style="width:10rem;">상담 시간(10분 단위)</span>
                        </div>
                        <div class="col-9">
                            <h5 class="row" >: 
                                <select name="reservHowLong" id="chatPayReservHowLongSelect" onchange="changeChatPayEstimate(this)">
                                    <option value="1">10분</option>
                                    <option value="2">20분</option>
                                    <option value="3">30분</option>
                                    <option value="4">40분</option>
                                    <option value="5">50분</option>
                                    <option value="6">60분</option>
                                </select>
                            </h5><br>
                        </div> 
                    </div>
                    <div class="row" style="padding : 0 15px;">
                        <div class="col">
                            <span class="row" style="width:10rem;">상담 일시</span>

                        </div>
                        <div class="col-9">
                            <h5 class="row" >: 
                            <input type="text" id="datetimepicker" required> 
                            </h5><br>
                            
                            <h6 class="chatDateTimeResult" style="display:none; margin-top:0.3rem; color:red;">이미 예약된 시간입니다</h6>
                            <h6 class="chatDateTimeResult" style="display:none; margin-top:0.3rem; color:green;">상담 예약이 가능합니다</h6>
                            <br>
                        </div>
                    </div>
                    
                    <div class="row" style="padding : 0 15px;">
                        <span style="margin-top: 0.5rem;color:dimgray;"><input style="display: inline-block; margin-top: 0.5rem;" type="checkbox" name="chatPayApprove1" required> 결제 후 해당 채팅상담에 대하여 상대 전문가 회원이 이를 승인했을 때 예약이 확정됩니다.<br> 이에 동의합니다.</span>
                    </div>
                    
                    <br><hr><br>

                    <h4> 채팅상담 결제 정보 </h4><br>
                    <span style="width:10rem;">총 금액</span><h5 id="chatPayEstimate"></h5><br>
                    <span style="width:10rem;">보유 포인트</span><h5 style="color:dimgray">: ${chatResp.generalUser.userPoint} 원 중 
                    	<c:if test="${chatResp.generalUser.userPoint eq 0}"><input name="chatPayPoint" id="chatPayPoint" type="text" style="color:dimgray; width: 6rem;" placeholder="0" value="0" disabled></c:if>
                    	<c:if test="${chatResp.generalUser.userPoint ne 0}"><input name="chatPayPoint" id="chatPayPoint" type="text" style="color:dimgray; width: 6rem;" placeholder="${chatResp.generalUser.userPoint}" value="0"></c:if>
                     원 사용</h5><br>
                     <span class="chatPayPointResult" style="width:10rem;"></span>
                     <h6 class="chatPayPointResult" style="display:none; margin-top:0.3rem; color:red;">보유 포인트 내에서만 사용 가능합니다</h6>
                     <br>


                    <span style="width:10rem;">결제 예정 금액</span><h5 id="chatPayAmout">: </h5><br>
                    <div class="row" style="padding : 0 15px;">
                        <span style="margin-top: 0.5rem;color:dimgray;"><input style="display: inline-block; margin-top: 0.5rem;" type="checkbox" name="chatPayApprove1" required> 상대 전문가 회원의 사정에 따라 예약은 취소될 수 있으며, 결제 내역 및 사용된 포인트는 영해 사이트 정책을 거쳐 환불됩니다. 이에 동의합니다.</span>
                    </div>
                </div>
                
                <!-- 2열 -->
                <div class="col-lg-4">
                <div class="checkout__order" style="height: 37rem;">금액</h5>
				<div class="checkout__order__subtotal" style="height: 5rem;">최종 결제 금액 
					<span>
						<span>&nbsp;원</span>
						<span id="totalPayPrice" style="color: #24E082;"></span>
					</span><br> 
					<span style="font-size: 0.6rem;">P적립 예정&nbsp;</span>
					<span id="savePoint" style="font-size: 0.6rem; color: #24E082; font-weight: 500;">
					</span>
				</div>
	
				<div>
					<input type="checkbox" class="selectAll" onclick="selectAll();" required>
					<label for="allAgree" style="color:#828282; font-size: 1rem; display: inline; margin-left:5px; cursor: pointer;">아래 내용에 모두 동의합니다.(필수) </label>
				</div>
				<div class="container">
					<div>
						<input type="checkbox" name="eachAgree1" class="selectAll" required>
						<label for="eachAgree1"> 본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.</label>
					</div>										
					<div >
						<input type="checkbox" name="eachAgree2" class="selectAll" required>
						<label for="eachAgree2"> 개인정보 수집 이용 및 제 3자 제공 동의(필수)</label>
					</div>										
					<div>
						<input type="checkbox" name="eachAgree3" class="selectAll" required>
						<label for="eachAgree3"> 결제대행 서비스 이용약관 동의(필수) </label>
					</div>
				</div>
				<button type="submit" class="site-btn" onclick="requestChatPay()">
					<span id="totalPayPrice2"></span>원 결제하기
				</button>
				</div>
                </div>
                
            </div>
        </div> <!--컨테이너 끝-->

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

	<link rel="stylesheet" type="text/css" href="resources/css/jquery.datetimepicker.css" >
	<script src="resources/js/jquery.datetimepicker.full.min.js"></script>
	<script>
		const chatPayExpertNum = document.getElementById('chatPayExpertNum').innerText;
		const chatPayChatroomId = document.getElementById('chatPayChatroomId').innerText;
		const originalEstimate = parseInt(${chatResp.expertUser.expert.expertEstimate.split('원')[0].trim()});
		const originalUserPoint = parseInt(${chatResp.generalUser.userPoint});
		
		const chatExpertName = "${chatResp.expertUser.member.userName}";
		const chatProductName = document.location.href.split('info=')[1];
		
		window.onload=()=>{
			console.log(originalEstimate);
			document.getElementById('chatPayEstimate').innerHTML = ": "+originalEstimate;
			document.getElementById('chatPayAmout').innerText = ": "+originalEstimate;
			document.getElementById('totalPayPrice').innerText = originalEstimate;
			document.getElementById('totalPayPrice2').innerText = originalEstimate;
		}
		
		$('#datetimepicker').datetimepicker();
		$('#datetimepicker').datetimepicker({
		 allowTimes:[
		  '09:00', '09:20', '09:40', 
		  '10:00', '10:20', '10:40', 
		  '11:00', '11:20', '11:40', 
		  '12:00', '12:20', '12:40', 
		  '13:00', '13:20', '13:40', 
		  '14:00', '14:20', '14:40', 
		  '15:00', '15:20', '15:40', 
		  '16:00', '16:20', '16:40', 
		  '17:00', '17:20', '17:40', 
		  '18:00', '18:20', '18:40', 
		  '19:00', '19:20', '19:40', 
		  '20:00', '20:20', '20:40'
		 ],
		});
		
		$('#datetimepicker').on('change', function(){
			var chatReservTime = $('#datetimepicker').val();
			console.log(chatReservTime);
			
			$.ajax({
				url: '${contextPath}/checkChatReservTime.ch',
				type: 'POST',
				data: {
					chatPayExpertNum : chatPayExpertNum,
					reservSchedule : chatReservTime
				},
				success: (data)=>{
					console.log(data);
					if(data.trim() != 0){
						console.log(document.getElementsByClassName('chatDateTimeResult')[0]);
						document.getElementsByClassName('chatDateTimeResult')[0].style.display = 'show';
						document.getElementsByClassName('chatDateTimeResult')[1].style.display = 'block';
					} else {
						document.getElementsByClassName('chatDateTimeResult')[0].style.display = 'block';
						document.getElementsByClassName('chatDateTimeResult')[1].style.display = 'show';
					}
				}
			})
		})		
		
		function getChatPayEstimate(){
			var chatPayHowLongValue = document.getElementById('chatPayReservHowLongSelect').value;
			var firstChatPayEstimate = parseInt(originalEstimate);
			firstChatPayEstimate = parseInt( firstChatPayEstimate * chatPayHowLongValue) ;
			return firstChatPayEstimate;
		}
		
		function changeChatPayEstimate(selectHowLong){
			const chatPayHowLongValue = parseInt(selectHowLong.value);
			var firstChatPayEstimate = parseInt(originalEstimate);
			firstChatPayEstimate = parseInt( firstChatPayEstimate * chatPayHowLongValue) ;
			console.log(firstChatPayEstimate);
			document.getElementById('chatPayEstimate').innerHTML = ":&nbsp;" + firstChatPayEstimate;
			
			var point = parseInt(document.getElementById("chatPayPoint").value);
			var secondChatPayEstimate = firstChatPayEstimate - point;
			document.getElementById('chatPayAmout').innerText = ": "+secondChatPayEstimate;
			document.getElementById('totalPayPrice').innerText = secondChatPayEstimate;
			document.getElementById('totalPayPrice2').innerText = secondChatPayEstimate;
		}
		
		document.getElementById("chatPayPoint").addEventListener("keyup", function(){
			var usingChatPayPoint = document.getElementById("chatPayPoint").value;
			if( originalUserPoint < usingChatPayPoint ){
				document.getElementById("chatPayPoint").value = '';
				document.getElementsByClassName('chatDateTimeResult')[1].style.display = 'block';
			} else {
				document.getElementsByClassName('chatDateTimeResult')[1].style.display = 'none';
			}
			
			var point = parseInt(document.getElementById("chatPayPoint").value);
			var firstChatPayEstimate = getChatPayEstimate();
			var result = firstChatPayEstimate - point;
			
			document.getElementById('chatPayAmout').innerText =": " + result;
			document.getElementById('totalPayPrice').innerText = result;
			document.getElementById('totalPayPrice2').innerText = result;
		})
		
		function selectAll(){
			if( document.getElementsByClassName('selectAll')[3].checked == false ){
				for(each of document.getElementsByClassName('selectAll')){
					each.checked = true;
				}
			}else{
				for(each of document.getElementsByClassName('selectAll')){
					each.checked = false;
				}
			}
		}
		
		function requestChatPay(){
			const confirmedChatReservTime = $('#datetimepicker').val();
			const confirmedChatPayHowLongValue = document.getElementById('chatPayReservHowLongSelect').value;
			
			var checkFlag = 0;
			if( document.querySelector("#datetimepicker").value=="" ){
				document.querySelector("#datetimepicker").focus();
			} else {
				checkFlag = 1;
			}
			for( each of document.querySelectorAll("input[type='checkbox']") ){
				if(each.checked == false){
					each.style.outline = '1px solid red';
					each.focus();
					checkFlag = 0;
				} else {
					checkFlag = 1;
				}
			}
			
			if(checkFlag == 1){
				console.log("결제 가능")
				
				var key = "imp73521438";
				const IMP = window.IMP;
				const finalChatPayAmount = parseInt(document.getElementById('totalPayPrice2').innerText);
				var today = new Date(); 
				console.log(today.toLocaleString());
				var todayToLocal = today.toLocaleString();
				IMP.init(key); 
			    impPay();
			    
			    function impPay() {
			 	      IMP.request_pay({ // param
			 	    	  
			 	          pg: "html5_inicis",
			 	          merchant_uid: 'CHAT_' + new Date().getTime(),
			 	          name: chatExpertName+"님과 채팅상담" + chatProductName,
// 			 	          amount: finalChatPayAmount, //추후 주석 해제!
			 	          amount: 100,
			 	          buyer_email: "${loginUser.email}" ,
			 	          buyer_name: "${loginUser.userName}" ,
			 	          buyer_tel: "${loginUser.userPhone}",
			 	          buyer_addr: "해당없음",
			 	          buyer_postcode: "해당없음",
			 	    	  
			 	      }, function (rsp) { // callback
			 	          if (rsp.success) {
							console.log("결제 성공");
							console.log(rsp);
			                 $.ajax({
			                     type: 'post',
			                     url: '${contextPath}/afterPayInsertChatReserv.ch',
			                     data: {
			                    	 chatroomId : chatPayChatroomId,
			                    	 reservSchedule : confirmedChatReservTime,
			                    	 reservHowLong : confirmedChatPayHowLongValue , // ChatReserv 객체
			                    	 
			                         orderCode : rsp.merchant_uid,
			                         userNum : "${ loginUser.userNum }",
			                         userId : "${ loginUser.userId }",
			                         orderDate : todayToLocal,
			                         orderStaus : rsp.status,
			                         orderPayAmount : rsp.paid_amount,
			                         orderUserName : rsp.buyer_name,
			                         orderPaymethod : rsp.pay_method,
			                         orderImpCode : rsp.imp_uid,
			                         orderPhone : rsp.buyer_tel // Orders 객체
			                     },
			                     success : (data)=>{
			                    	 if(data != 0){
			                    		 console.log('예약 및 결제 정보 정상 처리');
			             	 			 window.location.href="${contextPath}/home.qa";
			                    	 }else{
			                    		 console.log('예약 및 결제 정보 처리 중 에러 발생');
			                    	 }
			                     },
			                     error: (data)=>{
			                    	 alert("예약 및 결제 정보 DB 삽입 실패");
			                     }
			                 }); // 예약 및 결제 정보 DB 삽입 ajax
			 	          } else {
			 	        	alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
							console.log(rsp);
							console.log("실패");
			 	          } // 아임포트 결제 실패
						});
			   	 }//아임포트 결제 전체 함수
				}//결제준비가 되면 결제처리
			}
	</script>
</body>
</html>