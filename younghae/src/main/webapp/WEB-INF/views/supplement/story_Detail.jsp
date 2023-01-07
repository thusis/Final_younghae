<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>컬럼 디테일</title>

    <style>
        /*목차*/
        .bn_index ul li{
            list-style: none;
            position: relative;
            display: inline-block;
        }
        
        .bn_index a {
            color: black;
            
        }
        
        .bn_index li:last-child a{
            font-weight: 800;
            color : #FD9F28;
        }
    </style>
</head>

<body>

   	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li><a href="${ contextPath }/storyList.st?page=${ page }">건강해지는 이야기</a></li>
                <li> <b>/</b> </li>
                <li>건강해지는 이야기 상세보기</li>
            </ul>
        </div>
    </div>

    <section class="featured spad" style="margin-left: 20%; margin-right: 20%;">
        <div class="row align-items-center">
            <div class="text-left" >
                <label style="font-size: 180%;  font-weight: 800;  padding-bottom: 10%; color: #24E082;">건강해지는 이야기</label>
            </div>
            <div class="col-lg-12 col-md-12" style="border: 2px solid #24E082; padding: 3%; border-radius: 2em;">
                <div class="text-center" id="column">
                	<h3>${ board.boardTitle }</h3>
                	<br><br>
                    	${ board.boardContent }
                    <br><br>
                </div>
                <div class="text-center" id="Btn" style="margin-top: 2%;">
                    <button type="button"
                    style="height: 50px; width: 20%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;"
                    onclick="toGoList()">목록</button>
                </div>
            </div>
        </div>
    </section>


    <!-- Footer Section Begin -->
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Footer Section End -->
    <script>
		const toGoList = () =>{
			location.href="${ contextPath }/storyList.st?page="+${ page };
		}
    </script>
</body>

</html>

<!-- https://doriri.tistory.com/45 -->