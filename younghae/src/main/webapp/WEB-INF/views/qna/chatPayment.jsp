<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 상담 결제하기</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<style>
		a{
		text-decoration:none;
		}
		.bn_board-meta > i : hover {
			color: green;
		}
		h1, h2, h3, h4, h5, h6, span, p {
			font-family: 'IBM Plex Sans KR', sans-serif; 
		}
		.qaPaymentInfo h4 {
			margin-top : 1rem;
		}
		.qaPaymentInfo span{
			font-weight : 500;
		}
	</style>
</head>
<body>
	<!-- data picker js -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<!-- data picker end--->
	
    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> <b>/</b> </li>
                <li><a href="#">채팅</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">채팅 상담 결제하기</a></li>
            </ul>
        </div>

${chatResp}

        <div class="row">
             <div class="row bn_txt_big">
                 <h3 style="color: black;">${ loginUser.userName } 님의 채팅상담 결제 페이지입니다</h3>
             </div>
            <div class="col-lg-8 bn_card-top"><!--영양제복용법질문======================================-->
                <div class="row">
                    <div class="col-lg-1 bn_txt_big"></div>
                    <div class="col-lg-10">
                        <div class="row bn_txt_big">
                            <h3 style="color: black;">${chatResp.expertUser.member.userName} 님에 대한 정보입니다</h3>
                        </div>
                        <div class="qaPaymentInfo">
                        	<h4> <span style="display: inline-block; width: 10rem;"> 전문가 회원명 </span>: ${chatResp.expertUser.member.userName}</h4>
                        	<h4> 
                        	<span style="display: inline-block; width: 10rem;"> 구분</span> 
								<c:if test="${chatResp.expertUser.expert.expertSort.trim() eq 'N' }">: 선택안함</c:if>
								<c:if test="${chatResp.expertUser.expert.expertSort.trim() eq 'D' }">: 의사</c:if>
								<c:if test="${chatResp.expertUser.expert.expertSort.trim() eq 'C' }">: 약사</c:if>
                        	</h4>
                        	<h4> <span style="display: inline-block; width: 10rem;"> 전공과목 </span>: ${chatResp.expertUser.expert.expertMedi}</h4>
                        	<h4> <span style="display: inline-block; width: 10rem;"> 소속 </span>: ${chatResp.expertUser.expert.expertDept}</h4>
                        	<h4> <span style="display: inline-block; width: 10rem;"> 직장 </span>: ${chatResp.expertUser.expert.expertAddress}</h4>
                        	<h4> <span style="display: inline-block; width: 10rem;">  </span>&nbsp;&nbsp;${chatResp.expertUser.expert.expertAddDetail}</h4>
                        	<h4> <span style="display: inline-block; width: 10rem;"> 견적 </span>: ${chatResp.expertUser.expert.expertEstimate}</h4>

                        	<h4> <span style="display: inline-block; width: 10rem;"> 답변 수</span>: ${chatResp.expertUser.answerListSize}</h4>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
	                <div class="col-lg-1 bn_txt_big"></div>
	                <div class="col-lg-10">
	                   <div class="row bn_txt_big">
	                       <h3 style="color: black;">상담 스케줄 예약하기</h3>
	                   </div>
		               <!--============== DateRange =====================-->
	                  <div class="row mb-3 align-items-center">
	
	                    <div class="col input-group">
	                    <h4> 
	                    	<span style="display: inline-block; width: 10rem;"> 예약일 </span>
							<input type="text" class="form-control" value=startdate id="daterangepicker" name="moimdate">
	                    </h4>
	                    <h4> 
	                    	<span style="display: inline-block; width: 10rem;"> 예약시간 </span>
							<input type="text" class="form-control" value=startdate id="timepicker" name="moimdate">
	                    </h4>
	                    </div>
	
	                  </div>
	
	                  <script>
	                    let today = new Date();
	                    let startdate = today.getFullYear()+'-'+today.getMonth()+'-'+today.getDate();
	                    $("#daterangepicker").daterangepicker({
	                      locale: {
	                        "separator": " 부터 ",                     // 시작일시와 종료일시 구분자
	                        "format": 'YYYY-MM-DD',     // 일시 노출 포맷
	                        "applyLabel": "확인",                    // 확인 버튼 텍스트
	                        "cancelLabel": "취소",                   // 취소 버튼 텍스트
	                        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	                        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	                        },
	                        //timePicker: true,                        // 시간 노출 여부
	                        //showDropdowns: true,                     // 년월 수동 설정 여부
	                        autoApply: false                         // 확인/취소 버튼 사용여부
	                        //timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
	                        //timePickerSeconds: true,                 // 초 노출 여부
	                        //singleDatePicker: true                   // 하나의 달력 사용 여부
	                    });
	                  </script>
	              	<!-- ======== Date Range 끝 ========== -->
	                   
	                   
                   </div>
	                   
	                </div>
                	
                
                </div>
            </div>
            
	      <div class="col-lg-4 col-md-6" style="position:fixed; top: 20%; left: 65%; overflow:auto; ">
			<div class="checkout__order" style="height: 37rem;">
				<h4 style="margin-top:-5px;">결제 금액</h4>
				<ul style="margin-top:-10px;">
					<li>총 상품 금액 <span><fmt:formatNumber value="${ totalPrice }" type="number"/> 원</span></li>
					<li>쿠폰 사용<span><span>&nbsp;원</span><span id="useCouponPrice">0</span></span></li>
					<li>포인트 사용<span>&nbsp;원</span><span id="totalUsePoint">0</span></li>
				</ul>
				<div class="checkout__order__subtotal" style="height: 5rem;">최종 결제 금액 
					<span><span>&nbsp;원</span><span id="totalPayPrice" style="color: #24E082;">
	<%-- 										<fmt:formatNumber value="${ totalPrice }" type="number"/></span></span><br> --%>
					<span style="font-size: 0.6rem;">P적립 예정&nbsp;</span>
					<span id="savePoint" style="font-size: 0.6rem; color: #24E082; font-weight: 500;">
	<%-- 										<fmt:formatNumber value="${ totalPrice * 0.01}" type="number"/> --%>
					</span>
				</div>
	
				<div>
					<input type="checkbox" id="allAgree" class="cartSelectAll" onclick="selectAll();" required>
					<label for="allAgree" style="color:#828282; font-size: 1rem; display: inline; margin-left:5px; cursor: pointer;">아래 내용에 모두 동의합니다.(필수) </label>
				</div>
				<div class="container">
					<p>본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.</p>
					<div >
						<input type="checkbox" id="eachAgree1" class="cartSelectEach" onclick="selectOne();" required>
						<label for="eachAgree1" style="margin-top: -10px; color:#828282; cursor: pointer;"> 개인정보 수집 이용 및 제 3자 제공 동의(필수)</label>
					</div>										
					<div>
						<input type="checkbox" id="eachAgree2" class="cartSelectEach" onclick="selectOne();" required>
						<label for="eachAgree2" style="margin-top: -10px; color:#828282; cursor: pointer;"> 결제대행 서비스 이용약관 동의(필수) </label>
					</div>
				</div>
				<button type="button" class="site-btn" onclick="requestPay()">
					<span>71,100</span>원 결제하기
				</button>
			</div>
		</div>
        </div>

			<div class="row">
		       <div class="col-lg-8 bn_card-bottom"><!--A영양제복용법답변 ===============-->
	            <div class="row">
                    <div class="col-lg-1 bn_txt_big"><h2>Q</h2></div>
                    <div class="col-lg-10">
                        <div class="row bn_txt_big">
                            <h3>일정잡기</h3>
                            <hr>
                        </div>
		               <div class="col-lg-10"></div>
		               </div>

		           </div>
		       </div>
		       <div class="col-lg-4">
		       ddd
		       </div>
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
<br>
<br>
	
	<script>
		console.log(document.getElementsByClassName('replySubmits')[0]);
		
		const replyBtns = document.getElementsByClassName('replySubmits');
		var loginUserNum = 0;
		if(${loginUser != null}){
			loginUserNum = ${loginUser.userNum}+"";
		} else {
			loginUserNum = 0;
		}
		
		console.log(loginUserNum);
		
		for(const btn of replyBtns){//댓글달기===================================================================================
			btn.addEventListener('click', function(){
				
				const replyContent = btn.parentNode.parentNode.querySelector('input').value;
				var boardNum = this.querySelector('span').innerText;
				const boardType = this.querySelector('h6').innerText;
				if(loginUserNum != 0){
					var userNum = loginUserNum;
				}else{
					var userNum = 0;
				}
				
				console.log(btn.parentNode.parentNode.querySelector('input').value);
				console.log(boardNum, boardType, userNum);
				
				$.ajax({
					url: '${contextPath}/insertreply.qa',
					type: 'POST',
					data: {
						replyContent : replyContent,
						boardNum : boardNum,
						boardType : boardType,
						userNum : userNum
					},
					success: (data)=>{
						btn.parentNode.parentNode.querySelector('input').value = '';
						
						const replyListDiv = btn.parentNode.parentNode.parentNode.querySelector('.reply_list');
						replyListDiv.innerHTML = "";
						replyListDiv.classList.add("row", "reply_list");
						
						console.log(data[0].reply.replyNum); //
						console.log(data[0].writerInfo);
						console.log(data[0].reply.replyContent);
						console.log(data[0].reply.replyDate);
						
						for ( var i=0; i<data.length; i++ ){
							const secondDiv = document.createElement('div'); secondDiv.classList.add("col-lg-12", "mt-3");
							const replyItemDiv = document.createElement('div'); replyItemDiv.classList.add("row", "reply_item");
							
							const replyNumSpan = document.createElement('span');
							replyNumSpan.style.display = "none";
							replyNumSpan.innerText = data[i].reply.replyNum;
							
							const writerInfoSpan = document.createElement('span');
							writerInfoSpan.classList.add("col-lg-2", "text-start", "reply_item_replyUserNum");
							writerInfoSpan.innerText = data[i].writerInfo;
							
							const replyContentSpan = document.createElement('span');
							replyContentSpan.classList.add("col-lg-8", "reply_item_replyContent");
							replyContentSpan.innerText = data[i].reply.replyContent;
							
							const replyDateSpan = document.createElement('span');
							replyDateSpan.classList.add("col-lg-2", "reply_item_replyContent");
							replyDateSpan.innerText = data[i].reply.replyDate;
							
							const hr = document.createElement('hr');
	
							replyItemDiv.append(replyNumSpan);
							replyItemDiv.append(writerInfoSpan);
							replyItemDiv.append(replyContentSpan);
							replyItemDiv.append(replyDateSpan);
							secondDiv.append(replyItemDiv);
							secondDiv.append(hr);
							replyListDiv.append(secondDiv);
						}
					},
					error: (data)=>{
						alert("실패!");
					}
				});//ajax끝
			});
		}//댓글달기 끝===================================================================================

			
		//====게시글 수정
		function updateQuestion(){
			console.log("수정");
			
		}
		
		//====수정/삭제 불가
		function disabledAlert(){
			alert('이미 답글이 달린 게시글은 수정/삭제가 불가능합니다‼‼');
		}
		
		//====스크랩불러오기
		var boardNum = "${qresp.board.boardNum}";
		var userNum = "${loginUser.userNum}";

		function deleteScrap(){
	   			$.ajax({
	   				url:'${contextPath}/deleteScrap.qa',
	   				data :{ boardNum : boardNum , userNum : userNum },
	   				success : (data)=>{
	   					console.log("스크랩취소");
// 						document.getElementById('isScrap').innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
	// 					this.innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
// 						document.getElementById('scrapCount').innerHTML = '<i class="save fa-regular fa-bookmark"></i>' + data;
// 	    				isScrap = 0;
	   				}
	   			}); // ajax 스크랩 취소
			} 
		function setScrap(){
				$.ajax({
	  				url:'${contextPath}/setScrap.qa',
	   				data :{ boardNum : boardNum , userNum : userNum },
	   				success : (data)=>{
	   					console.log("스크랩함");
// 	   					document.getElementById('isScrap').innerHTML = '<h2><i class="fa-solid fa-bookmark"></i></h2>';
// 						document.getElementById('scrapCount').innerHTML = '<i class="fa-solid fa-bookmark"></i>' + data;
// 	    				isScrap = 1;
	  				}
	  			}); // ajax 스크랩 추가
			}
		
// 		function changeScrap(){
//			if(isScrap==1){
//	   			$.ajax({
//	   				url:'${contextPath}/deleteScrap.qa',
//	   				data :{ boardNum : boardNum , userNum : userNum },
//	   				success : (data)=>{
//	   					console.log("스크랩취소");
//// 						document.getElementById('isScrap').innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
//	// 					this.innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
//// 						document.getElementById('scrapCount').innerHTML = '<i class="save fa-regular fa-bookmark"></i>' + data;
//// 	    				isScrap = 0;
//	   				}
//	   			}); // ajax 스크랩 취소
//			} else {
//				$.ajax({
//	  				url:'${contextPath}/setScrap.qa',
//	   				data :{boardId:boardId,userId:userId},
//	   				success : (data)=>{
//	   					console.log("스크랩함");
//// 	   					document.getElementById('isScrap').innerHTML = '<h2><i class="fa-solid fa-bookmark"></i></h2>';
//// 						document.getElementById('scrapCount').innerHTML = '<i class="fa-solid fa-bookmark"></i>' + data;
//// 	    				isScrap = 1;
//	  				}
//	  			}); // ajax 스크랩 추가
//			}
//		}
	</script>
</body>
</html>