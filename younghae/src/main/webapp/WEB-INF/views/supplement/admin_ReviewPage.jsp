<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 리뷰 관리</title>

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

        th, td{
            text-align: center;
        }
    </style>
</head>
<body>

        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
    
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>    
        <div class="container">
            <div class="bn_index mt-5">
                <ul>
                    <li>관리자 페이지</li>
                    <li> <b>/</b> </li>
                    <li><a href="#">리뷰 관리</a></li>
                </ul>
            </div>
            <br>
            <div class="reviewTable">
                <label for="" style="color: #24E082; font-weight: 700;">리뷰 관리</label>
            </div>
            <div class="bn_boardlist mt-2">
                <div class="col-lg-12" style="border: 1px solid #24E082; height: 90px; padding: 2%;">
                    <label style="font-size: 20px; font-weight: 600;">총 리뷰 수</label>
                        <input type="text" value="1354" 
                        style="height: 40px; width: 150px; text-align:center; font-size: 30px;
                        border: none; padding-top: 1%;" readonly>
                    <label style="font-size: 20px; font-weight: 600;">개</label>
                </div>
                <br>
                <table class="table">
                    <thead>
                        <tr class="text-teal-100">
                            <td scope="col" colspan="12">
                                <select id="selectBtn" style="width: 100px;" onchange="selectedopntion();">
                                    <option value="productNumber">제품 번호 순</option>
                                    <option value="productName">제품 이름 순</option>
                                    <option value="productGood">추천 순</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="text-teal-100">
                            <th scope="col" class="col-lg-2">제품번호</th>
                            <th scope="col" class="col-lg-5">리뷰 내용</th>
                            <th scope="col" class="col-lg-2">작성자</th>
                            <th scope="col" class="col-lg-2">작성일</th>
                            <th scope="col" class="col-lg-1">상태</th>
                        </tr>
                    </thead>
                    <tbody id="selectTbody">
                        <!-- <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${ product.productNum }</td>
                            <td>${ review.content }</td>
                            <td>${ review.writer }</td>
                            <td>${ review.modifyDate }</td>
                            <td>
                                <c:if test="${ review.status eq 'N'} ">
                                    <i class="bi bi-x-circle" style="color: red;"></i>
                                </c:if>
                                <c:if test="${ review.status eq 'Y'} ">
                                    <i class="bi bi-circle" style="color: #24E082;"></i>
                                </c:if>
                            </td>
                        </tr> -->
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">1</td>
                            <td>비타비타</td>
                            <td>yamyam</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr>
                        <!-- <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">2</td>
                            <td>하루종일 콜라겐</td>
                            <td>allDay</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-x-circle" style="color: red;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">3</td>
                            <td>내 몸에 SOS</td>
                            <td>Vita</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-x-circle" style="color: red;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">4</td>
                            <td>한미프로캅</td>
                            <td>yummy</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">5</td>
                            <td>몸 튼튼 아연!</td>
                            <td>ummmm</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">6</td>
                            <td>고칼슘 튼튼</td>
                            <td>wlqrkwk</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr> -->
                    </tbody>
                </table>
            </div>
            <div class="col-lg-12 text-center" style="margin-top: 3%;">
                <div class="product__pagination blog__pagination">
                    <a href="#"><i class="fa fa-long-arrow-left"></i></a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
                <br><br><br>
            </div>
        </div>


        <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
                            </div>
                            <ul>
                                <li>Address: 60-49 Road 11378 New York</li>
                                <li>Phone: +65 11.188.888</li>
                                <li>Email: hello@colorlib.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                        <div class="footer__widget">
                            <h6>Useful Links</h6>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">About Our Shop</a></li>
                                <li><a href="#">Secure Shopping</a></li>
                                <li><a href="#">Delivery infomation</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Who We Are</a></li>
                                <li><a href="#">Our Services</a></li>
                                <li><a href="#">Projects</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Innovation</a></li>
                                <li><a href="#">Testimonials</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="footer__widget">
                            <h6>Join Our Newsletter Now</h6>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright">
                            <div class="footer__copyright__text">
                                <p>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;
                                    <script>document.write(new Date().getFullYear());</script> All rights reserved | This
                                    template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                                        href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
                            <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <script>
            window.onload=()=>{
            	selectedopntion();
            	
                function reviewLisg(){
                    // reviewList 출력
                    const tbody = document.getElementById('selectTbody');
                    console.log(tbody);
                    const tds = tbody.querySelectorAll('td');
                    console.log(tds);
                    // for(const td of tds){
                    //     td.addEventListener('click', function() {
                    //         const trTds = this.parentElement.querySelectorAll('td');
                    //         const reviewNum = trTds[0].innerText;
                    //         const reviewWriter = trTds[2].innerText;
    
                    //         location.href  = '${contextPath}/selectBoard.bo?reviewNum='+ reviewNum+ "&reviewWriter=" + reviewWriter + "&page=" + ${pi.currentPage};
                    //     });
                    // }
                }
            }


            function selectedopntion(){
                // 카테고리에 따라 정렬
//                 const span = document.getElementsByClassName('nice-select')[1].firstChild;
//                 console.log(span.innerText);

				const selectValue = document.getElementById('selectBtn').value;
				if(selectValue == "productName"){
					console.log("제품 이름 순");
				}else if(selectValue == "productNumber"){
					console.log("제품 번호 순");
				}else{
					console.log("추천 순");
				}
				console.log(selectValue);
            }

            
        </script>
</body>
</html>