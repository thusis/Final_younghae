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
    <title>나의 프로필</title>
    <jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>

    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
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
</head>

<body>
    <div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
        <ul>
            <li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
            <li>/</li>
            <li><a href="#">내 프로필 설정</a></li>
        </ul>
    </div>
    <div class="container">
        <!-- <div class="row"> -->
        <div class="col-lg-12 d-flex justify-content-center">
            <div class="panel col-lg-6 " style="border: 1px solid rgb(122, 122, 122);">
                <div class="panel-heading">
                    <a href="#"><img src="resources/img/logo.svg" alt="" style="height: 60px; width: 80px;"></a> <span style="font-size: 20px; margin-left: 5px; vertical-align: middle; font-weight: bold;">나의 프로필 설정 </span>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs-1" role="tabpanel">
                        <form action="${ contextPath }/updateProfile.my" method="POST" id="updateProfile" enctype="multipart/form-data">
                            <div class="panel-body p-3">
                                <div style="text-align: center;">
                                	<div class="info-container d-flex flex-column align-items-center justify-content-center" id="previewImageBox"></div>
                                </div>
                                <div id="fileArea" class="form-group py-2" style="text-align: center;">
                                    <label className="input-file-button" for="addFile" class="form-label">프로필사진</label>
                                    <input class="form-control myFiles" style="display: none;" type="file"  name="file" id="addFile" accept="image/*">
                                </div>
                                <div class="form-group py-2">
                                    <div>이름*</div>
                                    <div class="input-field">
                                        <input type="text" value="${loginUser.userName }" readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2" style="margin-bottom: 4rem;">
                                    <div>
                                        <a style="margin-right: 220px;">업종*</a>
                                    </div>
                                    <c:if test="${ExpertUser.expertSort eq 'D' }">
                                    <div class="input-field col-lg-4" style="float: left; margin-right: 100px; border: none;">
                                        <input name="expertSort"  type="radio" value="D" required="required" checked><a style="color: black;margin-right:10px;">의사</a>
                                        <input name="expertSort"  type="radio" value="C" required="required"><a style="color: black">약사</a>
                                    </div>
                                    </c:if>
                                    <c:if test="${ExpertUser.expertSort eq 'C' }">
                                    <div class="input-field col-lg-4" style="float: left; margin-right: 100px; border: none;">
                                        <input name="expertSort"  type="radio" value="D" required="required"><a style="color: black;margin-right:10px;">의사</a>
                                        <input name="expertSort"  type="radio" value="C" required="required" checked><a style="color: black">약사</a>
                                    </div>
                                    </c:if>
                                    <c:if test="${ExpertUser.expertSort eq 'N' }">
                                    <div class="input-field col-lg-4" style="float: left; margin-right: 100px; border: none;">
                                        <input name="expertSort"  type="radio" value="D" required="required"><a style="color: black;margin-right:10px;">의사</a>
                                        <input name="expertSort"  type="radio" value="C" required="required"><a style="color: black">약사</a>
                                    </div>
                                    </c:if>
                                </div>
                                <div class="form-group py-2" style="margin-bottom: 4rem;">
                                    <div>
                                        <a style="margin-right: 190px;">전문과목*</a> <a>병/약국이름*</a>
                                    </div>
                                    <div class="input-field col-lg-4" style="float: left; margin-right: 100px;">
                                        <input name="expertMedi" id="expertMedi" type="text" placeholder="전문과목" value="${ExpertUser.expertMedi }" required>
                                    </div>
                                    <div class="input-field col-lg-4" style="float: left;">
                                        <input name="expertDept" id="expertDept" type="text" placeholder="병/약국이름" value="${ExpertUser.expertDept }" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div style="display: inline;">
                                        <a>병원/약국홈페이지</a>
                                    </div>
                                    <div class="input-field">
                                        <input name="expertHomepage" id="expertHomepage" type="url" style="width: 100%; border: 0;" placeholder="url을 입력해주세요." value="${ExpertUser.expertHomepage }" required>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>소개</div>
                                    <div class="input-field">
                                        <textarea name="expertProfile" id="expertProfile" style="resize: none; height: 200px; width: 100%; border: 0;" wrap="hard">${ExpertUser.expertProfile }</textarea>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>약력*(줄바꿈전/입력해주세요)</div>
                                    <div class="input-field">
                                        <textarea name="expertCareer" id="expertCareer" style="resize: none; height: 200px; width: 100%; border: 0;" wrap="hard" required>${ExpertUser.expertCareer }</textarea>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>
                                        주소*
                                        <button type="button" id="searchAddress" style="float: right; border: 0;">주소 검색</button>
                                    </div>
                                    <div class="input-field" style="margin-bottom: 5px">
                                        <input type="text" id="myAddress1" name="expertPostAdd" value="${ExpertUser.expertPostAdd }" required readonly>
                                    </div>
                                    <div class="input-field">
                                        <input type="text" id="myAddress2" name="expertAddress" value="${ExpertUser.expertAddress }" required readonly>
                                    </div>
                                </div>
                                <div class="form-group py-2">
                                    <div>상세주소*</div>
                                    <div class="input-field">
                                        <input type="text" id="myAddress3" name="expertAddDetail" value="${ExpertUser.expertAddDetail}"placeholder="상세주소를 입력해주세요" required>
                                    </div>
                                </div>
                                <div style="text-align: center;">
                                    <div id="map" style="width:100%;height:350px;"></div>
                                </div>
                                <input type="submit" id="editExpertBtn"class="btn btn-primary btn-block mt-3 " style="background-color: rgb(0, 179, 0); border-color: rgb(0, 179, 0);" value="프로필등록 및 수정">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2bbaed60944059872ec626adf3b7011&libraries=services"></script>
    <script>
        window.onload = () => {
        	const fileArea = document.querySelector('#fileArea');
        	document.getElementById('addFile').addEventListener('click', ()=> {
        	   const imgDiv = document.getElementById('previewImageBox');
        	   imgDiv.innerHTML += '<img class="img-fluid rounded-4" id="previewImage">';

        	   $('#addFile').on('change', e=> {
        	       readImage(e.target);
        	        });
        	});

        	function readImage(input) {
        	    // 인풋 태그에 파일이 있는 경우
        	    if(input.files && input.files[0]) {

        	        const reader = new FileReader()
        	        // 이미지가 로드가 된 경우
        	        reader.onload = e => {
        	            const previewImage = document.getElementById("previewImage")
        	            previewImage.src = e.target.result
        	        }
        	        // reader가 이미지 읽도록 하기
        	        reader.readAsDataURL(input.files[0])
        	    }
        	}
        	
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
                document.getElementById('myAddress2').focus();
            });
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  
			//지도 데이터
            var str = document.getElementById('myAddress2').value;
	        // 지도를 생성합니다    
	        var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	        // 주소-좌표 변환 객체를 생성합니다
	        var geocoder = new kakao.maps.services.Geocoder();
	
	        // 주소로 좌표를 검색합니다
	        geocoder.addressSearch(str, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });
	        
	    document.getElementById('editExpertBtn').addEventListener('click', function() {
                document.getElementById('editExpertBtn').submit();
          }); 
        }
        document.getElementById('myAddress2').addEventListener('focus', function() {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };
			
        	 // 주소검색할것
            var str = document.getElementById("myAddress2").value;
            
            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption);
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(str, function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {
                    // 클릭한 위도, 경도 정보를 가져옵니다 
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);

                    //coords.getLat()위도 , coords.getLng()경도
                    var getLat = coords.getLat();
                    var getLng = coords.getLng();
                }
            });
        });
    </script>
</body>
</html>