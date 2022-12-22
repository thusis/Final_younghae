<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 검색결과</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	
</head>
<body>

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> / </li>
                <li><a href="#">둘러보기</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">상세게시글</a></li>
            </ul>
        </div>

        <div class="section-title" style="padding: 30px 0 10px 0;">
            <h2>족저근막염 으로 검색한 결과입니다</h2>
            <hr style="width:50vw; border:2px solid #24E082; background-color: #24E082;">
        </div>

        <div class="bn_boardlist mt-2">
            <table class="table">
                <thead>
                  <tr class="text-teal-100">
                    <div class="col-lg-3">
                        <th scope="col">해결되었어요</th>
                        <th scope="col">글번호</th>
                    </div>
                    <th scope="col" class="col-lg-4">제목</th>
                    <th scope="col" class="col-lg-1">글쓴이</th>
                    <th scope="col" class="col-lg-1">답변수</th>
                    <th scope="col" class="col-lg-1">조회수</th>
                    <th scope="col" class="col-lg-2">날짜</th>
                  </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>1</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Otto</td>
                        <td>@mdo</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square"></i></th>
                        <td>2</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Thornton</td>
                        <td>@fat</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>3</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry the Bird</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>4</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry the Bird</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>5</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry the Bird</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>6</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"">왜 border-bottom 생겨서 날 괴롭게 해?</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                </tbody>
            </table>
        </div>
            <div class="product__pagination blog__pagination d-flex justify-content-center mt-3 ">
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>

            <div class="row d-flex justify-content-center">
                <div class="input-group mt-3 col-lg-6">
                    <select class="form-select form-select-sm bn_detail-search">
                        <option selected>카테고리 선택</option>
                        <option value="제목내용">제목+내용</option>
                        <option value="제목">제목</option>
                        <option value="내용">내용</option>
                        <option value="글쓴이">글쓴이</option>
                    </select>
                    <input type="text" class="form-control" id="bn_detail-search-point" placeholder="내용을 입력하세요">
                    <button class="btn bn_btn_search2" >검색</button>
                </div>
            </div>
    </div>
</body>
</html>
