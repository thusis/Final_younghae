package com.kh.young.myPage.contoller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
import com.kh.young.model.vo.Coupon;
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
            
            return "myInfo";
    	}else {
    		int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    		GeneralUser gu = myService.selectGeneral(id);
    		
    		model.addAttribute("GeneralUser", gu);
    			
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
    public String myCoupon(HttpSession session, Model model, Coupon C) {
    	
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	ArrayList < Coupon > CL = myService.selectAllCoupon(id);
    	
    	model.addAttribute("couponList",CL);
    	
    	
        return "myCoupon";
    }
    
    //쿠폰 등록
    @RequestMapping("registCoupon.my")
    @ResponseBody
    public String registCoupon(HttpSession session, Model model, Coupon C, @RequestParam("couponRegist") String couponRegist ) {
    	
    	String str = "A";
    	int result = 0;
    	int result2 = 0;
    	int result3 = 0;
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	long miliseconds = System.currentTimeMillis();
    	Date now = new Date(miliseconds);
    	
    	//내 쿠폰
    	ArrayList < Coupon > CLT = myService.selectAllCoupon(id);
    	//등록할수있는쿠폰
    	ArrayList < Coupon > CL = myService.selectAdminCoupon(str);
    	
    	// 쿠폰등록 동일한지, 유효기간
    	for(int i=0;i<CL.size();i++) {
    		if(CL.get(i).getCouRegister().equals(couponRegist)) {
    				C = CL.get(i);
    				result = 1;
    			if(CL.get(i).getCouEndDate().after(now)) {
        			result2 = 1;
    			}
    		}
    	}
    	// 쿠폰 중복여부
    	if(CLT.size()==0) {
    		result3=1;
    	}else {
        	for(int i=0;i<CLT.size();i++) {
        		if(CLT.get(i).getCouRegister().equals(couponRegist)) {
        			result3 = 0;
        			break;
        		}else {
        			result3 = 1;
        		}
        	}
    	}
    	if(result >0 && result2>0 && result3>0) {
    		C.setUserNum(id);
    		int fResult = myService.couponInsert(C);
    		return "YES";
    	}else {
    		if(result==0) {
    			return "NOA";
    		}else if(result2==0) {
    			return "NOB";
    		}else {
    			return "NOC";
    		}
    	}
    	
        
    }
    // 내 주문 이동.
    @RequestMapping("myOrder.my")
    public String myOrder() {
        return "myOrder";
    }
    
    
    //회원탈퇴
    @RequestMapping("deleteMember.my")
	public String deleteMember(HttpSession session, Model model) {
		int userNum = ((Member) session.getAttribute("loginUser")).getUserNum();
		
		int result = myService.deleteMember(userNum);
		
		if(result > 0) {
			return "redirect:logout.me";
		} else {
			throw new MemberException("회원탈퇴에 실패하였습니다.");
		}
		
	}



    // ------------------------ 내 포인트 내용 보기 -----------------------------------------

    // 내 포인트 이동.
    @RequestMapping("myPointView.my")
    public String myPointView(HttpSession session, Model model, Member m) {
        int choose = ((Member) session.getAttribute("loginUser")).getUserCNumber();
        if (choose == '2') {
            int id = ((Member) session.getAttribute("loginUser")).getUserNum();

            ExpertUser eu = myService.selectExpert(id);
            ArrayList < Point > PL = myService.selectAllPoint(id);
            
            m = myService.selectAllMember(id);

            model.addAttribute("ExpertUser", eu);
            model.addAttribute("PointList", PL);
            model.addAttribute("Member", m);
        } else {
            int id = ((Member) session.getAttribute("loginUser")).getUserNum();
            
            GeneralUser gu = myService.selectGeneral(id);
            ArrayList < Point > PL = myService.selectAllPoint(id);
            
            m = myService.selectAllMember(id);

            model.addAttribute("GeneralUser", gu);
            model.addAttribute("PointList", PL);
            model.addAttribute("Member", m);



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
        
        String updatePointMain = "+"+updatePoint;

        HashMap < String, Object > map = new HashMap < String, Object > ();
        map.put("updatePoint", updatePointMain);
        map.put("updateOrder", updateOrder);
        map.put("updateName", updateName);
        map.put("updatePointTotal", updatePoint);
        map.put("id", id);
        
        
        int updateTotal = myService.pointTotal(map);
        
        int result = myService.pointInsert(map);


        if (result > 0 && updateTotal >0) {
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