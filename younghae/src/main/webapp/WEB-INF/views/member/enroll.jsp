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
        <!-- <div class="row"> -->
        <div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3 ">
            <div class="panel" style="border: 1px solid rgb(122, 122, 122);">
                <div class="panel-heading">
                    <a href="#"><img src="resources/img/logo.svg" alt="" style="height: 60px; width: 80px;"></a> <span style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">회원가입</span>
                    <div style="font-size: 5px;">가입을 통해 영해의 다양한 서비스를 사용해 보세요.</div>
                </div>
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true" style="color: black;">일반 회원</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false" style="color: black;">전문 회원</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs-1" role="tabpanel">
                        <!-- 일반 회원가입시작 -->
                        <form action="${ contextPath }/insertMember.me" method="POST" id='insertForm'>
                            <input type="hidden" name="category" value="general">
                            <div class="panel-body p-3">
                                <div class="form-group py-2">
                                    <div>아이디*(첫글자는 영어 5~11자리)</div>
                                    <div class="input-field" id="myId2">
                                        <input type="text" id="myId" name="userId" placeholder="아이디를 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-1 pb-2">
                                    <div>비밀번호*(8자이상 하나이상의 문자/숫자/특수문자)</div>
                                    <div class="input-field" id="myPwd2">
                                        <input type="password" id="myPwd" name="userPwd" placeholder="비밀번호을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>비밀번호확인*</div>
                                    <div class="input-field" id="myPwdChk2">
                                        <input type="password" id="myPwdChk" placeholder="비밀번호를 확인해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이름*</div>
                                    <div class="input-field" id="myName2">
                                        <input type="text" id="myName" name="userName" placeholder="이름을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>닉네임*(첫글자는 영어/한글 숫자금지)</div>
                                    <div class="input-field" id="myNickName2">
                                        <input type="text" id="myNickName" name="userNickname" placeholder="닉네임을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이메일*</div>
                                    <div class="input-field" id="myEmail2">
                                        <input type="email" id="myEmail" style="width: 100%; border: 0;" name="email" placeholder="이메일을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>
                                        이메일 인증번호*
                                        <button type="button" id="mail-Check-Btn" style="float: right; border: 0; background-color:white;"  disabled>인증번호전송</button>
                                    </div>
                                    <div class="input-field" id="myEmailChk2">
                                        <input type="text" id="myEmailChk" placeholder="인증번호를 입력해주세요" required>
                                        <button type="button" id="checkCodeBtn" style="border: 0; width: 50px; background-color:white;">확인</button>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>성별*</div>
                                    <div>
                                        <input type="radio" name="gender" value="M" required="required">
                                        <a style="margin-right: 80px;">남</a>
                                        <input type="radio" name="gender" value="F" required="required">
                                        <a style="margin-right: 80px;">여</a>
                                        <input type="radio" name="gender" value="N" required="required"><a>알리고싶지않음</a>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>고민부위</div>
                                    <div>
                                        <input type="checkbox" name="userHealth" value="눈">눈 <input type="checkbox" name="userHealth" value="피부">피부 <input type="checkbox" name="userHealth" value="피로">피로 <input type="checkbox" name="userHealth" value="장">장 <input type="checkbox" name="userHealth" value="간">간 <input type="checkbox" name="userHealth" value="관절">관절 <input type="checkbox" name="userHealth" value="임산부">임산부
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>생년월일*(주민등록번호 앞 6자리를 입력해주세요.)</div>
                                    <div class="input-field">
                                        <input type="text" id="myBirth" name="userBirths" style="weigth: 100%;" placeholder="생년월일" required >
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>전화번호(-을제외하고 입력해주세요.)</div>
                                    <div class="input-field">
                                        <input type="text" id="myPhone" name="userPhone" placeholder="전화번호를 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>
                                        주소*
                                        <button type="button" id="searchAddress" style="float: right; border: 0; background-color:white;">주소 검색</button>
                                    </div>
                                    <div class="input-field" style="margin-bottom: 5px">
                                        <input type="text" id="myAddress1" name="userZipcode" placeholder="우편번호" required readonly>
                                    </div>
                                    <div class="input-field">
                                        <input type="text" id="myAddress2" name="userAddress" placeholder="주소를 입력해주세요" required readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>상세주소*</div>
                                    <div class="input-field">
                                        <input type="text" id="myAddress3" name="userAddressDetail" placeholder="상세주소를 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>추천인코드(포인트 1000점이 지급됩니다.)</div>
                                    <div class="input-field">
                                        <input type="text" id="otherRecommand" name="userRecommend" placeholder="추천인코드를 입력해주세요">
                                    </div>
                                </div>
                                <button type="button" class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" id="enrollBtn">회원가입</button>
                            </div>
                            <div class="mx-3 my-2 py-2 bordert">
                                <div class="text-center py-3">
                                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=6ca1f8428b3e4b30036e0a07884586be&redirect_uri=http://localhost:8888/young/kakaoLogin.me&response_type=code"><img src="resources/img/kakao_login_medium_narrow.png"></a>
                                </div>
                            </div>
                        </form>
                    </div>


                    <!-- 전문가 회원가입시작 -->
                    <div class="tab-pane" id="tabs-2" role="tabpanel">
                        <form action="${ contextPath }/insertMember.me" method="POST" id='insertFormExpert'>
                            <input type="hidden" name="category" value="export">
                            <div class="panel-body p-3">
                                <div class="form-group py-2">
                                    <div>아이디*(첫글자는 영어 5~11자리)</div>
                                    <div class="input-field" id="myIdExport2">
                                        <input type="text" id="myIdExport" name="userId" placeholder="아이디를 입력해주세요" required>
                                    </div>
                                </div>

                                <div class="form-group py-1 pb-2">
                                    <div>비밀번호*(8자이상 하나이상의 문자/숫자/특수문자)</div>
                                    <div class="input-field" id="myPwdExport2">
                                        <input type="password" id="myPwdExport" name="userPwd" placeholder="비밀번호을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>비밀번호확인*</div>
                                    <div class="input-field" id="myPwdChkExport2">
                                        <input type="password" id="myPwdChkExport" placeholder="비밀번호를 확인해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이름*</div>
                                    <div class="input-field" id="myNameExport2">
                                        <input type="text" id="myNameExport" name="userName" placeholder="이름을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>닉네임*(첫글자는 영어/한글 숫자금지)</div>
                                    <div class="input-field" id="myNickNameExport2">
                                        <input type="text" id="myNickNameExport" name="userNickname" placeholder="닉네임을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이메일*</div>
                                    <div class="input-field" id="myEmailExport2">
                                        <input type="email" id="myEmailExport" style="width: 100%; border: 0;" name="email" placeholder="이메일을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>
                                        이메일 인증번호*
                                        <button type="button" id="mail-Check-Btn-Export" style="float: right; border: 0; background-color:white; " disabled >인증번호전송</button>
                                    </div>
                                    <div class="input-field" id="myEmailChkExport2">
                                        <input type="text" id="myEmailChkExport" placeholder="인증번호를 입력해주세요" required>
                                        <button type="button" id="checkCodeBtnExport" style="border: 0; width: 50px; background-color:white;">확인</button>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>성별*</div>
                                    <div>
                                        <input type="radio" name="gender" value="M" required="required"><a style="margin-right: 80px;">남</a> <input type="radio" name="gender" value="F" required="required"><a style="margin-right: 80px;" >여</a>
                                        <input type="radio" name="gender" value="N" required="required"><a>알리고싶지않음</a>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>생년월일*(주민등록번호 앞 6자리를 입력해주세요.)</div>
                                    <div class="input-field">
                                        <input type="text" id="myBirth" name="userBirths" style="weigth: 100%;" placeholder="생년월일"required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>전화번호(-을제외하고 입력해주세요.)</div>
                                    <div class="input-field">
                                        <input type="text" id="myPhoneExport" name="userPhone" placeholder="전화번호를 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>
                                        병/약국주소*
                                        <button type="button" id="searchAddressExport" style="float: right; border: 0; background-color:white;">주소 검색</button>
                                    </div>
                                    <div class="input-field" style="margin-bottom: 5px">
                                        <input type="text" id="myAddressExport1" name="userZipcode" placeholder="우편번호" required readonly>
                                    </div>
                                    <div class="input-field">
                                        <input type="text" id="myAddressExport2" name="userAddress" placeholder="주소를 입력해주세요" required readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>상세주소*</div>
                                    <div class="input-field">
                                        <input type="text" id="myAddressExport3" name="userAddressDetail" placeholder="상세주소를 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>추천인코드</div>
                                    <div class="input-field">
                                        <input type="text" id="otherRecommandExport" name="userRecommend" placeholder="추천인코드를 입력해주세요">
                                    </div>
                                    <div class="form-group py-2">
                                        <div>
                                            전문가 인증* <label class="input-file-button" for="input-file" style="float: right;">사진첨부</label> <input type="file" id="input-file" style="display: none;" required>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" id="enrollBtnExport">회원가입</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        window.onload = () => {


            let isId, isPwd, isPwd2, isName, isNickName, isEmail, isEmailCheck = false;
            let isIdExpert, isPwdExpert, isPwdExpert2, isNameExpert, isNickNameExpert, isEmailExpert, isEmailCheckExpertm = false;
            // 아이디 중복 확인
            document.getElementById('myId').addEventListener('change', function() {

                const checkId = document.getElementById('myId')
                const checkId2 = document.getElementById('myId2')
                const regExp1 = /^[a-zA-Z][a-zA-Z0-9]{4,11}$/;
                $.ajax({
                    url: '${contextPath}/checkId.me',
                    data: {
                        id: this.value
                    },
                    success: (data) => {
                        if (data.trim() == 'yes' && regExp1.test(this.value)) {
                            checkId.style.backgroundColor = '#24E082';
                            checkId2.style.backgroundColor = '#24E082';
                            isId = true;
                        } else if (data.trim() == 'yes' && !regExp1.test(this.value)) {
                            checkId.style.backgroundColor = '#FFCECE';
                            checkId2.style.backgroundColor = '#FFCECE';
                            isId = false;
                        } else if (data.trim() == 'no') {
                            checkId.style.backgroundColor = '#FFCECE';
                            checkId2.style.backgroundColor = '#FFCECE';
                            isId = false;
                        }
                    },
                    error: (data) => {
                        console.log(data);
                    }
                });
            });

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

            //이름
            document.getElementById('myName').addEventListener('change', function() {

                const regExp3 = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
                const myName2 = document.getElementById('myName2');

                if (regExp3.test(this.value)) {
                    myName.style.backgroundColor = '#24E082';
                    myName2.style.backgroundColor = '#24E082';
                    isName = true;
                } else {
                    myName.style.backgroundColor = '#FFCECE';
                    myName2.style.backgroundColor = '#FFCECE';
                    isName = false;
                }
            });


            // 닉네임 중복 확인
            document.getElementById('myNickName').addEventListener('keyup', function() {
                const checkNickName = document.getElementById('myNickName');
                const checkNickName2 = document.getElementById('myNickName2');
                const regExp4 = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]{1,}$/;

                if (this.value.trim() == '') {
                    checkNickName.style.backgroundColor = '#FFCECE';
                    checkNickName2.style.backgroundColor = '#FFCECE';
                } else {
                    $.ajax({
                        url: '${contextPath}/checkNickName.me',
                        data: {
                            nickName: this.value
                        },
                        success: (data) => {
                            console.log(data);
                            if (data.trim() == 'yes' && regExp4.test(this.value)) {
                                checkNickName.style.backgroundColor = '#24E082';
                                checkNickName2.style.backgroundColor = '#24E082';
                                isNickName = true;
                            } else if (data.trim() == 'yes' && !regExp4.test(this.value)) {
                                checkNickName.style.backgroundColor = '#FFCECE';
                                checkNickName2.style.backgroundColor = '#FFCECE';
                                isNickName = false;
                            } else if (data.trim() == 'no') {
                                checkNickName.style.backgroundColor = '#FFCECE';
                                checkNickName2.style.backgroundColor = '#FFCECE';
                                isNickName = false;
                            }
                        },
                        error: (data) => {
                            console.log(data);
                        }
                    });
                }
            });


            // 이메일 중복확인
            document.getElementById('myEmail').addEventListener('keyup', function() {
                const email = document.getElementById('myEmail').value;
                const searchEmail = document.getElementById('myEmail');
                const searchEmail2 = document.getElementById('myEmail2');
                console.log(email);
                const checkEmailBtn = document.getElementById('mail-Check-Btn');
                const regExp5 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i

                $.ajax({
                    type: 'get',
                    url: '${contextPath}/searchEmail.me',
                    data: {
                        memberEmail: email
                    },
                    success: (data) => {
                        console.log(data);
                        if (data.trim() == 'yes' && regExp5.test(this.value)) {
                            checkEmailBtn.disabled = false;
                            checkEmailBtn.style.cursor = 'pointer';
                            checkEmailBtn.style.color = 'black';
                            searchEmail.style.backgroundColor = '#24E082';
                            searchEmail2.style.backgroundColor = '#24E082';
                            isEmail = true;
                        } else if (data.trim() == 'yes' && !regExp5.test(this.value)) {
                            checkEmailBtn.disabled = true;
                            checkEmailBtn.style.color = 'lightgray';
                            searchEmail.style.backgroundColor = '#FFCECE';
                            searchEmail2.style.backgroundColor = '#FFCECE';
                            isEmail = false;
                        } else if (data.trim() == 'no') {
                            checkEmailBtn.disabled = true;
                            checkEmailBtn.style.color = 'lightgray';
                            searchEmail.style.backgroundColor = '#FFCECE';
                            searchEmail2.style.backgroundColor = '#FFCECE';
                            isEmail = false;
                        } else {
                            checkEmailBtn.disabled = true;
                            checkEmailBtn.style.color = 'lightgray';
                            searchEmail.style.backgroundColor = '#FFCECE';
                            searchEmail2.style.backgroundColor = '#FFCECE';
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
                console.log(email);
                const checkEmail = document.getElementById('myEmailChk');
                const checkCodeBtn = document.getElementById('checkCodeBtn');

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
                        checkCodeBtn.disabled = false;
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
                const resultEmail3 = document.getElementById("checkCodeBtn");

                if (inputEmail == code) {
                    resultEmail.style.backgroundColor = '#24E082';
                    resultEmail2.style.backgroundColor = '#24E082';
                    resultEmail3.style.backgroundColor = '#24E082';
                    isEmailCheck = true;
                } else {
                    resultEmail.style.backgroundColor = '#FFCECE';
                    resultEmail2.style.backgroundColor = '#24E082';
                    resultEmail3.style.backgroundColor = '#24E082';
                    isEmailCheck = false;
                }
            });

            // 주소검색
            document.getElementById('searchAddress').addEventListener('click', function() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.


                        var roadAddr = data.roadAddress; // 도로명 주소 변수

                        document.getElementById('myAddress1').value = data.zonecode;
                        document.getElementById("myAddress2").value = roadAddr;

                    }
                }).open();

            });

            // 회원가입 버튼 활성화
            document.getElementById('enrollBtn').addEventListener('click', function() {
                const enrollBtn = document.getElementById('enrollBtn');

                if (isId && isPwd && isPwd2 && isName && isNickName && isEmail && isEmailCheck) {
                    document.getElementById('insertForm').submit();
                } else {
                    alert('회원가입 폼에 맞춰주세요.');
                    if (!isId) {
                        document.getElementById('myId').focus();
                    } else if (!isPwd) {
                        document.getElementById('myPwd').focus();
                    } else if (!isPwd2) {
                        document.getElementById('myPwdChk').focus();
                    } else if (!isName) {
                        document.getElementById('myName').focus();
                    } else if (!isNickName) {
                        document.getElementById('myNickName').focus();
                    } else if (!isEmail) {
                        document.getElementById('myEmail').focus();
                    } else if (!isEmailCheck) {
                        document.getElementById('myEmailChk').focus();
                    }
                }
            });
            // 전문가 
            // 아이디 중복 확인
            document.getElementById('myIdExport').addEventListener('change', function() {

                const checkIdExport = document.getElementById('myIdExport')
                const checkIdExport2 = document.getElementById('myIdExport2')
                const regExpExport1 = /^[a-zA-Z][a-zA-Z0-9]{5,11}$/;
                $.ajax({
                    url: '${contextPath}/checkId.me',
                    data: {
                        id: this.value
                    },
                    success: (data) => {
                        if (data.trim() == 'yes' && regExpExport1.test(this.value)) {
                            checkIdExport.style.backgroundColor = '#24E082';
                            checkIdExport2.style.backgroundColor = '#24E082';
                            isIdExport = true;
                        } else if (data.trim() == 'yes' && !regExpExport1.test(this.value)) {
                            checkIdExport.style.backgroundColor = '#FFCECE';
                            checkIdExport2.style.backgroundColor = '#FFCECE';
                            isIdExport = false;
                        } else if (data.trim() == 'no') {
                            checkIdExport.style.backgroundColor = '#FFCECE';
                            checkIdExport2.style.backgroundColor = '#FFCECE';
                            isIdExport = false;
                        }
                    },
                    error: (data) => {
                        console.log(data);
                    }
                });
            });

            // 비밀번호 정규표현식
            const pwdExport1 = document.getElementById('myPwdExport');
            const pwdExport2 = document.getElementById('myPwdChkExport');
            const myPwdExport2 = document.getElementById('myPwdExport2');
            const myPwdChkExport2 = document.getElementById('myPwdChkExport2');
            const regExpExport2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/

            const checkRegPwdExport = document.getElementById('checkRegPwdExport');
            const checkPwdExport = document.getElementById('checkPwdExport');

            pwdExport1.addEventListener('change', function() {
                if (regExpExport2.test(this.value)) {
                    pwdExport1.style.backgroundColor = '#24E082';
                    myPwdExport2.style.backgroundColor = '#24E082';
                    isPwdExport = true;
                    if (pwdExport1.value != pwdExport2.value && pwdExport1.value != "") {
                        pwdExport2.style.backgroundColor = '#FFCECE';
                        myPwdChkExport2.style.backgroundColor = '#FFCECE';
                    }
                } else {
                    pwdExport1.style.backgroundColor = '#FFCECE';
                    myPwdExport2.style.backgroundColor = '#FFCECE';
                    isPwdExport = false;
                    if (pwdExport1.value != pwdExport2.value && pwdExport1.value != "") {
                        pwdExport2.style.backgroundColor = '#FFCECE';
                        myPwdChkExport2.style.backgroundColor = '#FFCECE';
                    }
                }
            })


            // 비밀번호 일치 확인
            pwdExport2.addEventListener('change', function() {
                if (pwdExport1.value == pwdExport2.value && pwdExport1.value != "") {
                    pwdExport2.style.backgroundColor = '#24E082';
                    myPwdChkExport2.style.backgroundColor = '#24E082';
                    isPwdExport2 = true;

                } else {
                    pwdExport2.style.backgroundColor = '#FFCECE';
                    myPwdChkExport2.style.backgroundColor = '#FFCECE';
                    isPwdExport2 = false;
                }
            });

            //이름
            document.getElementById('myNameExport').addEventListener('change', function() {

                const regExpExport3 = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
                const myNameExport2 = document.getElementById('myNameExport2');

                if (regExpExport3.test(this.value)) {
                    myNameExport.style.backgroundColor = '#24E082';
                    myNameExport2.style.backgroundColor = '#24E082';
                    isName = true;
                } else {
                    myNameExport.style.backgroundColor = '#FFCECE';
                    myNameExport2.style.backgroundColor = '#FFCECE';
                    isNameExport = false;
                }
            });


            // 닉네임 중복 확인
            document.getElementById('myNickNameExport').addEventListener('keyup', function() {
                const checkNickNameExport = document.getElementById('myNickNameExport');
                const checkNickNameExport2 = document.getElementById('myNickNameExport2');
                const regExpExport4 = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]{1,}$/;

                if (this.value.trim() == '') {
                    checkNickNameExport.style.backgroundColor = '#FFCECE';
                    checkNickNameExport2.style.backgroundColor = '#FFCECE';
                } else {
                    $.ajax({
                        url: '${contextPath}/checkNickName.me',
                        data: {
                            nickName: this.value
                        },
                        success: (data) => {
                            console.log(data);
                            if (data.trim() == 'yes' && regExpExport4.test(this.value)) {
                                checkNickNameExport.style.backgroundColor = '#24E082';
                                checkNickNameExport2.style.backgroundColor = '#24E082';
                                isNickName = true;
                            } else if (data.trim() == 'yes' && !regExpExport4.test(this.value)) {
                                checkNickNameExport.style.backgroundColor = '#FFCECE';
                                checkNickNameExport2.style.backgroundColor = '#FFCECE';
                                isNickName = false;
                            } else if (data.trim() == 'no') {
                                checkNickNameExport.style.backgroundColor = '#FFCECE';
                                checkNickNameExport2.style.backgroundColor = '#FFCECE';
                                isNickNameExport = false;
                            }
                        },
                        error: (data) => {
                            console.log(data);
                        }
                    });
                }
            });


            // 이메일 중복확인
            document.getElementById('myEmailExport').addEventListener('keyup', function() {
                const emailExport = document.getElementById('myEmailExport').value;
                const searchEmailExport = document.getElementById('myEmailExport');
                const searchEmailExport2 = document.getElementById('myEmailExport2');
                const checkEmailBtnExport = document.getElementById('mail-Check-Btn-Export');
                const regExpExport5 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i

                $.ajax({
                    type: 'get',
                    url: '${contextPath}/searchEmail.me',
                    data: {
                        memberEmail: emailExport
                    },
                    success: (data) => {
                        console.log(data);
                        if (data.trim() == 'yes' && regExpExport5.test(this.value)) {
                            checkEmailBtnExport.disabled = false;
                            checkEmailBtnExport.style.cursor = 'pointer';
                            checkEmailBtnExport.style.color = 'black';
                            searchEmailExport.style.backgroundColor = '#24E082';
                            searchEmailExport2.style.backgroundColor = '#24E082';
                            isEmailExport = true;
                        } else if (data.trim() == 'yes' && !regExpExport5.test(this.value)) {
                            checkEmailBtnExport.disabled = true;
                            checkEmailBtnExport.style.color = 'lightgray';
                            searchEmailExport.style.backgroundColor = '#FFCECE';
                            searchEmailExport2.style.backgroundColor = '#FFCECE';
                            isEmailExport = false;
                        } else if (data.trim() == 'no') {
                            checkEmailBtnExport.disabled = true;
                            checkEmailBtnExport.style.color = 'lightgray';
                            searchEmailExport.style.backgroundColor = '#FFCECE';
                            searchEmailExport2.style.backgroundColor = '#FFCECE';
                            isEmailExport = false;
                        } else {
                            checkEmailBtnExport.disabled = true;
                            checkEmailBtnExport.style.color = 'lightgray';
                            searchEmailExport.style.backgroundColor = '#FFCECE';
                            searchEmailExport2.style.backgroundColor = '#FFCECE';
                        }
                    },
                    error: (data) => {
                        console.log(data);
                    }

                })
            });

            // 인증번호 보내기
            document.getElementById('mail-Check-Btn-Export').addEventListener('click', function() {
                const emailExport = document.getElementById('myEmailExport').value;
                const checkEmailExport = document.getElementById('myEmailChkExport');
                const checkCodeBtnExport = document.getElementById('checkCodeBtnExport');

                $.ajax({
                    type: 'get',
                    url: '${contextPath}/checkEmail.me',
                    data: {
                        memberEmail: emailExport
                    },
                    success: (data) => {
                        console.log(data);
                        checkEmailExport.disabled = false;
                        code = data;
                        alert('인증번호가 전송되었습니다.');
                        document.getElementById('checkCodeBtnExport').style.color = 'black';
                        document.getElementById('checkEmailExport').style.display = '';
                        document.getElementById('checkCodeBtnExport').style.display = '';
                        checkCodeBtnExport.disabled = false;
                    },
                    error: (data) => {
                        console.log(data);
                    }

                });
            });

            // 인증번호 확인
            document.getElementById('checkCodeBtnExport').addEventListener('click', function() {
                const inputEmailExport = document.getElementById("myEmailChkExport").value;
                const resultEmailExport = document.getElementById("myEmailChkExport");
                const resultEmailExport2 = document.getElementById("myEmailChkExport2");
                const resultEmailExport3 = document.getElementById("checkCodeBtnExport");

                if (inputEmailExport == code) {
                    resultEmailExport.style.backgroundColor = '#24E082';
                    resultEmailExport2.style.backgroundColor = '#24E082';
                    resultEmailExport3.style.backgroundColor = '#24E082';
                    isEmailCheckExport = true;
                } else {
                    resultEmailExport.style.backgroundColor = '#FFCECE';
                    resultEmailExport2.style.backgroundColor = '#24E082';
                    resultEmailExport3.style.backgroundColor = '#24E082';
                    isEmailCheckExport = false;
                }
            });

            // 주소검색
            document.getElementById('searchAddressExport').addEventListener('click', function() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.


                        var roadAddr = data.roadAddress; // 도로명 주소 변수

                        document.getElementById('myAddressExport1').value = data.zonecode;
                        document.getElementById("myAddressExport2").value = roadAddr;

                    }
                }).open();

            });
            //사진첨부



            // 회원가입 버튼 활성화
            document.getElementById('enrollBtnExport').addEventListener('click', function() {
                const enrollBtnExport = document.getElementById('enrollBtnExport');

                if (isIdExport && isPwdExport && isPwdExport2 && isNameExport && isNickNameExport && isEmailExport && isEmailCheckExport) {
                    document.getElementById('insertFormExpert').submit();
                } else {
                    alert('회원가입 폼에 맞춰주세요.');
                    if (!isIdExport) {
                        document.getElementById('myIdExport').focus();
                    } else if (!isPwdExport) {
                        document.getElementById('myPwdExport').focus();
                    } else if (!isPwdExport2) {
                        document.getElementById('myPwdChkExport').focus();
                    } else if (!isNameExport) {
                        document.getElementById('myNameExport').focus();
                    } else if (!isNickNameExport) {
                        document.getElementById('myNickNameExport').focus();
                    } else if (!isEmailExport) {
                        document.getElementById('myEmailExport').focus();
                    } else if (!isEmailCheckExport) {
                        document.getElementById('myEmailChkExport').focus();
                    }
                }
            });
        }
    </script>
</body>

</html>