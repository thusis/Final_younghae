package com.kh.young.myPage.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	
	//마이 페이지 이동.
	@RequestMapping("myPage.my")
	   public String myPage() {
	      return "myPage";
	 }
	
	// 내 정보 이동.
	@RequestMapping("myInfo.my")
	   public String myInfo() {
	      return "myInfo";
	 }
	// 내 정보 수정.
	@RequestMapping("myInfoEdit.my")
	 public String myInfoEdit() {
		return null;
	}
	
	
	
	
	// 내 스크랩 이동.
		@RequestMapping("myScrap.my")
		   public String myScrap() {
		      return "myScrap";
		 }
	// 내 프로필 이동.
		@RequestMapping("myProfile.my")
		   public String myProfile() {
		      return "myProfile";
		 }
		// 내 찜하기 이동.
		@RequestMapping("myWishList.my")
		   public String myWishList() {
		      return "myWishList";
		 }
	// 내 장바구니 이동.
	@RequestMapping("myCart.my")
	   public String myCart() {
	      return "myCart";
	 }
	// 내 쿠폰 이동.
	@RequestMapping("myCoupon.my")
	   public String myCoupon() {
	      return "myCoupon";
	 }

	// 내 주문 이동.
	@RequestMapping("myOrder.my")
	   public String myOrder() {
	      return "myOrder";
	 }

	

	

// ------------------------ 내 포인트 내용 보기 -----------------------------------------
	
	// 내 포인트 이동.
	@RequestMapping("myPointView.my")
	   public String myPointView() {
	      return "myPointView";
	 }	
	
	
	// 내 포인트 상세보기 이동
	@RequestMapping("myPointDetail.my")
	   public String myPointDetail() {
	      return "myPointDetail";
	 }


// ------------------------ 내가 쓴 글 내용 보기 -----------------------------------------
	// 내가쓴 글 이동.
	@RequestMapping("myWriteView.my")
	   public String myWriteView() {
	      return "myWriteView";
	 }
	// 내가쓴글 상세보기이동
	@RequestMapping("myWriteBoardDetail.my")
	   public String myWriteBoardDetail() {
	      return "myWriteBoardDetail";
	 }
	// 내가쓴 답글 상세이동.
	@RequestMapping("myWriteReplyDetail.my")
	   public String myWriteReplyDetail() {
	      return "myWriteReplyDetail";
	 }
	// 내가쓴 후기 상세이동.
	@RequestMapping("myWriteReviewDetail.my")
	   public String myWriteReviewDetail() {
	      return "myWriteReviewDetail";
	 }

	
}
