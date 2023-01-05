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
<title>게시글 상세</title>
<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
<!-- 추가 CSS -->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">
<link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
<!-- 부트 스트랩 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> -->
<style>
	.ll{
		color:black;
		font-size: 17px;
		padding-bottom: 10px; 
	}
	.ll:hover{
		color:#24E082;
		cursor: pointer;
	}
	.boardselect{
		cursor: pointer;
	}	
	#replySubmit{
		border: 3px solid #24E082;
		color:#24E082;
	}
	#replyTable{
	  text-align: center; 
	  margin-left: 430px;
  	  vertical-align: middle;
	}
	#ViewForm{
		text-align: center;
	}
	#updateForm{
		border: 3px solid #00db71;
		width: 90px;
		height: 40px;
		background: #24E082;
		border-radius: 10px;
		color:white;
	}
	#deleteForm{
		border: 3px solid #00db71;
		width: 90px;
		height: 40px;
		background: #24E082;
		border-radius: 10px;
		color:white;
	}
	#boardListBack{
		border: 3px solid #00db71;
		width: 90px;
		height: 40px;
		background: #24E082;
		border-radius: 10px;
		color:white;
	}
	#replyTxt{
		margin-left: 70px;
	}
	th{
		color:green;
	}
	.fa-trash-alt{
		color:pink;
		cursor: pointer;
	}
	.deleteReply{
		border:none; 
		background: none;
	}
</style>
</head>
<body>
	<section class="blog spad">
		<div class="container">
			<div class="bn_index mt-5">
				<ul>
					<li>건강 이야기</li>
					<li><b>/</b></li>
					<li><a href="#">게시글 상세</a></li>
				</ul>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar/">
                        <div class="blog__sidebar__search">
