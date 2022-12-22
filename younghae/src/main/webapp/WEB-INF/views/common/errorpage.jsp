<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>YOUNGHAE - 404</title>

	<!-- Google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gugi&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
	<!--font-family: 'Gugi', cursive;font-family: 'IBM Plex Sans KR', sans-serif;-->

	<style>

		* {
		-webkit-box-sizing: border-box;
				box-sizing: border-box;
		}

		body {
		padding: 0;
		margin: 0;
		}

		#notfound {
		position: relative;
		height: 100vh;
		background-color: #fafbfd;
		}

		#notfound .notfound {
		position: absolute;
		left: 50%;
		top: 50%;
		-webkit-transform: translate(-50%, -50%);
			-ms-transform: translate(-50%, -50%);
				transform: translate(-50%, -50%);
		}

		.notfound {
		max-width: 520px;
		width: 100%;
		text-align: center;
		}

		.notfound .notfound-bg {
		position: absolute;
		left: 0px;
		right: 0px;
		top: 50%;
		-webkit-transform: translateY(-50%);
			-ms-transform: translateY(-50%);
				transform: translateY(-50%);
		z-index: -1;
		}

		.notfound .notfound-bg > div {
		width: 100%;
		background: #fff;
		border-radius: 90px;
		height: 125px;
		}

		.notfound .notfound-bg > div:nth-child(1) {
		-webkit-box-shadow: 5px 5px 0px 0px #f3f3f3;
				box-shadow: 5px 5px 0px 0px #f3f3f3;
		}

		.notfound .notfound-bg > div:nth-child(2) {
		-webkit-transform: scale(1.3);
			-ms-transform: scale(1.3);
				transform: scale(1.3);
		-webkit-box-shadow: 5px 5px 0px 0px #f3f3f3;
				box-shadow: 5px 5px 0px 0px #f3f3f3;
		position: relative;
		z-index: 10;
		}

		.notfound .notfound-bg > div:nth-child(3) {
		-webkit-box-shadow: 5px 5px 0px 0px #f3f3f3;
				box-shadow: 5px 5px 0px 0px #f3f3f3;
		position: relative;
		z-index: 90;
		}

		.notfound h1 {
		font-family: 'Gugi', cursive;
		font-size: 86px;
		text-transform: uppercase;
		font-weight: 700;
		margin-top: 0;
		margin-bottom: 8px;
		color: #151515;
		}

		.notfound h2 {
		font-family: 'Gugi', cursive;
		font-size: 26px;
		margin: 0;
		font-weight: 700;
		color: #151515;
		}

		.notfound a {
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

		@media only screen and (max-width: 767px) {
			.notfound .notfound-bg {
			width: 287px;
			margin: auto;
			}

			.notfound .notfound-bg > div {
			height: 85px;
		}
		}

		@media only screen and (max-width: 480px) {
		.notfound h1 {
			font-size: 68px;
		}

		.notfound h2 {
			font-size: 18px;
		}
		}

	</style>

</head>

<body>

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-bg">
				<div></div>
				<div></div>
				<div></div>
			</div>
			<h1>앗!</h1>
			<h2>Error 404 : Page Not Found</h2>
			<h4>${ requestScope['javax.servlet.error.message'] }</h4>
			<a href="javascript:history.back();">뒤로 가기</a>
		</div>
	</div>

</body>

</html>