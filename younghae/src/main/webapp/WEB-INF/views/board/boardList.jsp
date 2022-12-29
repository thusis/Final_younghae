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
<title>게시판 메인</title>
<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
<!-- 추가 CSS -->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">
<link rel="stylesheet" href="css/bn_style.css" type="text/css">
<!-- 부트 스트랩 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> -->

</head>
<body>
	<nav>
	</nav>

	<!-- Blog Section Begin -->
		      <c:if test="${loginUser==null }">
		         <button class="loginBtn">1</button>관리자<br>
		         <button class="loginBtn">2</button>일반유저<br>
		         <button class="loginBtn">4</button>약사<br>
		      </c:if>

      
      <c:if test="${loginUser!=null }">
		<p>      	${loginUser.userName } 님 환영합니다.</p>
		<button onclick="location.href='${contextPath}/logout.bo'">로그아웃</button>
	  </c:if> 
	<section class="blog spad">
		<div class="container">
					    <div>
					    <c:if test="${loginUser != null }">
					    <button type="button" class="btn btn-success"  onclick="location.href='${contextPath}/boardWrite.bo'">
					    <i class="bi bi-pencil-square"></i> Write
					    </button>
					    </c:if>
					    </div>  	
			<div class="row">
				<div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar/">
                        <div class="blog__sidebar__search">
                            <form action="#">
                            <select class="boardselect">
							  <option value="1">작성자</option>
							  <option value="2">제목</option>
							  <option value="3">내용</option>
							  <option value="4">해시태그</option>
							</select>
                                <br>
                                <input type="text" placeholder="Search...">
                                <button type="submit"><br><br><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">Categories</h4>
                            <ul>
                                <li><a href="#">운동(32)</a></li>
                                <li><a href="#">식단 (20)</a></li>
                                <li><a href="#">영양제 (5)</a></li>
                                <li><a href="#">자유 (9)</a></li>
                            </ul>  
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">TOP5 게시글</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
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
				<div class="col-lg-8 col-md-7">

					<div class="row">
					<c:forEach items="${ bList }"  var="b" >
						<input type="hidden" value="${b.boardNum}" name="boardNum">
						<div class="col-lg-6 col-md-6 col-sm-6" >
							<div class="blog__item">
								<div class="blog__item__text">
								<div class="blog__item__pic">
<%--  								<c:forEach items="${pList }" var="p"> --%>

 									<c:if test="${ b.boardNum eq pList[0].serialNumber}">
										<img src="/upload/${pList[0].attachRename}" style="height:231.89px; width:322.57px;" alt="">
										<input type="hidden" value="${pList[0].attachName}" name="boardPhotoName">
									</c:if>
<%-- 								</c:forEach> --%>
								</div>
								<div class="boardMiniCard"></div>
									<ul>
										<li><i class="fa fa-calendar-o"></i>&nbsp;${b.boardCreateDate}</li>
										<li><i class="fa fa-comment-o"></i> 댓글수</li>
										<li><i class="fa-regular fa-heart"></i> 10</li>
										<li><i class="fa-regular fa-eye"></i>&nbsp;${b.boardView}</li>
									</ul>
									<h5>
										<a href="#">${b.boardTitle }	 </a>
									</h5>
									<p>${b.boardContent}</p>
									<a href="#" class="blog__btn" id="boardView">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						</c:forEach>
<!-- 						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-3.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">Visit the clean farm in the US</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-1.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">Cooking tips make cooking simple</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-4.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">Cooking tips make cooking simple</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-4.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">The Moment You Need To Remove Garlic From The
											Menu</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-4.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">The Moment You Need To Remove Garlic From The
											Menu</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div> -->
						<div class="col-lg-12">
							<div class="product__pagination blog__pagination">
