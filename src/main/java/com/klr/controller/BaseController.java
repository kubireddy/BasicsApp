package com.klr.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BaseController {

	private static final String HOME_PAGE = "home";
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(ModelMap model) {
//		model.addAttribute("message", "Welcome");
//		model.addAttribute("counter", ++counter);
//		logger.debug("[welcome] counter : {}", counter);
		return HOME_PAGE;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return HOME_PAGE;
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(ModelMap model) {
		return "about";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(ModelMap model) {
		return "contact";
	}
	
	//This is to match the all Form Fields with Form Backing Bean
	// value = popup.jsp
	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public ModelAndView homePage() {
	   ModelAndView model = new ModelAndView();
	   model.addObject("signUpForm", new SignUpForm());
	   model.setViewName("popup");
	   return model;
	}
	
	//here We can read the all Form fields and send it to next Jsp Page.
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("signUpForm") SignUpForm signUpForm) {
		ModelAndView model = new ModelAndView();
		model.addObject("signUpForm", signUpForm);
		model.setViewName("signup");
		return model;
	}

}