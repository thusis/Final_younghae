<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>내 정보</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif
}

/* body {
            height: 100vh;
            background: linear-gradient(to top, #c9c9ff 50%, #9090fa 90%) no-repeat
        } */
.container {
	margin: 50px auto
}

.panel-heading {
	text-align: center;
	margin-bottom: 10px
}

#forgot {
	min-width: 100px;
	margin-left: auto;
	text-decoration: none
}

a:hover {
	text-decoration: none
}

.form-inline label {
	padding-left: 10px;
	margin: 0;
	cursor: pointer
}

.btn.btn-primary {
	margin-top: 20px;
	border-radius: 15px
}

.panel {
	min-height: 380px;
	box-shadow: 20px 20px 80px rgb(218, 218, 218);
	border-radius: 12px
}

.input-field {
	border-radius: 5px;
	padding: 5px;
	display: flex;
	align-items: center;
	border: 1px solid rgb(122, 122, 122);
	color: #4343ff
}

input[type='text'], input[type='password'] {
	border: none;
	outline: none;
	box-shadow: none;
	width: 100%
}

.fa-eye-slash.btn {
	border: none;
	outline: none;
	box-shadow: none
}

/* img {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 50%;
            position: relative
        } */
a[target='_blank'] {
	position: relative;
	transition: all 0.1s ease-in-out
}

.bordert {
	border-top: 1px solid rgb(122, 122, 122);
	position: relative
}

.bordert:after {
	content: "\00a0 \00a0 \00a0 간편 로그인 \00a0 \00a0";
	position: absolute;
	top: -13px;
	left: 33%;
	background-color: #fff;
	padding: 0px 8px
}

@media ( max-width : 360px) {
	#forgot {
		margin-left: 0;
		padding-top: 10px
	}
	body {
		height: 100%
	}
	.container {
		margin: 30px 0
	}
	.bordert:after {
		left: 25%
	}
}

.bn_index ul li {
	list-style: none;
	position: relative;
	display: inline-block;
}

.bn_index a {
	color: black;
}

.bn_index li:last-child a {
	font-weight: 800;
	color: #FD9F28;
}
</style>
</head>

<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">정보수정</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="row">
			<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3 ">
				<div class="panel" style="border: 1px solid rgb(122, 122, 122);">
					<div class="panel-heading">
						<a href="#"><img src="resources/img/logo.svg" alt=""
							style="height: 60px; width: 80px;"></a> <span
							style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">정보수정</span>
					</div>
					<form action="login_script.php" method="POST">
						<div class="panel-body p-3">
							<div class="form-group py-2">
								<div>아이디*</div>
								<div class="input-field">
									<input type="text" value="login_id" readonly>
								</div>
							</div>
							<div class="form-group py-1 pb-2">
								<div>비밀번호*</div>
								<div class="input-field">
									<input type="password" placeholder="비밀번호을 입력해주세요" required>
								</div>
							</div>
							<div class="form-group py-2">
								<div>비밀번호확인*</div>
								<div class="input-field">
									<input type="password" placeholder="비밀번호를 확인해주세요" required>
								</div>
							</div>
							<div class="form-group py-2">
								<div>이름*</div>
								<div class="input-field">
									<input type="text" value="login_name" readonly>
								</div>
							</div>
							<div class="form-group py-2">
								<div>닉네임*</div>
								<div class="input-field">
									<input type="text" placeholder="닉네임을 입력해주세요" required>
								</div>
							</div>
							<div class="form-group py-2">
								<div>이메일*</div>
								<div class="input-field">
									<input type="email" style="width: 100%; border: 0;"
										value="loing_email" readonly>
								</div>
							</div>
							<div class="form-group py-2">
								<div>성별*</div>
								<div>
									<input type="radio" name="chk_info" value="M"><a
										style="margin-right: 80px;">남</a> <input type="radio"
										name="chk_info" value="F"><a
										style="margin-right: 80px;">여</a> <input type="radio"
										name="chk_info" value="N"><a>알리고싶지않음</a>
								</div>
							</div>
							<div class="form-group py-2">
								<div>전화번호</div>
								<div class="input-field">
									<input type="text" placeholder="전화번호를 입력해주세요">
								</div>
							</div>
							<div class="form-group py-2">
								<div>
									주소*
									<button type="button" style="float: right; border: 0;">주소
										검색</button>
								</div>
								<div class="input-field">
									<input type="text" placeholder="주소를 입력해주세요" required>
								</div>
							</div>
							<div class="form-group py-2">
								<div>상세주소*</div>
								<div class="input-field">
									<input type="text" placeholder="상세주소를 입력해주세요" required>
								</div>
							</div>
							<div class="form-group py-2">
								<div>내추천인코드</div>
								<div class="input-field">
									<input type="text" value="login_recommand" readonly>
								</div>
							</div>
							<button class="btn btn-primary btn-block mt-3 "
								style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);">정보수정</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>