<!-- 								<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
									href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#"><i
									class="fa fa-long-arrow-right"></i></a> -->
															<ul class="pagination justify-content-center">
	            <li class="page-item">
	           		<c:url var="PListFirst" value="${ loc }"> <!--  직접적으로 주소를 가져오지않아도 select주소를 가져오는것 loc -->
						<c:param name="page" value="1"/>
					</c:url>
					<c:if test="${ pi.payCurrentPage <= 1 }">
						<a class="page-link">
	                    	<span>처음</span>
	                	</a>
					</c:if>
					<c:if test="${ pi.payCurrentPage > 1 }">
		                <a class="page-link" href="${ PListFirst }">
		                    <span>처음</span>
		                </a>
	                </c:if>
	            </li>
	            <li class="page-item">
	            	<c:url var="PListBack" value="${ loc }">
						<c:param name="page" value="${ pi.payCurrentPage -1 }"/>
					</c:url>
					<c:if test="${ pi.payCurrentPage <= 1 }">
		                <a class="page-link">
	                    	<span>이전</span>
	                	</a>
	                </c:if>
	                <c:if test="${ pi.payCurrentPage > 1 }">
						<a class="page-link" href="${ PListBack }">
	                    	<span>이전</span>
	                	</a>
					</c:if>          
	            </li>			
	            <li class="page-item">
	            	<c:forEach begin="${ pi.payStartPage }" end="${ pi.payEndPage }" var="p">
	            		<c:if test="${ pi.payCurrentPage eq p }">
							<a class="page-link">
								<font color="red">${ p }</font>
							</a>
						</c:if>
						<c:if test="${ pi.payCurrentPage ne p }">
							<c:url var="PListCheck" value="${ loc }">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<li class="page-item"><a class="page-link" href="${ PListCheck }">${ p }</a></li>
						</c:if>
	            	</c:forEach>
	            </li>
	            <li class="page-item">
	            	<c:url var="PListNext" value="${ loc }"> <!--  직접적으로 주소를 가져오지않아도 select주소를 가져오는것 loc -->
						<c:param name="page" value="${ pi.payCurrentPage + 1 }"/>
					</c:url>
					<c:if test="${ pi.payCurrentPage >= pi.payMaxPage }">
						<a class="page-link">
	                    	<span>다음</span>
	                	</a>
					</c:if>
					<c:if test="${ pi.payCurrentPage < pi.payMaxPage }">
						<a class="page-link" href="${ PListNext }">
							<span>다음</span>
						</a>
					</c:if>
	            </li>
	            <li class="page-item">
	            	<c:url var="PListLast" value="${ loc }"> <!--  직접적으로 주소를 가져오지않아도 select주소를 가져오는것 loc -->
						<c:param name="page" value="${ pi.payMaxPage }"/>
					</c:url>
					<c:if test="${ pi.payCurrentPage >= pi.payMaxPage }">
						<a class="page-link">
	                    	<span>마지막</span>
	                	</a>
					</c:if>
					<c:if test="${ pi.payCurrentPage < pi.payMaxPage }">
						<a class="page-link" href="${ PListLast }">
							<span>마지막</span>
						</a>
					</c:if>
	            </li>
	        </ul>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
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
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
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
	<!-- 부트스트랩 -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> -->

<script>
window.onload=()=>{
	   
/* 	   const boardWriteView = document.getElementById('boardWriteView');
	   boardWriteView.addEventListener('click', function() {
		   location.href='${contextPath}/boardWrite.bo';
	   }) */

	   const loginBtn= document.getElementsByClassName("loginBtn");
	   for(const btn of loginBtn){
	      btn.addEventListener('click', function(){
	         const userNum = this.innerText;
	         console.log(userNum);
	         location.href='${contextPath}/login.bo?userNum='+userNum;
	      });
	   }
	   
/* 	   const logout = document.getElementById('logout');
	   logout.addEventListener('click', function() {
		   location.href='${contextPath}/logout.bo';
	   }); */
	   
	   
	   const boardViews = document.getElementById('boardView');
	   for(const bv of boardViews)	{
	   bv.addEventListener('click', function() {
		   location.href = '${contextPath}/selectBoard.bo?bNo=' + boardNo + '&writer=' + writer + '&page=' + ${pi.currentPage};
		   
	   });
	   }
	}
</script>

</body>
</html>