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

						<!-- 일반 회원가입시작 -->
						<form action="${ contextPath }/insertMember.me" method="POST">
							<div class="panel-body p-3">
								<div class="form-group py-2">
									<div>
										<label for="myId">아이디*</label>
									</div>
									<div class="input-field" id="myId2">
										<input type="text" id="myId" placeholder="아이디를 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-1 pb-2">
									<div>비밀번호*</div>
									<div class="input-field" id="myPwd2">
										<input type="password" id="myPwd" placeholder="비밀번호을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>비밀번호확인*</div>
									<div class="input-field" id="myPwdChk2">
										<input type="password" id="myPwdChk"
											placeholder="비밀번호를 확인해주세요" required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>이름*</div>
									<div class="input-field" id="myName2">
										<input type="text" id="myName" placeholder="이름을 입력해주세요"
											required>
									</div>
								</div>
								<div class="form-group py-2">
									<div>닉네임*</div>
									<div class="input-field" id="myNickName2">
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
										<button type="button" id="mail-Check-Btn"
											style="float: right; border: 0;">인증번호전송</button>
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
										<input type="radio" name="chk_Gender" value="M"><a
											style="margin-right: 80px;">남</a> <input type="radio"
											name="chk_Gender" value="F"><a
											style="margin-right: 80px;">여</a> <input type="radio"
											name="chk_Gender" value="N"><a>알리고싶지않음</a>
									</div>
								</div>
								<div class="form-group py-2">
									<div>생년월일*</div>
									<div class="input-field">
										<input type="text" id="myBirth"
											placeholder="생년월일 6자를 입력해주세요. ">
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



					<!-- 전문가 회원가입시작 -->
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<form action="${ contextPath }/insertMemberExpert.me"
								method="POST">
								<div class="panel-body p-3">
									<div class="form-group py-2">
										<div>아이디*</div>
										<div class="input-field" id="myIdExpert2">
											<input type="text" id="myIdExpert" placeholder="아이디를 입력해주세요"
												required>
										</div>
									</div>
									<div class="form-group py-1 pb-2">
										<div>비밀번호*</div>
										<div class="input-field">
											<input type="password" id="myPwdExpert"
												placeholder="비밀번호을 입력해주세요" required>
										</div>
									</div>
									<div class="form-group py-2">
										<div>비밀번호확인*</div>
										<div class="input-field">
											<input type="password" id="myPwdChkExpert"
												placeholder="비밀번호를 확인해주세요" required>
										</div>
									</div>
									<div class="form-group py-2">
										<div>이름*</div>
										<div class="input-field">
											<input type="text" id="myNameExpert" placeholder="이름을 입력해주세요"
												required>
										</div>
									</div>
									<div class="form-group py-2">
										<div>닉네임*</div>
										<div class="input-field">
											<input type="text" id="myNickNameExpert"
												placeholder="닉네임을 입력해주세요" required>
										</div>
									</div>
									<div class="form-group py-2">
										<div>이메일*</div>
										<div class="input-field">
											<input type="email" id="myEmailExpert"
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
											<input type="text" id="myEmailChkExpert"
												placeholder="인증번호를 입력해주세요" required>
											<button type="button" style="border: 0; width: 50px;">확인</button>
										</div>
									</div>
									<div class="form-group py-2">
										<div>성별*</div>
										<div>
											<input type="radio" name="chkGenderExpert" value="M"><a
												style="margin-right: 80px;">남</a> <input type="radio"
												name="chkGenderExpert" value="F"><a
												style="margin-right: 80px;">여</a> <input type="radio"
												name="chkGenderExpert" value="N"><a>알리고싶지않음</a>
										</div>
									</div>
									<div class="form-group py-2">
										<div>전화번호</div>
										<div class="input-field">
											<input type="text" id="myPhoneExpert"
												placeholder="전화번호를 입력해주세요">
										</div>
									</div>
									<div class="form-group py-2">
										<div>생년월일*</div>
										<div class="input-field">
											<input type="text" id="myBirthExpert"
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
											<input type="text" id="myAddressExpert1"
												placeholder="주소를 입력해주세요" required>
										</div>
									</div>
									<div class="form-group py-2">
										<div>상세주소*</div>
										<div class="input-field">
											<input type="text" id="myAddressExpert2"
												placeholder="상세주소를 입력해주세요" required>
										</div>
									</div>
									<div class="form-group py-2">
										<div>추천인코드</div>
										<div class="input-field">
											<input type="text" id="otherRecommandExpert"
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
	 window.onload =()=>{
		 
		 
		 let isId, isPwd, isPwd2, isName, isNickName, isEmail, isEmailCheck = false;
		// 아이디 중복 확인
         document.getElementById('myId').addEventListener('change',function(){
            
            const checkId = document.getElementById('myId')
            const checkId2 = document.getElementById('myId2')
            const regExp1 = /^[a-zA-Z][a-zA-Z0-9]{5,11}$/;
               $.ajax({
                  url: '${contextPath}/checkId.me',
                  data: {id:this.value},
                  success: (data)=>{
                     if(data.trim() == 'yes' && regExp1.test(this.value)){
                    	 checkId.style.backgroundColor = '#24E082';
                    	 checkId2.style.backgroundColor = '#24E082';
                        isId = true;
                     } else if(data.trim() == 'yes' && !regExp1.test(this.value)) {
                    	 checkId.style.backgroundColor = '#FFCECE';
                    	 checkId2.style.backgroundColor = '#FFCECE';
                        isId = false;
                     } else if(data.trim() == 'no'){
                    	 checkId.style.backgroundColor = '#FFCECE';
                    	 checkId2.style.backgroundColor = '#FFCECE';
                        isId = false;
                      }
                  },
                  error: (data)=>{
                     console.log(data);
                  }
               });
            });
			
      // 비밀번호 정규표현식
         const pwd1 = document.getElementById('myPwd');
         const pwd2 = document.getElementById('myPwdChk');
         const myPwd2 = document.getElementById('myPwd2');
         const myPwdChk2 = document.getElementById('myPwdChk2');
         const regExp2 = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,11}$/
