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
<title>비밀번호찾기결과</title>
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
	cursor: pointer;
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
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
		    <div style="margin-top:50px;"></div>
	<div class="container">
		<div class="row">
			<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3 ">
				<div class="panel" style="border: 1px solid rgb(122, 122, 122);">
					<div class="panel-heading">
						<a href="#"><img src="resources/img/logo.svg" alt=""
							style="height: 60px; width: 80px;"></a> <span
							style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">비밀번호
							변경</span>
						<div style="font-size: 5px;">로그인을 통해 영해의 다양한 서비스를 사용해 보세요.</div>
					</div>
					
					<div class="panel-body p-3">
						<form action="${contextPath }/updatePwd.me" method="POST" id="updatePwd2">
						<input id="userId" name="userId" type="hidden" value="${ userId }">
							<div class="form-group py-2" style="margin-top: 15px;">
								<div>새 비밀번호*</div>
								<div class="input-field" id="myPwd2">
									<input type="password" id="myPwd" name="myPwd" placeholder="비밀번호를 입력해주세요" required>
								</div>
							</div>
							<div class="form-group py-1 pb-2" style="margin-bottom: 15px;">
								<div>새 비밀번호 확인*</div>
								<div class="input-field" id="myPwdChk2">
									<input type="password" id="myPwdChk" style="width: 450px; border: 0;"
										placeholder="비밀번호를 입력해주세요" required>
								</div>
							</div>
							<input type="submit" id="enrollBtn" class="btn btn-primary btn-block mt-3 "
								style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" value="비밀번호변경">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	// 비밀번호 일치 확인
	window.onload = () => {
		// 비밀번호 정규표현식
        const pwd1 = document.getElementById('myPwd');
        const pwd2 = document.getElementById('myPwdChk');
        const myPwd2 = document.getElementById('myPwd2');
        const myPwdChk2 = document.getElementById('myPwdChk2');
        const regExp2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/

        const checkRegPwd = document.getElementById('checkRegPwd');
        const checkPwd = document.getElementById('checkPwd');

        pwd1.addEventListener('change', function() {
            if (regExp2.test(this.value)) {
                pwd1.style.backgroundColor = '#24E082';
                myPwd2.style.backgroundColor = '#24E082';
                isPwd = true;
                if (pwd1.value != pwd2.value && pwd1.value != "") {
                    pwd2.style.backgroundColor = '#FFCECE';
                    myPwdChk2.style.backgroundColor = '#FFCECE';
                }
            } else {
                pwd1.style.backgroundColor = '#FFCECE';
                myPwd2.style.backgroundColor = '#FFCECE';
                isPwd = false;
                if (pwd1.value != pwd2.value && pwd1.value != "") {
                    pwd2.style.backgroundColor = '#FFCECE';
                    myPwdChk2.style.backgroundColor = '#FFCECE';
                }
            }
        })


        // 비밀번호 일치 확인
        pwd2.addEventListener('change', function() {
            if (pwd1.value == pwd2.value && pwd1.value != "") {
                console.log('일치');
                pwd2.style.backgroundColor = '#24E082';
                myPwdChk2.style.backgroundColor = '#24E082';
                isPwd2 = true;

            } else {
                console.log('불일치');
                pwd2.style.backgroundColor = '#FFCECE';
                myPwdChk2.style.backgroundColor = '#FFCECE';
                isPwd2 = false;
            }
        });
        
    	 // 회원가입 버튼 활성화
        document.getElementById('enrollBtn').addEventListener('click', function() {
            const enrollBtn = document.getElementById('enrollBtn');

            if (isPwd && isPwd2) {
                document.getElementById('updatePwd2').submit();
            } else {
                alert('회원가입 폼에 맞춰주세요.');
                if (!isPwd) {
                    document.getElementById('myPwd').focus();
                } else if (!isPwd2) {
                    document.getElementById('myPwdChk').focus();
                } 
            }
        });
	}
	</script>
</body>
</html>