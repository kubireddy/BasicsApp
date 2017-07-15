package com.klr.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(ModelMap model) {
		return "signup";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(ModelMap model) {
		return "about";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(ModelMap model) {
		return "contact";
	}

}