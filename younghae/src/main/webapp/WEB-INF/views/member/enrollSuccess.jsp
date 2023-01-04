<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입성공</title>
    
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
    
       <style>
      
      h1, h2, h3, h4, h5{
         font-family: 'IBM Plex Sans KR', sans-serif;
      }
      .contact a {
         font-family: 'IBM Plex Sans KR', sans-serif;
         font-size: 18px;
         text-decoration: none;
         text-transform: uppercase;
         background: #18e06f;
         display: inline-block;
         padding: 15px 30px;
         border-radius: 5px;
         font-weight: 500;
         color: #fff;
         margin-top: 20px;
      }
      
   </style>
      <jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>

	<body>
	<div class="container">
	
        <section class="contact spad">
               <div class="section-title" style="padding: 5rem 5rem 5rem 5rem; border:0.5rem solid #24E082; ">
                   <h2> 회원가입에 성공하셨습니다. </h2>
                   <a href="login.me">
                   로그인
                   <img src="resources/img/logo_pill_white.svg" alt="흰로고">
                   </a>
                   <a href="home.do">
                   홈으로
                   <img src="resources/img/logo_pill_white.svg" alt="흰로고">
                   </a>
            </div>
</section>
</div>
</body>

</html>