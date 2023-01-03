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
    <title>나의 찜목록</title>
    <jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
    <style>
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

        .product__item__pic {
            height: 200px;
            position: relative;
            overflow: hidden;
        }
    </style>
</head>

<body>
    <div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
        <ul>
            <li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
            <li>/</li>
            <li><a href="#">내 찜목록 관리</a></li>
        </ul>
    </div>
    <section class="product spad" style="margin-top: -2%;">
        <div class="container">
            <div class="section-title" style="padding: 30px 0 10px 0; margin-bottom: 0px;">
                <h4>내 찜목록 관리</h4>
                <div style="display: block;">
                    <hr style="width: 50vw; background-color: #24E082;">
                </div>
            </div>
            <div class="row">
            	<c:if test="${ myWishList ne '' }">
                <c:forEach items="${myWishList}" var="i">
                    <div class="col-lg-2 col-md-1 col-sm-1">
                        <div class="product__item">
                            <div class="product__item__pic set-bg">
                                <img src="${i.proImage }" style="margin-top: 30px;">
                            </div>
                            <div class="product__item__text" style="text-align: left;">
                                <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;${i.proGrade }</span>
                                <h6 style="display: inline-block;">
                                    <a style="font-size:10pt;">${i.proCompany}</a>
                                </h6>
                                <h5>${i.proName }</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </c:if>
                <c:if test="${ myWishList eq '' }">
                	찜하신것이없습니다.
                </c:if>
            </div>
            <c:if test="${ myWishList.size() !=0 }">
                <div class="col-lg-12 text-center" style="margin-top: 1%;">
            <div class="product__pagination blog__pagination">
               <c:url var="goBack" value="${ loc }">
                  <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
               </c:url>
               <c:if test="${ pi.currentPage > 1 }">
                  <a href="${ goBack }" aria-label="Previous"><i class="fa fa-long-arrow-left"></i></a>
               </c:if>
               <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                  <c:url var="goNum" value="${ loc }">
                     <c:param name="page" value="${p}"></c:param>
                  </c:url>
                  <a href="${ goNum }">${ p }</a>
               </c:forEach>
               <c:url var="goNext" value="${ loc }">
                  <c:param name="page" value="${ pi.currentPage+1 }"></c:param>
               </c:url>
               <c:if test="${ pi.currentPage <= 1 }">
               <a href="${ goNext }"><i class="fa fa-long-arrow-right"></i></a>
               </c:if>
            </div>
         </div>
         </c:if>
         </div>
    </section>
</body>

</html>