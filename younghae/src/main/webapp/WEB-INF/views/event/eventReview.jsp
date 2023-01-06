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
<title>리뷰 이벤트</title>

<!--Soyeon-->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">

</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<br>
	<br>
	<h4 id="eventTitle">✨📚 영해의 리뷰 이벤트 📚✨</h4>

	<hr width="80%" style="border: 2px solid #24E082;" noshade />
	<br>
	<br>
	<div class="attendance">
		<img src="resources/img/event/Review.png"
			style="width: 800px; height: 800px;">
	</div>

	<br>
	<br>
	<div id="eventReviewBtn">
		<a href="#" class="btn-3d yellow">리뷰 쓰러가기</a> <a href="#"
			class="btn-3d yellow">보상받기</a>
	</div>
	<br>
	<br>

 		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- 버튼 JS-->
	<script>
		$('.yellow').click(function(event) {
			event.preventDefault();
		});
	</script>
</body>
</html>