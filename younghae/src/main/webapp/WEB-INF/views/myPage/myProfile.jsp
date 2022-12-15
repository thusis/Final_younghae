<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

        @media(max-width: 360px) {
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

        .input-file-button {
            padding: 6px 25px;
            background-color: #FF6600;
            border-radius: 4px;
            color: white;
            cursor: pointer;
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
        <script src="${contextPath }/js/jquery-3.3.1.min.js"></script>
</head>

<body>
  	<nav>
		<jsp:include page="../common/topmenubar.jsp" flush="true" />
	</nav>
    <div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
        <ul>
            <li><a href="#">마이페이지</a></li>
            <li> / </li>
            <li><a href="#">내 프로필 설정</a></li>
        </ul>
    </div>
    <div class="container" >
        <!-- <div class="row"> -->
        <div class="col-lg-12 d-flex justify-content-center">
            <div class="panel col-lg-6 " style="border: 1px solid rgb(122, 122, 122);" >
                <div class="panel-heading">
                    <a href="#"><img src="img/logo.svg" alt="" style="height: 60px; width: 80px; "></a>
                    <span style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">나의 프로필
                        설정
                    </span>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs-1" role="tabpanel">
                        <form action="login_script.php" method="POST">
                            <div class="panel-body p-3">
                                <div style="text-align: center;">
                                    <img src="img/logo.svg" alt="" style="height: 120px; width: 120px; ">
                                </div>
                                <div class="form-group py-2" style="text-align: center;">
                                    <label className="input-file-button" for="input-file">사진첨부</label>
                                    <input type="file" id="input-file" style="display: none;">
                                </div>
                                <div class="form-group py-2">
                                    <div>이름*</div>
                                    <div class="input-field">
                                        <input type="text" value="login.name" readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2" style="margin-bottom: 4rem;">
                                    <div>
                                        <a style="margin-right: 190px;">전문과목*</a>
                                        <a>경력*</a> 
                                    </div>
                                    <div class="input-field col-lg-4" style="float: left; margin-right: 100px;">
                                        <input type="text" placeholder="과목을 입력해주세요" required>
                                    </div>
                                    <div class="input-field col-lg-4" style="float: left;">
                                        <input type="text" placeholder="경력을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div style="display: inline;">
                                        <a>병원/약국홈페이지</a>
                                    </div>
                                    <div class="input-field">
                                        <input type="text" style="width: 100%; border:0;" placeholder="url을 입력해주세요.">
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div> 소개 </div>
                                    <div class="input-field">
                                        <textarea style="resize:none; height: 200px; width: 100%; border: 0;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>주소* <button type="button" style="float: right; border: 0;">주소 검색</button>
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
                                <div style="text-align: center;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                                    </svg>
                                </div>
                                <button class="btn btn-primary btn-block mt-3 "
                                    style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);">프로필 등록 및 수정
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>