<!--                             <form action="#">
                            <select class="boardselect" id="searchCondition">
							  <option value="1">작성자</option>
							  <option value="2">제목</option>
							  <option value="3">내용</option>
							  <option value="4">해시태그</option>
							</select>
                                <br>
                                <input type="search" placeholder="Search..." id="searchValue" name="searchValue">
                                <button type="button" onclick="searchBoard();"><br><br><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form> -->
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">Categories</h4>
                            <ul>
                                <li class="ll 11">운동 (32)</li>
                                <li class="ll 12">식단 (21)</li>
                                <li class="ll 13">영양제 (54)</li>
                                <li class="ll 14">자유 (47)</li>
                            </ul>  
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">TOP5 게시글</h4>
                            <div class="blog__sidebar__recent">
                            
                            <c:forEach items="${topBoardList }" var="t">
                                <a href="#" class="blog__sidebar__recent__item">
                           			<div class="blog__sidebar__recent__item__pic">
                           			<c:forEach items="${topBoardAttList}" var="ta">
                           				<c:if test="${ t.boardNum eq ta.serialNumber }">
                                         <img src="${ta.attachRename }"  style="width:90px; height:90px;"alt=""> 
                                         </c:if>
                                    </c:forEach>
                                    </div> 
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>${t.boardTitle }</h6>
                                        <span style="color:#24E082;">${t.boardCreateDate }</span>
                                    </div>
                                </a>
                            </c:forEach>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">Search By</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">PT</a>
                                <a href="#">단백질 보충제</a>
                                <a href="#">샐러드</a>
                                <a href="#">필라테스</a>
                                <a href="#">오운완</a>
                                <a href="#">헬린이</a>
                            </div>
                        </div>
                    </div>
				</div>

				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div id="boardTitle">
						<h4>${b.boardTitle }</h4>
					</div>
					<hr width="80%" style="border: 1px dashed #c9ffe4;" noshade />
					<div class="container"
						style="border: 2px solid #24E082; border-radius: 3%; padding: 8%;">
						<div class="blog__details__text">
							<p>${b.boardContent }</p>
						</div>
					</div>
					<br>
					<form id="detailForm">
					<input type="hidden" value="${b.boardNum}" name="boardNum" id="boardNum" class="boardNum">
					<input type="hidden" value="${page}" name="page" id="page" class="page">	
						<div id="ViewForm">
							<button type="button" id="updateForm"
								<c:if test="${ loginUser.userNum ne b.userNum }">style="display:none;"</c:if>>수정하기</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" id="deleteForm"
								<c:if test="${ loginUser.userNum ne b.userNum }">style="display:none;"</c:if>>삭제하기</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" id="boardListBack"
								onclick="location.href='${contextPath}/boardList.bo'">목록으로</button>
						</div>
					</form>
					<br>
					<div class="blog__details__content">
						<div class="row">
							<div class="col-lg-6">
								<div class="blog__details__author">
									<div class="blog__details__author__pic">
										<img src="resources/img/blog/details/profile.jpg" alt="">
									</div>
									<div class="blog__details__author__text">
										<h6 style="color:#24E082">${b.member.userNickname }</h6>
										<span>${b.generaluser.userHealth }</span>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="blog__details__widget">
									<ul>
										<li><span>Categories:</span> 운동</li>
										<li><span>Tags:</span> PT, 오운완, 버핏테스트, 인바디</li>
									</ul>
									<div class="blog__details__social">
										<a href="#" onclick="fn_sendFB('facebook');return false;" id="facebook"
												target="_self" title="페이스북 새창열림">
												<i class="fa fa-facebook"></i>
										</a> 
										<a href="#" onclick="fn_sendFB('twitter');return false;" id="twitter"
												target="_self" title="트위터 새창열림">
												<i class="fa fa-twitter"></i>
										</a> 
										<a href="#"><i
											class="fa fa-google-plus"></i></a> <a href="#"><i
											class="fa fa-linkedin"></i></a> <a href="#"><i
											class="fa fa-envelope"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
		<!-- board Detail End -->
		<br>
		<br>
		<!-- Reply Zone Start -->
		<div class="row">

			<div class="col-lg-10">
				<div class="row justify-content-end bn_board-meta">
					<i class="bi bi-heart"></i><span class=" m-2">12</span>&nbsp;&nbsp;
					<i class="fa-regular fa-eye"></i><span class=" m-2">${b.boardView }</span>&nbsp;&nbsp;
					<i class="bi bi-chat-dots m-2"></i><span class=" m-2">${replyCount}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>

			</div>
			<div
				class="dropdown col-lg-1 align-items-center justify-content-center">
				<button class="btn" type="button" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="bi lg bi-three-dots"
						style="font-size: 1.5rem; color: darkgray;"></i>
				</button>
			</div>

			<hr width="80%" style="border: 0.5px solid #e0e0e0;" noshade />
		</div>
		<div class="row">
			<div class="replyComment">
				<h4 class="bn_txt_strong" id="replyTxt">
					댓글을 남기세요&nbsp;&nbsp;<i class="bi bi-chat-dots"></i>
				</h4>
			</div>
		</div>
		<br>
		<div id="replyDiv">
		<div id="replyContent">
			<textarea id="replyTextarea"></textarea>
			&nbsp;&nbsp;
			<button class="btn bn_btn_search2" id="replySubmit" type="button">SUBMIT</button>
		</div>
		<hr style="border: 1px solid #8bffc5; width:1250px; " noshade />
		<table id="replyTable">
			<thead>
				<tr>
					<th width="100px">댓글 번호</th>
					<th width="140px">작성자</th>
					<th width="500px">작성내용</th>
					<th width="200px">작성일</th>
					<th width="140px">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rList}" var="r">
				<tr>
 					<td>${r.replyNum}</td>
					<td>${r.member.userNickname}</td>
					<td>${r.replyContent}</td>
					<td>${r.replyDate}</td>
					<td>
					<button type="button" class="deleteReply" 
					<c:if test="${ loginUser.userNickname ne r.member.userNickname }">style="display:none;"</c:if>>
					<i class="fas fa-trash-alt"></i>
					</button>
					<input type="hidden" value="${r.replyNum}" name="replyNum" class="replyNum">
					</td> 
				</tr>
				</c:forEach> 
			</tbody>
		</table>
		</div>


		<!-- Reply Zone End -->
	</section>
	<!-- Blog Section End -->


	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="#"><img src="resources/img/logo.svg" alt=""></a>
						</div>
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello@colorlib.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Useful Links</h6>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">About Our Shop</a></li>
							<li><a href="#">Secure Shopping</a></li>
							<li><a href="#">Delivery infomation</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Our Sitemap</a></li>
						</ul>
						<ul>
							<li><a href="#">Who We Are</a></li>
							<li><a href="#">Our Services</a></li>
							<li><a href="#">Projects</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Innovation</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#n" onclick="fn_sendFB('facebook');return false;" id="facebook" target="_self" title="페이스북 새창열림"><i class="fa fa-facebook"></i></a> 
							<a href="#"><i class="fa fa-instagram"></i></a> 
							<a href="#n" onclick="fn_sendFB('twitter');return false;" id="twitter" target="_self" title="트위터 새창열림"><i class="fa fa-twitter"></i></a> 
							<a href="#"><i class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="resources/img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!--소셜공유-->
	 		<script>	
	 		
	 		
	 		 /**댓글작성*/
	 		document.getElementById('replySubmit').addEventListener('click', ()=>{

	     		   $.ajax({
	     			   url: '${contextPath}/insertReply.bo',
	     			   data:{replyContent:document.getElementById('replyTextarea').value,
	     				   		boardType:${b.boardType},
	     				   		boardNum:${b.boardNum}, userNum:'${loginUser.userNum}'},
	     				success:(data) => {
	     					const tbody = document.querySelector('tbody');
	     					tbody.innerHTML = '';
	     					
	     					
	     					for(const r of data) {
	     						const tr = document.createElement('tr');
	     						
	     						const replyNumTd = document.createElement('td');
	     						replyNumTd.innerText = r.replyNum;
	     						const replyWriterTd = document.createElement('td');
	     						replyWriterTd.innerText = r.member.userNickname;
	     						const replyContentTd = document.createElement('td');
	     						replyContentTd.innerText = r.replyContent;
	     						const replyDateTd = document.createElement('td');
	     						replyDateTd.innerText = r.replyDate;
	     						const deleteReplyTd = document.createElement('td');
	     						deleteReplyTd.innerText = '';
	     						
	     						tr.append(replyNumTd);
	     						tr.append(replyWriterTd);
	     						tr.append(replyContentTd);
	     						tr.append(replyDateTd);
	     						tr.append(deleteReplyTd);
	     						
	     						tbody.append(tr);
	     					}
	     					document.getElementById('replyTextarea').value='';
	     				},
	     				error:(data) => {
	     					console.log(data);
	     				}
	     		   });
	     	   });
	 		 
			//댓글 삭제
			$(".deleteReply").click(function(){
			       let params={
				             replyNum : $(this).next().val(),
				             boardNum : ${b.boardNum}
			       }
			       
			       $.ajax({
			    	   url: '${contextPath}/deleteReply.bo',
			    	   data: params,
			    	   success:function(res){
			    		   console.log("댓글삭제 에작스");
			    		   window.location.reload();
			    	   }
			       });
			});
	 		
            function shareFacebook() {
              var sendUrl = "http://www.google.com";
              window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl, "Y2K World", "height=480px, width=600px");
            }
            
            function shareTwitter() {
              var sendText = "영해의 건강이야기 게시글을 공유합니다 :)";
              const boardNum = '${b.boardNum}';
              const writer = '${b.userNum}';
              const page = '${page}';
              http://localhost:8888/young/boardView.bo?boardCategory=12&boardNum=44&writer=32&page=1#
              
              var sendUrl = "http://localhost:8888/young/boardView.bo?boardCategory=" + ${b.boardType} + "%26boardNum=" + ${b.boardNum} + "%26writer=" + "${b.userNum}" +"%26page=" + ${page};
              console.log(sendUrl);
              window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl, "Y2K World", "height=480px, width=600px");
            }
            
           //button click action
            $(document).ready(function() {
            	
			            $("#facebook").click(function() {
			                shareFacebook();
			            });
			            $("#twitter").click(function() {
			                shareTwitter();
			            });
          });
    		/** boardCategories Bar */						
     	   const categorys = document.getElementsByClassName('ll');
     	   for(const category of categorys){
     		   category.addEventListener('click', function(){
     			   const boardCategory = category.className.substr(2);
     			   location.href='${contextPath}/boardList.bo?boardCategory=' + boardCategory;
     			   console.log(boardCategory);
     		   });
     	   }					
     	   
     	  
     	   
           //게시글 수정 삭제
           	const upd = document.getElementById('updateForm');
			const form = document.getElementById('detailForm');
			
			if(upd != null) {
				upd.addEventListener('click', ()=> {
					form.action = '${contextPath}/updateBoard.bo';
					form.submit();
				});
			}
			
			document.getElementById('deleteForm').addEventListener('click', ()=> {
				 if (confirm("게시글을 삭제하시겠습니까?")){ 
						console.log(${b.boardNum});
						form.action = '${contextPath}/deleteBoard.bo';
						form.submit();

					 }else{
					   console.log("게시글 삭제 취소");
					 }
			});
     	   

     	   
            </script>

</body>
</html>