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
	.col-lg-12{
	color: green; 
	}
	#boardView{
		background: white;
		color: #24E082;
		border: 2px solid #24E082;
	}
	#boardView:hover{
		background: #24E082;
		color: white;
	}
</style>
</head>
<body>
	<!-- Blog Section Begin -->
<%-- 		      <c:if test="${loginUser==null }">
		         <button class="loginBtn">1</button>관리자<br>
		         <button class="loginBtn">2</button>일반유저<br>
		         <button class="loginBtn">4</button>약사<br>
		      </c:if>

      
      <c:if test="${loginUser!=null }">
		<p>      	${loginUser.userName } 님 환영합니다.</p>
		<button onclick="location.href='${contextPath}/logout.bo'">로그아웃</button>
	  </c:if>  --%>
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
                            <select class="boardselect" id="searchCondition">
							  <option value="1">작성자</option>
							  <option value="2">제목</option>
							  <option value="3">내용</option>
<!-- 							  <option value="4">해시태그</option> -->
							</select>
                                <br>
                                <input type="search" placeholder="Search..." id="searchValue" name="searchValue">
                                <button type="button" onclick="searchBoard();"><br><br><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">Categories</h4>
                            <ul>
                                <li class="ll 11">운동🏓</li>
                                <li class="ll 12">식단🥗</li>
                                <li class="ll 13">영양제💊</li>
                                <li class="ll 14">자유😀</li>
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
				<div class="col-lg-8 col-md-7">	
					<div class="row">
					<c:forEach items="${ bList }"  var="b" >
						<div class="col-lg-6 col-md-6 col-sm-6" >
						<input type="hidden" value="${b.boardType}" name="boardType" class="boardType" >
						<input type="hidden" value="${b.boardNum}" name="boardNum" class="boardNum" >
						<input type="hidden" value="${b.userNum}" name="userNum" class="userNum" >
							<div class="blog__item">
								<div class="blog__item__text">
								<div class="blog__item__pic">	
										<img src="${b.attachment.attachRename}" style="height:231.89px; width:322.57px;" alt="">
								</div>
									<ul>
										<li><i class="fa fa-calendar-o"></i>&nbsp;${b.boardCreateDate}</li>
										<li><i class="fa fa-comment-o"></i> 17</li>
										<li><i class="fa-regular fa-heart"></i> 10</li>
										<li><i class="fa-regular fa-eye"></i>&nbsp;${b.boardView}</li>
									</ul>
									<h5>
										<a href="#">${b.boardTitle }	 </a>
									</h5>
									<button type="button" class="blog__btn" id="boardView" >READ MORE <span
										class="arrow_right"></span></button>
								</div>
							</div>
						</div>
						</c:forEach>
						
						<!-- 페이징 시작 -->						
						<div class="col-lg-12">
					<div class="col-lg-12 text-center" style="margin-top: 8%;">
						<div class="product__pagination blog__pagination">
							<c:url var="goBack" value="${ loc }">
								  <c:if test="${ boardNum != null }">
				                      <c:param name="boardNum" value="${ b.boardNum }"/>
				                  </c:if>
				                  <c:if test="${ searchValue != null }">
				                      <c:param name="searchValue" value="${ searchValue }"/>
				                  </c:if>
			                  <c:if test="${boardCategory != null}">
			                  	<c:param name="boardCategory" value="${boardCategory}"/>
			                  </c:if>
				                  <c:param name="page" value="${ pi.currentPage-1 }"/>
							</c:url>
							<c:if test="${ pi.currentPage > 1 }">
									<a href="${ goBack }" aria-label="Previous"><i
									class="fa fa-long-arrow-left"></i></a>
							</c:if>
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
								var="p">
							<c:url var="goNum" value="${ loc }">
			                  <c:if test="${ boardNum != null }">
			                      <c:param name="boardNum" value="${ boardNum }"/>
			                  </c:if>
			                  <c:if test="${ searchValue != null }">
			                      <c:param name="searchValue" value="${ searchValue }"/>
			                  </c:if>
			                  <c:if test="${boardCategory != null}">
			                  	<c:param name="boardCategory" value="${boardCategory}"/>
			                  </c:if>
			                  <c:param name="page" value="${ p }"/>
							</c:url>
								<a href="${ goNum }">${ p }</a>
							</c:forEach>
							<c:url var="goNext" value="${ loc }">
 					 <c:if test="${ boardNum != null }">
                      <c:param name="boardNum" value="${ boardNum }"/>
                  </c:if>
		                  <c:if test="${ searchValue != null }">
		                      <c:param name="searchValue" value="${ searchValue }"/>
		                  </c:if>
		                  <c:if test="${boardCategory != null}">
		                  	<c:param name="boardCategory" value="${boardCategory}"/>
		                  </c:if>
                  <c:param name="page" value="${ pi.currentPage+1 }"/>
							</c:url>
							<c:if test="${ pi.currentPage <= 1 }">
								<a href="${ goNext }"><i class="fa fa-long-arrow-right"></i></a>
							</c:if>
						</div>
					</div>
									
									
