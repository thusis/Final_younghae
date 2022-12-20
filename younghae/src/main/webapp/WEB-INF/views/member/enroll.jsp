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
<title>회원가입</title>
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
</style>

</head>

<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<div class="container">
		<!-- <div class="row"> -->
		<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3 ">
			<div class="panel" style="border: 1px solid rgb(122, 122, 122);">
				<div class="panel-heading">
					<a href="#"><img src="resources/img/logo.svg" alt=""
						style="height: 60px; width: 80px;"></a> <span
						style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">회원가입</span>
					<div style="font-size: 5px;">가입을 통해 영해의 다양한 서비스를 사용해 보세요.</div>
				</div>
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true"
						style="color: black;">일반 회원</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tabs-2" role="tab" aria-selected="false"
						style="color: black;">전문 회원</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<form action="login_script.php" method="POST">
							<div class="panel-body p-3">
								<div class="form-group py-2">
									<div>아이디*</div>
									<div class="input-field">
										<input type="text" id="myId" placeholder="아이디를 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-1 pb-2">
									<div>비밀번호*</div>
									<div class="input-field">
										<input type="password" id="myPwd" placeholder="비밀번호을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>비밀번호확인*</div>
									<div class="input-field">
										<input type="password" id="myPwdChk"
											placeholder="비밀번호를 확인해주세요" required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>이름*</div>
									<div class="input-field">
										<input type="text" id="myName" placeholder="이름을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>닉네임*</div>
									<div class="input-field">
										<input type="text" id="myNickName" placeholder="닉네임을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>이메일*</div>
									<div class="input-field">
										<input type="email" id="myEmail"
											style="width: 100%; border: 0;" placeholder="이메일을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>
										이메일 인증번호*
										<button type="button" style="float: right; border: 0;">인증번호전송</button>
									</div>
									<div class="input-field">
										<input type="text" id="myEmailChk" placeholder="인증번호를 입력해주세요"
											required>
										<button type="button" style="border: 0; width: 50px;">확인</button>
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
									<div>생년월일*</div>
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
										<input type="text" id="myPhone" placeholder="전화번호를 입력해주세요">
									</div>
								</div>
								<div class="form-group py-2">
									<div>
										주소*
										<button type="button" style="float: right; border: 0;">주소
											검색</button>
									</div>
									<div class="input-field">
										<input type="text" id="myAddress1" placeholder="주소를 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>상세주소*</div>
									<div class="input-field">
										<input type="text" id="myAddress2" placeholder="상세주소를 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>추천인코드</div>
									<div class="input-field">
										<input type="text" id="otherRecommand"
											placeholder="추천인코드를 입력해주세요">
									</div>
								</div>
								<button class="btn btn-primary btn-block mt-3 "
									style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);">회원가입</button>
							</div>
							<div class="mx-3 my-2 py-2 bordert">
								<div class="text-center py-3">
									<a href="#"><img
										src="resources/img/kakao_login_medium_narrow.png"></a>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="tabs-2" role="tabpanel">
						<form action="login_script2.php" method="POST">
							<div class="panel-body p-3">
								<div class="form-group py-2">
									<div>아이디*</div>
									<div class="input-field">
										<input type="text" id="myId" placeholder="아이디를 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-1 pb-2">
									<div>비밀번호*</div>
									<div class="input-field">
										<input type="password" id="myPwd" placeholder="비밀번호을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>비밀번호확인*</div>
									<div class="input-field">
										<input type="password" id="myPwdChk"
											placeholder="비밀번호를 확인해주세요" required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>이름*</div>
									<div class="input-field">
										<input type="text" id="myName" placeholder="이름을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>닉네임*</div>
									<div class="input-field">
										<input type="text" id="myNickName" placeholder="닉네임을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>이메일*</div>
									<div class="input-field">
										<input type="email" id="myEmail"
											style="width: 100%; border: 0;" placeholder="이메일을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>
										이메일 인증번호*
										<button type="button" style="float: right; border: 0;">인증번호전송</button>
									</div>
									<div class="input-field">
										<input type="text" id="myEmailChk" placeholder="인증번호를 입력해주세요"
											required>
										<button type="button" style="border: 0; width: 50px;">확인</button>
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
									<div>생년월일*</div>
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
										<input type="text" id="myPhone" placeholder="전화번호를 입력해주세요">
									</div>
								</div>
								<div class="form-group py-2">
									<div>생년월일</div>
									<div class="input-field">
										<input type="text" id="myBirth"
											placeholder="생년월일 6자를 입력해주세요. ">
									</div>
								</div>
								<div class="form-group py-2">
									<div>
										주소*
										<button type="button" style="float: right; border: 0;">주소
											검색</button>
									</div>
									<div class="input-field">
										<input type="text" id="myAddress1" placeholder="주소를 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>상세주소*</div>
									<div class="input-field">
										<input type="text" id="myAddress2" placeholder="상세주소를 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>추천인코드</div>
									<div class="input-field">
										<input type="text" id="otherRecommand"
											placeholder="추천인코드를 입력해주세요">
									</div>
								</div>
								<div class="form-group py-2">
									<div>
										전문가 인증* <label class="input-file-button" for="input-file"
											style="float: right;">사진첨부</label> <input type="file"
											id="input-file" style="display: none;">
									</div>
								</div>
								<button class="btn btn-primary btn-block mt-3 "
									style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	</script>
</body>
</html>
