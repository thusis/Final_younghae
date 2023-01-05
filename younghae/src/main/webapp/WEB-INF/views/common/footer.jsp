<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
 
</head>

<body>
<!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="resources/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                        	<li><img src="resources/img/logo.svg"></li>
                            <li>영양제를 해석하다</li>
                            <li>팀원 : 강혜진, 송영호, 이봉은, 이주희, 조소연, </li>
                            <li>git : https://github.com/thusis/Final_younghae.git</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="footer__widget" style="text-align:right">
                        <h6>유용한 링크</h6>
                        <ul style="width: 100%;">
                            <li><a href="${contextPath }/category.su">영양제 성분</a></li>
                            <li><a href="${contextPath }/shoppingMain.sh">영양제 구매</a></li>
                            <li><a href="${contextPath }/home.qa">질문하기</a></li>
                            <li><a href="${contextPath }/storyList.st">영해스토리</a></li>
                            <li><a href="${contextPath }/boardList.bo">건강이야기</a></li>
                            <li><a href="${contextPath }/event.ev">이벤트</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="resources/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>