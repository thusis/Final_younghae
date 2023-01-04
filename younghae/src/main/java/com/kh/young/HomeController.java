 package com.kh.young;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home2() {
	      return "/supplement/admin_StoryPage";
	   }
	   
	   @RequestMapping(value = "home.do", method = RequestMethod.GET)
	   public String home() {
	      return "/common/topmenubar";
	   }
	
}