//          const regExp3 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{5,11}$/
         
         const checkRegPwd = document.getElementById('checkRegPwd');
         const checkPwd = document.getElementById('checkPwd');
         
         pwd1.addEventListener('change',function(){
            if(regExp2.test(this.value)){
               pwd1.style.backgroundColor = '#24E082';
               myPwd2.style.backgroundColor = '#24E082';
               isPwd = true;
               if(pwd1.value != pwd2.value && pwd1.value!=""){
            	   pwd2.style.backgroundColor = '#FFCECE';
            	   myPwdChk2.style.backgroundColor = '#FFCECE';
               }
            } else {
            	pwd1.style.backgroundColor = '#FFCECE';
            	myPwd2.style.backgroundColor = '#FFCECE';
               isPwd = false;
               if(pwd1.value != pwd2.value && pwd1.value!=""){
            	   pwd2.style.backgroundColor = '#FFCECE';
            	   myPwdChk2.style.backgroundColor = '#FFCECE';
               }
            }
         })
         
         
         // 비밀번호 일치 확인
         pwd2.addEventListener('change', function(){
            if(pwd1.value == pwd2.value && pwd1.value!=""){
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
          document.getElementById('myName').addEventListener('change',function(){
            
            const regExp3 =/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
            const myName2 = document.getElementById('myName2'); 
            
               if(regExp3.test(this.value)){
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
         document.getElementById('myNickName').addEventListener('change',function(){
            const checkNickName = document.getElementById('myNickName');
            const checkNickName2 = document.getElementById('myNickName2');
            const regExp4 = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]{1,}$/;
            
            if(this.value.trim() == ''){
               checkNickName.style.backgroundColor = '#FFCECE';
               checkNickName.style.backgroundColor = '#FFCECE';
            }else{
               $.ajax({
                  url: '${contextPath}/checkNickName.me',
                  data: {nickName: this.value},
                  success:(data)=>{
                     console.log(data);
                     if(data.trim() == 'yes' && regExp4.test(this.value)){
                        checkNickName.style.backgroundColor = '#24E082';
                        checkNickName2.style.backgroundColor = '#24E082';
                        isNickName = true;
                     } else if(data.trim() == 'yes' && !regExp4.test(this.value)){
                        checkNickName.style.backgroundColor = '#FFCECE';
                        checkNickName2.style.backgroundColor = '#FFCECE';
                        isNickName = false;
                     } else if(data.trim() == 'no'){
                        checkNickName.style.backgroundColor = '#FFCECE';
                        checkNickName2.style.backgroundColor = '#FFCECE';
                        isNickName = false;
                      }
                  },
                  error:(data)=>{
                     console.log(data);
                  }
               });
            }
         });
         
         
         // 이메일 중복확인
         document.getElementById('memberEmail').addEventListener('change',function(){
            const email = document.getElementById('memberEmail').value;
            console.log(email);
            const searchEmail = document.getElementById('searchEmail');
            const checkEmailBtn = document.getElementById('checkEmailBtn');
            const regExp5 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
            
            $.ajax({
               type: 'get',
               url: '${contextPath}/searchEmail.me',
               data: {memberEmail:email},
               success:(data)=>{
                  console.log(data);
                  if(data.trim() == 'yes' && regExp5.test(this.value)){
                     checkEmailBtn.disabled = false;
                     checkEmailBtn.style.cursor = 'pointer';
                     checkEmailBtn.style.color = 'black';
                     searchEmail.innerText = '사용 가능한 이메일입니다.';
                     searchEmail.style.color = 'green';
                     isEmail = true;
                  } else if(data.trim() == 'yes' && !regExp5.test(this.value)){
                     checkEmailBtn.disabled = true;
                     checkEmailBtn.style.color = 'lightgray';
                     searchEmail.innerText = '알맞은 이메일을 입력하세요.'
                     searchEmail.style.color = 'red';
                     isEmail = false;
                  } else if(data.trim() == 'no'){
                     checkEmailBtn.disabled = true;
                     checkEmailBtn.style.color = 'lightgray';
                     searchEmail.innerText = '이미 가입된 이메일입니다.'
                     searchEmail.style.color = 'red';
                     isEmail = false;
                  } else {
                    searchEmail.innerText = '이미 가입된 이메일입니다.'
                  }
               },
               error:(data)=>{
                  console.log(data);
               }
               
            })
         });
          
          // 인증번호 보내기
          document.getElementById('checkEmail').style.display='none';
          document.getElementById('checkCodeBtn').style.display='none';
          document.getElementById('checkEmailBtn').addEventListener('click',function(){
            const email = document.getElementById('memberEmail').value;
            console.log(email);
            const checkEmail = document.getElementById('checkEmail');
            
            $.ajax({
               type: 'get',
               url: '${contextPath}/checkEmail.me',
               data: {memberEmail:email},
               success:(data)=>{
                  console.log(data);
                  checkEmail.disabled = false;
                  code = data;
                  alert('인증번호가 전송되었습니다.');
                  document.getElementById('checkCodeBtn').style.color = 'black';
                  document.getElementById('checkEmail').style.display='';
                   document.getElementById('checkCodeBtn').style.display='';
               },
               error:(data)=>{
                  console.log(data);
               }
               
            })
         });
         
          // 인증번호 확인
         document.getElementById('checkCodeBtn').addEventListener('click',function(){
            const inputEmail = document.getElementById('checkEmail').value;
            const resultEmail = document.getElementById('resultEmail');
            
            if(inputEmail == code){
               resultEmail.innerText = '인증번호가 일치합니다.';
               resultEmail.style.color = 'green';
               isEmailCheck = true;
            } else{
               resultEmail.innerText  = '인증번호가 불일치합니다.';
               resultEmail.style.color = 'red';
               isEmailCheck = false;
            }
         });
		
         }
	</script>
</body>
</html>