<%-- 	<ul class="pagination d-flex justify-content-center">
          <li>
              <c:url var="goBack" value="${ loc }">
                  <c:if test="${ boardNum != null }">
                      <c:param name="boardNum" value="${ b.boardNum }"/>
                  </c:if>
                  <c:if test="${ searchValue != null }">
                      <c:param name="searchValue" value="${ searchValue }"/>
                  </c:if>
                  <c:if test="${boardType != null}">
                  	<c:param name="boardType" value="${boardType}"/>
                  </c:if>
                  <c:param name="page" value="${ pi.currentPage-1 }"/>
              </c:url>
              <a class="page-link" href="${ goBack }" aria-label="Previous">
                <i class="fas fa-long-arrow-left"></i>
              </a>
          </li>
          <c:if test="${ list.size() !=0 }">
      <div class="page">
         <ul class="pagination">
            <li class="page-item"><c:url var="goBack" value="${ loc }">
                  <c:if test="${pi.currentPage>1 }">
                     <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
                  </c:if>
               </c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
            </a></li>
            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
               <c:url var="goNum" value="${ loc }">
                  <c:param name="page" value="${ p }"></c:param>
               </c:url>
               <li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
            </c:forEach>
            <li class="page-item"><c:url var="goNext" value="${ loc }">
                  <c:if test="${pi.endPage > pi.currentPage }">
                     <c:param name="page" value="${ pi.currentPage+1 }"></c:param>
                  </c:if>
               </c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
                  aria-hidden="true">&raquo;</span>
            </a></li>
         </ul>
      </div>
   </c:if>
          
          <li>
              <c:url var="goNext" value="${ loc }">
                  <c:if test="${ boardNum != null }">
                      <c:param name="boardNum" value="${ boardNum }"/>
                  </c:if>
                  <c:if test="${ searchValue != null }">
                      <c:param name="searchValue" value="${ searchValue }"/>
                  </c:if>
                  <c:if test="${boardType != null}">
                  	<c:param name="boardType" value="${boardType}"/>
                  </c:if>
                  <c:param name="page" value="${ pi.currentPage+1 }"/>
              </c:url>
              <a class="page-link" href="${ goNext }" aria-label="Next">
                <i class="fa fa-long-arrow-right"></i>
              </a>
          </li>
        </ul> --%>
							<!-- </div> -->
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- 부트스트랩 -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> -->

<script>
	
		<!-- 조건검색 -->
		const searchBoard = () => {
			   const searchCondition = document.getElementById('searchCondition').value;
			   const searchValue = document.getElementById('searchValue').value;
			   
			   location.href='${contextPath}/search.bo?searchCondition=' + searchCondition + '&searchValue=' + searchValue;
		}
	
		<!-- 카테고리 -->
	   const categorys = document.getElementsByClassName('ll');
	   for(const category of categorys){
		   category.addEventListener('click', function(){
			   const boardCategory = category.className.substr(2);
			   location.href='${contextPath}/boardList.bo?boardCategory=' + boardCategory + '&page=' + ${pi.currentPage};
			   console.log(boardCategory);
		   });
	   }
	   
		<!-- 상세보기 -->
		window.onload = () => {
		   /* const bCardAll = document.querySelector('.col-sm-6'); */
		   const boardCard = document.getElementsByClassName('blog__btn');
		   
		   for(const card of boardCard) {
			   card.addEventListener('click', function() {
				   const hiddens = this.parentElement.parentElement.parentElement.querySelectorAll('input');
				   //console.log(hiddens);
				   const boardCategory = hiddens[0].value;
				   const boardNum = hiddens[1].value;
				   //console.log(boardNum);
				   const writer = hiddens[2].value;
				   //console.log(writer);
				location.href='${contextPath}/boardView.bo?boardCategory=' + boardCategory + '&boardNum=' + boardNum + '&writer=' + writer + '&page=' + ${pi.currentPage};
	
		   
			 });
		   }   
		}
	</script>
</body>
</html>