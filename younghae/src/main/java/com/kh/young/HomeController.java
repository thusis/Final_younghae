 package com.kh.young;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Story;
import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.service.ShoppingService;
import com.kh.young.story.service.StoryService;
import com.kh.young.supplement.service.SupplementService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ShoppingService shService; //쇼핑
	
	@Autowired
	private SupplementService sService; //영양제
	
	@Autowired
	private StoryService stService; //스토리
	
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home2(Model model) {
		   
		   /**쇼핑===============================================================**/
		   ArrayList<Supplement> supplementList = shService.selectSupplementList();
		   /**쇼핑===============================================================**/

		   /**영양제===============================================================**/
		   PageInfo pi =  Pagination.getPageInfo(1, 50, 12);
		   ArrayList<ProCategory> jhSupplmentList = sService.allCategory(pi);
		   /**영양제===============================================================**/
		   
		   /**컬럼리스트===============================================================**/
		   PageInfo pi2 =  Pagination.getPageInfo(1, 10, 10);
		   ArrayList<Story> columnlist = stService.allStory(pi2);
		   /**컬럼리스트===============================================================**/
		   
		   
		   
		   model.addAttribute("supplementList",supplementList);
		   model.addAttribute("jhSupplmentList",jhSupplmentList);
		   model.addAttribute("columnlist",columnlist);
		   
	      return "/common/home";
	   }
	   
	   @RequestMapping(value = "/home.do", method = RequestMethod.GET)
	   public String home(Model model) {
		   /**쇼핑===============================================================**/
		   ArrayList<Supplement> supplementList = shService.selectSupplementList();
		   /**쇼핑===============================================================**/

		   /**영양제===============================================================**/
		   PageInfo pi =  Pagination.getPageInfo(1, 50, 12);
		   ArrayList<ProCategory> jhSupplmentList = sService.allCategory(pi);
		   /**영양제===============================================================**/
		   
		   /**컬럼리스트===============================================================**/
		   PageInfo pi2 =  Pagination.getPageInfo(1, 10, 10);
		   ArrayList<Story> columnlist = stService.allStory(pi2);
		   /**컬럼리스트===============================================================**/
		   
		   
		   
		   model.addAttribute("supplementList",supplementList);
		   model.addAttribute("jhSupplmentList",jhSupplmentList);
		   model.addAttribute("columnlist",columnlist);
		   
	      return "/common/home";
	   }
	
}
