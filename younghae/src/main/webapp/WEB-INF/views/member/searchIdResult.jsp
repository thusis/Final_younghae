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
    <title>아이디찾기결과</title>
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
                        <a href="#"><img src="resources/img/logo.svg" alt="" style="height: 60px; width: 80px;"></a> <span style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">아이디
                            찾기 결과</span>
                        <div style="font-size: 5px;">로그인을 통해 영해의 다양한 서비스를 사용해 보세요.</div>
                    </div>
                    <div class="panel-body p-3">
                        <div class="form-group py-2">
                            <div style="margin-top: 50px;"></div>
                            <div>
                                <c:if test="${ !empty mem }">
                                    <div style="text-align: center;">해당 이름으로 가입된 아이디는
                                        ${ mem.userId }입니다.</div>
                                </c:if>
                                <c:if test="${ empty mem }">
                                    일치하는 정보가 없거나, 이메일 혹은 아이디를 잘못 입력하셨습니다.
                                </c:if>
                            </div>
                            <div style="margin-top: 50px;"></div>
                        </div>
                        <c:if test="${ !empty mem }">
                            <input class="btn btn-primary btn-block mt-3 " type="button" onclick="location.href='${contextPath}/login.me'" style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" value="로그인">
                        </c:if>
                        <c:if test="${ empty mem }">
                            <input class="btn btn-primary btn-block mt-3 " type="button" onclick="location.href='${contextPath}/searchIdView.me'" style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" value="아이디찾기">
                        </c:if>
                        <input class="btn btn-primary btn-block mt-3 " type="submit" onclick="location.href='${contextPath}/searchPwdView.me'" style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" value="비밀번호찾기">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>