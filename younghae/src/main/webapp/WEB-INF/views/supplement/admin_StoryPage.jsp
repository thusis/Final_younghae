<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--     <meta name="description" content="Ogani Template"> -->
<!--     <meta name="keywords" content="Ogani, unica, creative, html"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!--     <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>컬럼</title>

    <style>

        /* 첨부파일 관련 CSS*/
        .filebox .upload-name {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid transparent;
            width: 78%;
            color: #999999;
        }

        .filebox label {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            vertical-align: middle;
            background-color: #24E082;
            border-radius: 1em;
            cursor: pointer;
            /* height: 78%; */
            margin-left: 10px;
        }

        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }

        #detail{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        /*목차*/
        .bn_index ul li{
            list-style: none;
            position: relative;
            display: inline-block;
        }
        
        .bn_index a {
            color: black;
            
        }
        
        .bn_index li:last-child a{
            font-weight: 800;
            color : #FD9F28;
        }
    </style>
</head>

<body>
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->
	
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	
    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>건강해지는 이야기 관리</li>
            </ul>
        </div>
    </div>

    <section class="featured spad" style="margin-left: 20%; margin-right: 20%;">
        <div class="container">
            <div class="col-lg-12 col-md-12">
                <div class="row" style="width: 100%; margin: 0; height: 60%;" id="ajaxdiv">
                	<c:forEach items="${ list }" var="story">
	                    <div class="col-lg-5 col-md-5 col-sm-5" style="border: 1px solid #24E082; border-radius: 2em; padding-top: 1%; margin: 3%; display: inline;">
	                        <div class="blog__item">
	                            <div class="blog__item__pic">
	                               	<input type="hidden" name="boardNum" value="${ story.boardNum }">
	                               	<input type="hidden" name="boardUserNum" value="${ story.userNum }">
	                                <img src="${ story.attachment.attachRename }" style="width: 100px; height: 300px; border-radius: 1.5em;" alt="">
	                            </div>
	                            <div class="blog__item__text">
	                                <ul>
	                                    <li><i class="fa fa-calendar-o"></i>&nbsp;${ story.boardModifyDate }</li>
	                                    <li><i class="bi bi-eye"></i>&nbsp;${ story.boardView }</li>
			                            <div class="trashIcon" style="display: inline; float: right; font-size: 150%; color: #CC2525;">
		                                	<input type="hidden" name="boardNum" value="${ story.boardNum }">
			                                	<i class="bi bi-trash3"></i>
			                            </div>
	                                </ul>
	                                <div class="title" style="font-size: 20px; font-weight: bold;">${ story.boardTitle }</div>
	                                
	                                <div id="detail" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
                	</c:forEach>

					<!-- 페이징 -->
					<div class="col-lg-12 text-center" style="margin-top: 8%;">
						<div class="product__pagination blog__pagination">
							<c:url var="goBack" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
							</c:url>
							<c:if test="${ pi.currentPage > 1 }">
								<a href="${ goBack }" aria-label="Previous"><i class="fa fa-long-arrow-left"></i></a>
							</c:if>
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${p}"></c:param>
								</c:url>
								<a href="${ goNum }">${ p }</a>
							</c:forEach>
							<c:url var="goNext" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
							</c:url>
							<c:if test="${ pi.currentPage < pi.endPage }">
							<a href="${ goNext }"><i class="fa fa-long-arrow-right"></i></a>
							</c:if>
						</div>
					</div>
				</div>
            </div>
        </div>
    </section>


    <!-- Footer Section Begin -->
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Footer Section End -->

        <script>
            window.onload=()=>{
                $('.trashIcon').children().on('click', function(){
                	var check = 'N';
                    if($(this).attr("class") != "bi bi-trash3-fill"){
                        // 쓰레기통 버튼 활성화 됐을 때
                        $(this).attr("class", "bi bi-trash3-fill");
                        check = 'Y';
                    }else{
                        // 쓰레기통 버튼 비활성화
                        $(this).attr("class", "bi bi-trash3");
                        check = 'N';
                    }
//                     console.log($(this).siblings()[0].value);
                    
                    $.ajax({
                    	url:'${ contextPath }/trash.st',
                    	data: {boardNum: $(this).siblings()[0].value, check: check},
                    	success:(data)=>{
                    		console.log(data);
                    		
                    		location.reload();
                    	},
                    	error:(data)=>{
                    		console.log(data);
                    	}
                    });
                }); // 클래스 이름으로 비교해서 ajax 실행...인데 ajax로 삭제 후 리스트도 뿌려야하나...?
                
                
                // 이미지, 제목 클릭시 상세보기로 넘기기
				$('.blog__item__pic').on('click', function(){
// 					console.log($(this).children('input')[1].value);
					const boardNum = $(this).children('input')[0].value;
					const userNum = $(this).children('input')[1].value;
					
// 					location.href = '${contextPath}/selectUpdateStory.st?boardNum='+boardNum+'&userNum='+userNum+'&page='+${pi.currentPage};
				});
                
				$('.title').on('click', function(){
// 					console.log($(this).parents().children('.blog__item__pic').children()[0].value);
					const boardNum = $(this).parents().children('.blog__item__pic').children()[0].value;
					const userNum = $(this).parents().children('.blog__item__pic').children()[1].value;
					
					console.log(boardNum);

					var page = "${ pi.currentPage }";
					location.href = '${	contextPath}/selectUpdateStory.st?boardNum='+boardNum+'&userNum='+userNum+'&page='+page;
				});
            }
        </script>
    </body>
    
    </html> 

    <!-- https://doriri.tistory.com/45 -->