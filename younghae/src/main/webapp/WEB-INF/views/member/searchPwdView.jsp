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
    <title>비밀번호찾기</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

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

        input[type='text'],
        input[type='password'] {
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

        @media (max-width : 360px) {
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
                        <a href="#"><img src="resources/img/logo.svg" alt="" style="height: 60px; width: 80px;"></a> <span style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">비밀번호
                            찾기</span>
                        <div style="font-size: 5px;">로그인을 통해 영해의 다양한 서비스를 사용해 보세요.</div>
                    </div>
                    <div class="panel-body p-3">
                        <form action="${contextPath }/searchPwdResult.me" method="POST" id='searchPwdResult'>
                            <div class="form-group py-2">
                                <div>아이디*</div>
                                <div class="input-field">
                                    <input id="userId" name="userId" type="text" placeholder="아이디를 입력해주세요" required>
                                </div>
                            </div>
                            <div class="form-group py-1 pb-2">
                                <div>이메일*</div>
                                <div class="input-field">
                                    <input type="email" id="myEmail" style="width: 450px; border: 0;" placeholder="이메일을 입력해주세요" required>
                                </div>
                            </div>
                            <div class="form-group py-1 pb-2">
                                <div>
                                    이메일 인증번호확인 *
                                    <button id="mail-Check-Btn" type="button" style="float: right; border: 0; " disabled>인증번호
                                        전송</button>
                                </div>
                                <div class="input-field" id="myEmailChk2">
                                    <input id="myEmailChk" type="text" placeholder="인증번호를 입력해주세요" required>
                                    <button id="checkCodeBtn" type="button" style="float: right; border: 0; width: 46px;">확인</button>
                                </div>
                            </div>
                            <input type="button" id="enrollBtn" class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" value="아이디인증">
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
    window.onload = () => {
    	
    	let isEmailCheck = false;
    	//이메일이 맞는지확인하기
    	document.getElementById('myEmail').addEventListener('change', function() {
    		const email = document.getElementById('myEmail').value;
    		const id = document.getElementById('userId').value;
    		const checkEmailBtn = document.getElementById('mail-Check-Btn');
    		
    		$.ajax({
                type: 'get',
                url: '${contextPath}/emailIdChk.me',
                data: {
                    memberEmail: email,
                    memberId : id
                },
                success: (data) => {
                    console.log(data);
                    if (data.trim() == 'yes') {
                        checkEmailBtn.disabled = false;
                        checkEmailBtn.style.cursor = 'pointer';
                        checkEmailBtn.style.color = 'black';
                        isEmail = true;
                    } else if (data.trim() == 'no') {
                        checkEmailBtn.disabled = true;
                        checkEmailBtn.style.color = 'lightgray';
                        isEmail = false;
                    } else {
                        checkEmailBtn.disabled = true;
                        checkEmailBtn.style.color = 'lightgray';
                        isEmail = false;
                    }
                },
                error: (data) => {
                    console.log(data);
                }

            })
    	});
        // 인증번호 보내기
        document.getElementById('mail-Check-Btn').addEventListener('click', function() {
            const email = document.getElementById('myEmail').value;
            const checkEmail = document.getElementById('myEmailChk');

            $.ajax({
                type: 'get',
                url: '${contextPath}/checkEmail.me',
                data: {
                    memberEmail: email
                },
                success: (data) => {
                    console.log(data);
                    checkEmail.disabled = false;
                    code = data;
                    alert('인증번호가 전송되었습니다.');
                    document.getElementById('checkCodeBtn').style.color = 'black';
                    document.getElementById('checkEmail').style.display = '';
                    document.getElementById('checkCodeBtn').style.display = '';
                },
                error: (data) => {
                    console.log(data);
                }

            })
        });

        // 인증번호 확인
        document.getElementById('checkCodeBtn').addEventListener('click', function() {
            const inputEmail = document.getElementById("myEmailChk").value;
            const resultEmail = document.getElementById("myEmailChk");
            const resultEmail2 = document.getElementById("myEmailChk2");

            if (inputEmail == code) {
                resultEmail.style.backgroundColor = '#24E082';
                resultEmail2.style.backgroundColor = '#24E082';
                isEmailCheck = true;
            } else {
                resultEmail.style.backgroundColor = '#FFCECE';
                resultEmail2.style.backgroundColor = '#24E082';
                isEmailCheck = false;
            }
        });
        //확인버튼 활성화
        document.getElementById('enrollBtn').addEventListener('click', function() {
            const enrollBtn = document.getElementById('enrollBtn');

            if(isEmailCheck) {
                document.getElementById('searchPwdResult').submit();
            } else {
                alert('회원가입 폼에 맞춰주세요.');
                if (!isEmailCheck) {
                    document.getElementById('isEmailCheck').focus();
                } 
            }
        });
    }
        
    </script>
</body>

</html>