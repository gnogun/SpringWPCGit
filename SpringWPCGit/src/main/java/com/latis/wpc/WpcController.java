package com.latis.wpc;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.latis.wpc.security.userdetails.CustomUserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WpcController {
	
	private static final Logger logger = LoggerFactory.getLogger(WpcController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/login.do"}, method = RequestMethod.GET)
	public String login(Model model) {
//		logger.info("Welcome home! The client locale is {}.");
		return "login";
	}
	
	@RequestMapping(value = {"/{role}/index.do"}, method = RequestMethod.GET)
	public String index(@PathVariable("role") String role, Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
//		ModelAndView model = new ModelAndView("index");
		model.addAttribute("manageAuth", role);
		
		return role+"/index";
	}
	
	@RequestMapping(value = {"/{role}/userManage.do"}, method = RequestMethod.GET)
	public String userManage(@PathVariable("role") String role, Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
//		ModelAndView model = new ModelAndView("index");
		model.addAttribute("manageAuth", role);
		
		return role+"/userManage";
	}
	
	
	@RequestMapping(value = {"/{role}/groupManage.do"}, method = RequestMethod.GET)
	public String groupManage(@PathVariable("role") String role, Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
//		ModelAndView model = new ModelAndView("index");
		model.addAttribute("manageAuth", role);
		
		return role+"/groupManage";
	}
	
	//upload.do, category.do
	@RequestMapping(value = {"/{role}/upload.do"}, method = RequestMethod.GET)
	public String upload(@PathVariable("role") String role, Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
//		ModelAndView model = new ModelAndView("index");
		model.addAttribute("manageAuth", role);
		
		return role+"/upload";
	}
	
	@RequestMapping(value = {"/{role}/category.do"}, method = RequestMethod.GET)
	public String category(@PathVariable("role") String role, Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
//		ModelAndView model = new ModelAndView("index");
		model.addAttribute("manageAuth", role);
		
		return role+"/category";
	}
	
	
	
	
	@RequestMapping(value = {"/index.do"}, method = RequestMethod.GET)
	public String index(HttpSession session, Model model) {
		logger.info("Welcome home! The client locale is {}.");
		
		return "index";
	}
	
}
