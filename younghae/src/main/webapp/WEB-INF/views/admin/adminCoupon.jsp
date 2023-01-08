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
    <title>마이 페이지</title>
    <jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
    <!-- dataTables GRID CDN -->
    <!-- css files for DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css" />


    <!-- javascript files for DataTables & Plugins -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
</head>

<body>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-2" style="margin-left:-100px; margin-top:50px;">
                    <div class="hero__categories">
                        <ul>
                            <li><a href="#">상품관리</a></li>
                            <li><a href="#">주문관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/adminMember.ad'">회원관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/adminCoupon.ad'">쿠폰관리</a></li>
                            <li><a href="#">게시판관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/adminPoint.ad'">포인트관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/AdminReview.su'">리뷰관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/AdminStoryList.st'">이야기 관리</a></li>
                            <li><a href="#" onclick="location.href='${contextPath}/AdminwriteStory.st'">이야기 작성</a></li>
                            <li><a href="#">신고관리</a></li>
                            <li><a href="#">통계분석</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-10">
     				 <div class="container">
        <div class="section-title" style="padding: 30px 0 10px 0; margin-bottom: 0px;">
            <h4>쿠폰 관리</h4>
            <div style="display: block;">
                <hr style="width: 50vw; background-color: #24E082;">
            </div>
        </div>
        <div class="col-lg-12">
            <div class="product__details__tab" style="padding-top: 0px;">
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs" role="tabpanel">
                    	<button type="button" style="border: 0; float:right;" data-toggle="modal" data-target="#exampleModal" onclick="couponRegist()">쿠폰등록하기</button>
                    	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <form>
						          <div class="form-group">
						            <label for="recipient-name" class="col-form-label">Recipient:</label>
						            <input type="text" class="form-control" id="recipient-name">
						          </div>
						          <div class="form-group">
						            <label for="message-text" class="col-form-label">Message:</label>
						            <textarea class="form-control" id="message-text"></textarea>
						          </div>
						        </form>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Send message</button>
						      </div>
						    </div>
						  </div>
						</div>
                        <div class="product__details__tab__desc" style="padding-top: 0px;">
                            <div class="bn_boardlist mt-2">
                                <table class="table" id="dataTable">
                                    <thead>
                                        <tr class="text-teal-100">
                                            <th scope="col" class="col-lg-1">쿠폰번호</th>
                                            <th scope="col" class="col-lg-2">쿠폰내용</th>
                                            <th scope="col" class="col-lg-1">할인액</th>
                                            <th scope="col" class="col-lg-2">발급날짜</th>
                                            <th scope="col" class="col-lg-2">만료날짜</th>
                                            <th scope="col" class="col-lg-2">취소</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                        <c:forEach var="i" items="${ couponList }">
                                                <tr>
                                                    <td>${ i.couRegister }</td>
                                                    <td>${ i.couIntro }</td>
                                                    <td>${ i.couDiscount }</td>
                                                    <td>${ i.couPublishDate }</td>
                                                    <td>${ i.couEndDate }</td>
                                                    <c:if test="${ i.couUsed eq 'A'}">
                                                    <td><button class="checkBtn">쿠폰취소</button></td>
                                                    </c:if>
                                                    <c:if test="${ i.couUsed eq 'N'}">
                                                    <td><button class="checkBtn2">쿠폰활성</button></td>
                                                    </c:if>                                               
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script>
		
        var lang_kor = {
            decimal: "",
            emptyTable: "데이터가 없습니다.",
            info: "_START_ - _END_ (총 _TOTAL_ 명)",
            infoEmpty: "0명",
            infoFiltered: "(전체 _MAX_ 명 중 검색결과)",
            infoPostFix: "",
            thousands: ",",
            lengthMenu: "_MENU_ 개씩 보기",
            loadingRecords: "로딩중...",
            processing: "처리중...",
            search: "검색 : ",
            zeroRecords: "검색된 데이터가 없습니다.",
            paginate: {
                first: "첫 페이지",
                last: "마지막 페이지",
                next: "다음",
                previous: "이전"
            },
            aria: {
                sortAscending: " :  오름차순 정렬",
                sortDescending: " :  내림차순 정렬"
            }
        };
        
        


        $(document).ready(function() {
            $('#dataTable').DataTable({
                searching: false,
                ordering: true,
                pageLength: 10,
                paging: true, //페이징처리
                language: lang_kor, //or lang_eng
                info: false
            });
        });

     // 버튼 클릭시 Row 값 가져오기
        $(".checkBtn").click(function(){
            var delConfirm = confirm('쿠폰등록을 취소하겠습니까?');
            var table = $('#dataTable').DataTable();
            var no = null;	
        		var str = ""
        		var tdArr = new Array();	// 배열 선언
        		var checkBtn = $(this);
        		
        		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
        		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        		var tr = checkBtn.parent().parent();
        		var td = tr.children();
        		
        		no = td.eq(0).text();
        		
        		alert(no);
        		
        		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.

            if (delConfirm) {
            	$.ajax({
			    	   url: '${contextPath}/couponCancer.ad',
			    	   data: {
			    		   delConfirm: delConfirm,
			    		   couRegister: no
			            },
			    	   success:(data) => {
			               alert('등록이 취소되었습니다.');
			               (location || window.location || document.location).reload();
			    	   }
			   });
            }
            else {
               alert('등록이 취소되지않았습니다.');
            }
            
		});
        
        $(".checkBtn2").click(function(){
            var delConfirm = confirm('쿠폰등록을 취소하겠습니까?');
            var table = $('#dataTable').DataTable();
            var no = null;	
        		var str = ""
        		var tdArr = new Array();	// 배열 선언
        		var checkBtn = $(this);
        		
        		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
        		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        		var tr = checkBtn.parent().parent();
        		var td = tr.children();
        		
        		no = td.eq(0).text();
        		
        		alert(no);
        		
        		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.

            if (delConfirm) {
            	$.ajax({
			    	   url: '${contextPath}/couponRegist.ad',
			    	   data: {
			    		   delConfirm: delConfirm,
			    		   couRegister: no
			            },
			    	   success:(data) => {
			               alert('등록이 취소되었습니다.');
			               (location || window.location || document.location).reload();
			    	   }
			   });
            }
            else {
               alert('등록이 취소되지않았습니다.');
            }
            
		});
        
        $('#staticBackdrop').on('show.bs.modal', function (event) {
        	  var button = $(event.relatedTarget) // Button that triggered the modal
        	  var recipient = button.data('whatever') // Extract info from data-* attributes
        	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        	  var modal = $(this)
        	  modal.find('.modal-title').text('New message to ' + recipient)
        	  modal.find('.modal-body input').val(recipient)
        	})
        
    </script>
</body>

</html>