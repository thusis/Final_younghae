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
    <title>내 정보</title>
    <jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
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
    <!-- dataTables GRID CDN -->
    <!-- css files for DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css" />


    <!-- javascript files for DataTables & Plugins -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
</head>

<body>
    <div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
        <ul>
            <li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
            <li>/</li>
            <li><a href="#">정보수정</a></li>
        </ul>
    </div>
    <div class="container" style="margin-top:30px;">
        <div class="row">
            <div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3 ">
                <div class="panel" style="border: 1px solid rgb(122, 122, 122);">
                    <div class="panel-heading">
                        <a href="#"><img src="resources/img/logo.svg" alt="" style="height: 60px; width: 80px;"></a> <span style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">정보수정</span>
                    </div>
                    <!-- 일반회원 -->
                    <c:if test="${ loginUser.userCNumber eq '1'}">
                        <form action="${ contextPath }/myInfoEdit.me" method="POST" id='insertForm'>
                            <input type="hidden" name="category" value="general">
                            <div class="panel-body p-3">
                                <div class="form-group py-2">
                                    <div>아이디*</div>
                                    <div class="input-field" id="myId2">
                                        <input type="text" id="myId" name="userId" value="${loginUser.userId }" required readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2" style="margin-top: 15px;">
                                    <div>새 비밀번호*(8자이상 하나이상의 문자/숫자/특수문자)</div>
                                    <div class="input-field" id="myPwd2">
                                        <input type="password" id="myPwd" name="myPwd" placeholder="비밀번호를 입력해주세요">
                                    </div>
                                </div>
                                <div class="form-group py-1 pb-2" style="margin-bottom: 15px;">
                                    <div>비밀번호 확인*</div>
                                    <div class="input-field" id="myPwdChk2">
                                        <input type="password" id="myPwdChk" style="width: 450px; border: 0;" placeholder="비밀번호를 입력해주세요">
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이름*</div>
                                    <div class="input-field" id="myName2">
                                        <input type="text" id="myName" name="userName" value="${ loginUser.userName }" readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>닉네임*</div>
                                    <div class="input-field" id="myNickName2" >
                                        <input type="text" id="myNickName" name="userNickname" value="${ loginUser.userNickname }" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이메일*</div>
                                    <div class="input-field" id="myEmail2">
                                        <input type="email" id="myEmail" style="width: 100%; border: 0;" name="email" value="${loginUser.email }" readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>성별*</div>
                                    <c:if test="${ loginUser.gender eq 'M'}">
	                                    <div>
	                                        <input type="radio" name="gender" value="M" required="required" checked>
	                                        <a style="margin-right: 80px;">남</a>
	                                        <input type="radio" name="gender" value="F" required="required">
	                                        <a style="margin-right: 80px;">여</a>
	                                        <input type="radio" name="gender" value="N" required="required">
	                                        <a>알리고싶지않음</a>
	                                    </div>
                                    </c:if>
                                    <c:if test="${ loginUser.gender eq 'F'}">
	                                    <div>
	                                        <input type="radio" name="gender" value="M" required="required">
	                                        <a style="margin-right: 80px;">남</a>
	                                        <input type="radio" name="gender" value="F" required="required" checked>
	                                        <a style="margin-right: 80px;">여</a>
	                                        <input type="radio" name="gender" value="N" required="required">
	                                        <a>알리고싶지않음</a>
	                                    </div>
                                    </c:if>
                                    <c:if test="${ loginUser.gender eq 'N'}">
	                                    <div>
	                                        <input type="radio" name="gender" value="M" required="required">
	                                        <a style="margin-right: 80px;">남</a>
	                                        <input type="radio" name="gender" value="F" required="required">
	                                        <a style="margin-right: 80px;">여</a>
	                                        <input type="radio" name="gender" value="N" required="required" checked>
	                                        <a>알리고싶지않음</a>
	                                    </div>
                                    </c:if>
                                </div>
                                <div class="form-group py-2">
                                    <div>고민부위</div>
                                    <div>
                                        <input type="checkbox" name="userHealth" value="눈">눈 <input type="checkbox" name="userHealth" value="피부">피부 <input type="checkbox" name="userHealth" value="피로">피로 <input type="checkbox" name="userHealth" value="장">장 <input type="checkbox" name="userHealth" value="간">간 <input type="checkbox" name="userHealth" value="관절">관절 <input type="checkbox" name="userHealth" value="임산부">임산부
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>생년월일(주민등록번호 앞자리 6개를 입력해주세요)*</div>
                                    <div class="input-field">
                                        <input type="text" name="birth" value="${loginUser.userBirth }" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>전화번호*</div>
                                    <div class="input-field">
                                        <input type="text" id="myPhone" name="userPhone" value="${loginUser.userPhone }" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>
                                        주소*
                                        <button type="button" id="searchAddress" style="float: right; border: 0; background-color: white;">주소 검색</button>
                                    </div>
                                    <div class="input-field" style="margin-bottom: 5px">
                                        <input type="text" id="myAddress1" name="userZipcode" placeholder="우편번호" value="${ GeneralUser.userZipcode}" required readonly>
                                    </div>
                                    <div class="input-field">
                                        <input type="text" id="myAddress2" name="userAddress" placeholder="주소를 입력해주세요" value="${ GeneralUser.userAddress}" required readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>상세주소</div>
                                    <div class="input-field">
                                        <input type="text" id="myAddress3" name="userAddressDetail" placeholder="상세주소를 입력해주세요" value="${ GeneralUser.userAddressDetail}" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>내 추천인코드</div>
                                    <div class="input-field">
                                        <input type="text" id="otherRecommand" name="userRecommend" value="${ loginUser.userRecommend }" readonly>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" id="editInfoBtn">정보수정</button>
                                <button type="button" class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" id="deleteMemberBtn">회원탈퇴</button>
                            </div>
                        </form>
                    </c:if>
                    <!-- 전문가회원 -->
                    <c:if test="${ loginUser.userCNumber eq '2'}">
                        <form action="${ contextPath }/myInfoEdit.me" method="POST" id='insertForm'>
                            <input type="hidden" name="category" value="export">
                            <div class="panel-body p-3">
                                <div class="form-group py-2">
                                    <div>아이디*</div>
                                    <div class="input-field" id="myId2">
                                        <input type="text" id="myId" name="userId" value="${loginUser.userId }" required readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2" style="margin-top: 15px;">
                                    <div>새 비밀번호*(8자이상 하나이상의 문자/숫자/특수문자)</div>
                                    <div class="input-field" id="myPwd2">
                                        <input type="password" id="myPwd" name="myPwd" placeholder="비밀번호를 입력해주세요">
                                    </div>
                                </div>
                                <div class="form-group py-1 pb-2" style="margin-bottom: 15px;">
                                    <div>비밀번호 확인*</div>
                                    <div class="input-field" id="myPwdChk2">
                                        <input type="password" id="myPwdChk" style="width: 450px; border: 0;" placeholder="비밀번호를 입력해주세요">
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이름*</div>
                                    <div class="input-field" id="myName2">
                                        <input type="text" id="myName" name="userName" value="${ loginUser.userName }" readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>닉네임*</div>
                                    <div class="input-field" id="myNickName2">
                                        <input type="text" id="myNickName" name="userNickname" value="${ loginUser.userNickname }" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>이메일*</div>
                                    <div class="input-field" id="myEmail2">
                                        <input type="email" id="myEmail" style="width: 100%; border: 0;" name="email" value="${loginUser.email }" readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                     <div>성별*</div>
                                    <c:if test="${loginUser.gender eq 'M'}">
	                                    <div>
	                                        <input type="radio" name="gender" value="M" required="required" checked>
	                                        <a style="margin-right: 80px;">남</a>
	                                        <input type="radio" name="gender" value="F" required="required">
	                                        <a style="margin-right: 80px;">여</a>
	                                        <input type="radio" name="gender" value="N" required="required">
	                                        <a>알리고싶지않음</a>
	                                    </div>
                                    </c:if>
                                    <c:if test="${loginUser.gender eq 'F'}">
	                                    <div>
	                                        <input type="radio" name="gender" value="M" required="required">
	                                        <a style="margin-right: 80px;">남</a>
	                                        <input type="radio" name="gender" value="F" required="required" checked>
	                                        <a style="margin-right: 80px;">여</a>
	                                        <input type="radio" name="gender" value="N" required="required">
	                                        <a>알리고싶지않음</a>
	                                    </div>
                                    </c:if>
                                    <c:if test="${loginUser.gender eq 'N'}">
	                                    <div>
	                                        <input type="radio" name="gender" value="M" required="required">
	                                        <a style="margin-right: 80px;">남</a>
	                                        <input type="radio" name="gender" value="F" required="required">
	                                        <a style="margin-right: 80px;">여</a>
	                                        <input type="radio" name="gender" value="N" required="required" checked>
	                                        <a>알리고싶지않음</a>
	                                    </div>
                                    </c:if>
                                </div>
                                <div class="form-group py-2">
                                    <div>생년월일(주민등록번호 앞자리 6개를 입력해주세요)*</div>
                                    <div class="input-field">
                                        <input type="text" name="birth" value="${loginUser.userBirth }" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>전화번호</div>
                                    <div class="input-field">
                                        <input type="text" id="myPhone" name="userPhone" value="${loginUser.userPhone }">
                                    </div>
                                </div>
                                <c:if test="${loginUser.userCNumber eq '1' }">
	                                <div class="form-group py-2">
	                                    <div>
	                                        주소*
	                                        <button type="button" id="searchAddress" style="float: right; border: 0;">주소 검색</button>
	                                    </div>
	                                    <div class="input-field" style="margin-bottom: 5px">
	                                        <input type="text" id="myAddress1" name="userZipcode" placeholder="우편번호" value="${GeneralUser.userZipcode }" required readonly>
	                                    </div>
	                                    <div class="input-field">
	                                        <input type="text" id="myAddress2" name="userAddress" placeholder="주소를 입력해주세요" value="${GeneralUser.userAddress }" required readonly>
	                                    </div>
	                                </div>
	                                <div class="form-group py-2">
	                                    <div>상세주소</div>
	                                    <div class="input-field">
	                                        <input type="text" id="myAddress3" name="userAddressDetail" placeholder="상세주소를 입력해주세요" value="${GeneralUser.userAddressDetail }" required>
	                                    </div>
	                                </div>
                                </c:if>
                               <c:if test="${loginUser.userCNumber eq '2' }">
	                                <div class="form-group py-2">
	                                    <div>
	                                        주소*
	                                        <button type="button" id="searchAddress" style="float: right; border: 0;">주소 검색</button>
	                                    </div>
	                                    <div class="input-field" style="margin-bottom: 5px">
	                                        <input type="text" id="myAddress1" name="userZipcode" placeholder="우편번호" value="${ExpertUser.expertPostAdd }" required readonly>
	                                    </div>
	                                    <div class="input-field">
	                                        <input type="text" id="myAddress2" name="userAddress" placeholder="주소를 입력해주세요" value="${ExpertUser.expertAddress }" required readonly>
	                                    </div>
	                                </div>
	                                <div class="form-group py-2">
	                                    <div>상세주소</div>
	                                    <div class="input-field">
	                                        <input type="text" id="myAddress3" name="userAddressDetail" placeholder="상세주소를 입력해주세요" value="${ExpertUser.expertAddDetail }" required>
	                                    </div>
	                                </div>
                                </c:if>
                                <div class="form-group py-2">
                                    <div>내 추천인코드</div>
                                    <div class="input-field">
                                        <input type="text" id="otherRecommand" name="userRecommend" value="${ loginUser.userRecommend }" readonly>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" id="editInfoBtn">정보수정</button>
                                <button type="button" class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" id="deleteMemberBtn">회원탈퇴</button>
                            </div>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        window.onload = () => {
            // 주소검색
            let isGender, isAddress = false;
            let isNickName = true;
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

            // 닉네임 중복 확인
            document.getElementById('myNickName').addEventListener('keyup', function() {
                const checkNickName = document.getElementById('myNickName');
                const checkNickName2 = document.getElementById('myNickName2');
                const regExp4 = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣0-9#]{1,}$/;

                if (this.value.trim() == '') {
                    checkNickName.style.backgroundColor = '#FFCECE';
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
                                if (this.value == '${ loginUser.userNickname }') {
                                    checkNickName.style.backgroundColor = '#24E082';
                                    checkNickName2.style.backgroundColor = '#24E082';
                                    isNickName = true;
                                } else {
                                    checkNickName.style.backgroundColor = '#FFCECE';
                                    checkNickName2.style.backgroundColor = '#FFCECE';
                                    isNickName = false;
                                }
                            }
                        },
                        error: (data) => {
                            console.log(data);
                        }
                    });
                }
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
            // 회원가입 버튼 활성화
            document.getElementById('editInfoBtn').addEventListener('click', function() {
            	document.getElementById('insertForm').submit();
                var Address = document.getElementById('myAddress1').value;
                var Address1 = document.getElementById('myAddress2').value;
                var Address2 = document.getElementById('myAddress3').value;

                if (Address != "" && Address1 != "" && Address2 != "") {
                    isAddress = true;
                }

                if (!!radios) {
                    isGender = true;
                }
                if (isNickName && isGender && isAddress) {
                    this.type = 'submit';
                    alert('수정 완료되었습니다.');
                } else {
                    alert('수정 폼에 맞춰주세요.');
                    if (!isNickName) {
                        document.getElementById('myNickName').focus();
                    } else if (!isGender) {
                        document.getElementsByName('gender')[0].focus();
                    }
                }

            });
        }
        document.getElementById('deleteMemberBtn').addEventListener('click', ()=>{
			if(confirm('정말로 탈퇴하시겠습니까?')){
				location.href= '${contextPath}/deleteMember.my';
			}
		});
    </script>
</body>

</html>