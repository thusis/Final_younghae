package com.kh.young.myPage.contoller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.young.member.exception.MemberException;
import com.kh.young.member.service.MemberService;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Point;
import com.kh.young.myPage.exception.MyPageException;
import com.kh.young.myPage.service.MyPageService;

@Controller
public class MyPageController {

    @Autowired
    private MyPageService myService;

    //마이 페이지 이동.
    @RequestMapping("myPage.my")
    public String myPage() {
    return "myPage";
    }
        
  

    // 내 정보 이동.
    @RequestMapping("myInfo.my")
    public String myInfo(HttpSession session, Model model) {
    	int sort = ((Member) session.getAttribute("loginUser")).getUserCNumber();
    	if(sort==2) {
    		int id = ((Member) session.getAttribute("loginUser")).getUserNum();
        	
            ExpertUser eu = myService.selectExpert(id);

            model.addAttribute("ExpertUser", eu);
            
            System.out.println(eu);
            
            return "myInfo";
    	}else {
    		int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    		GeneralUser gu = myService.selectGeneral(id);
    		
    		model.addAttribute("GeneralUser", gu);
    		
    		System.out.println(gu);
    		
    		return "myInfo";
    	}
    }
    // 내 스크랩 이동.
    @RequestMapping("myScrap.my")
    public String myScrap() {
        return "myScrap";
    }
    // 내 프로필 이동.
    @RequestMapping("myProfile.my")
    public String myProfile(HttpSession session, Model model) {

        int id = ((Member) session.getAttribute("loginUser")).getUserNum();

        ExpertUser eu = myService.selectExpert(id);

        model.addAttribute("ExpertUser", eu);
        return "myProfile";
    }
    // 내 프로필 수정.
    @RequestMapping("updateProfile.my")
    public String updateProfile(@ModelAttribute ExpertUser eu, HttpSession session, Model model,
        HttpServletRequest req) {

        int result = 0;
        int id = ((Member) session.getAttribute("loginUser")).getUserNum();
        eu.setUserNum(id);

        result = myService.updateProfile(eu);

        if (result > 0) {
            return "../myPage/myPage";
        } else {
            throw new MyPageException("회원 수정을 실패하였습니다.");
        }
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
    public String myPointView(HttpSession session, Model model) {
        int choose = ((Member) session.getAttribute("loginUser")).getUserCNumber();
        if (choose == '2') {
            int id = ((Member) session.getAttribute("loginUser")).getUserNum();

            ExpertUser eu = myService.selectExpert(id);

            model.addAttribute("ExpertUser", eu);
        } else {
            int id = ((Member) session.getAttribute("loginUser")).getUserNum();

            GeneralUser gu = myService.selectGeneral(id);
            Point P = myService.selectPoint(id);
            ArrayList < Point > PL = myService.selectAllPoint(id);

            model.addAttribute("GeneralUser", gu);
            model.addAttribute("Point", P);
            model.addAttribute("PointList", PL);



        }
        return "myPointView";
    }
    // 내 포인트 충전하기
    @RequestMapping("pointInsert.my")
    public String pointUpdate(HttpSession session,
        @RequestParam("updatePoint") String updatePoint,
        @RequestParam("updateName") String updateName,
        @RequestParam("updateOrder") String updateOrder,
        @RequestParam("pointTotal") String pointTotal, Model model) {


        if (pointTotal.equals(null) || pointTotal.equals("")) {
            pointTotal = "0";
        }

        int id = ((Member) session.getAttribute("loginUser")).getUserNum();

        int total = Integer.parseInt(pointTotal) + Integer.parseInt(updatePoint);

        HashMap < String, Object > map = new HashMap < String, Object > ();
        map.put("updatePoint", updatePoint);
        map.put("updateOrder", updateOrder);
        map.put("updateName", updateName);
        map.put("updateTotal", total);
        map.put("id", id);

        int result = myService.pointInsert(map);


        if (result > 0) {
            return "myPointView";
        } else {
            throw new MyPageException("포인트 충전실패했습니다.");
        }

    }

    // 내 포인트 상세보기 이동
    @RequestMapping("myPointDetail.my")
    public String myPointDetail(HttpSession session, Model model) {
        int id = ((Member) session.getAttribute("loginUser")).getUserNum();
        ArrayList < Point > PL = myService.selectAllPoint(id);
        model.addAttribute("PointList", PL);

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

    //-------------------------------관리자 페이지 --------------------------------------------
    // 관리자페이지 이동.
    @RequestMapping("adminPage.my")
    public String adminPage() {
        return "adminPage";
    }
    
    
    
    
    
}	