<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 전문가 찾기 </title>

    <!--내가만든 css-->
    <link rel="stylesheet" href="css/bn_style.css" type="text/css">
	
</head>
<body>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> <b>/</b> </li>
                <li><a href="#">질문하기</a></li>
            </ul>
        </div>

        <div class="section-title" style="padding: 30px 0 10px 0;">
            <h2>질문하기</h2>
            <hr style="width:50vw; border:2px solid #24E082; background-color: #24E082;">
        </div>

        <form action="${contextPath}/writeQuestion.qa" method="post" enctype="multipart/form-data" >
        
            <div class="mb-5">
                <label for="title" class="form-label bn_txt_strong">제목</label>
                <input type="text" class="form-control m-3" id="title" placeholder="제목을 입력하세요">
            </div>

            <div class="mb-3">
                <label for="content" class="form-label bn_txt_strong">내용</label>
                <div class="row m-3">
                    <button type="button" class="site-btn" id="selectPillBtn"><i class="bi bi-capsule"></i></button>
                    <input type="text" class="inline" id="selectPill" placeholder="영양제 선택" style="border:0px; background-color: transparent;" disabled>
                </div>

                <div class="filebox row m-3">
                    <button type="button" class="site-btn" id="addFile"><i class="bi bi-paperclip"></i></button>
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                    <label for="file">파일찾기</label> 
                    <input type="file" id="file">
                </div>


                <textarea class="form-control" id="content" rows="20"></textarea>
            </div>
        </form>
    
        <div class="row float-right">
            <button class="btn bn_btn_search2" style="background-color: white; color:black; border: 1px solid #24E082;" >취소</button>
            <button class="btn bn_btn_search2">등록</button>
        </div>

    </div>

<br>
<br>
<br>

<div class="modal fade" tabindex="-1" role="dialog" id="modalPillChoice" style="background-color: white;">
    <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-body p-4 text-center">
                <!--영양제 목록 보여줄건데 이건 include 해야 할 것 같다!-->
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Crab Pool Security</a></h6>
                                <h5>$30.00</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Crab Pool Security</a></h6>
                                <h5>$30.00</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Crab Pool Security</a></h6>
                                <h5>$30.00</h5>
                            </div>
                        </div>
                    </div>






            </div>
            <div class="modal-footer flex-nowrap p-0">
                <button type="button" class="btn btn-secondary">선택</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
  
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script>
    window.onload=()=>{
        $("#file").on('change',function(){
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });
    }
    
    $("#selectPillBtn").click(function(){
        $('#modalPillChoice').modal();
    });

</script>
</body>
</html>