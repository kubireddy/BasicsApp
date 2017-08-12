package com.klr.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klr.model.EmployerSignUpForm;
import com.klr.model.LoginForm;
import com.klr.model.ResendForm;
import com.klr.model.SignUpForm;
import com.klr.repositoryAndService.RepositoryService;
import com.klr.repositoryAndService.VerificationForm;
import com.klr.util.TokenGenerator;
import com.klr.repositoryAndService.EmailSender;
import com.klr.repositoryAndService.EmailSenderImpl;

@Controller
public class BaseController {

	private static final String HOME_PAGE = "home";
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	private RepositoryService repositoryService;
	private EmailSender emailSender;
	
	@Autowired
    public BaseController(@Qualifier("signupServiceImpl") RepositoryService repositoryService, @Qualifier("emailSenderImpl") EmailSender emailSender){
          this.repositoryService = repositoryService;
          this.emailSender = emailSender;
    }

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView model1 = new ModelAndView();
		model1.setViewName("home");
		return model1;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return HOME_PAGE;
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(ModelMap model) {
		return "about";
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView signIn() {
		ModelAndView model = new ModelAndView();
		model.addObject("loginForm", new LoginForm());
		model.setViewName("signin");
		return model;
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(ModelMap model) {
		return "contact";
	}
	
	//This is to match the all Form Fields with Form Backing Bean
	// value = popup.jsp
	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public ModelAndView signupPage() {
	   ModelAndView model = new ModelAndView();
	   model.addObject("signUpForm", new SignUpForm());
	   model.addObject("employerSignUpForm", new EmployerSignUpForm());
	   model.setViewName("popup");
	   return model;
	}
	
	//here We can read the all Form fields and send it to next Jsp Page.
	@RequestMapping(value = "/userSignup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("signUpForm") SignUpForm signUpForm) {
		ModelAndView model = new ModelAndView();
		model.addObject("signUpForm", signUpForm);
		model.setViewName("signup");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("FirstName", signUpForm.getFirstName());
		map.put("LastName", signUpForm.getLastName());
		map.put("EmailId", signUpForm.getSignUpEmail());
		map.put("Password", signUpForm.getSignUpPassword());
		map.put("token", signUpForm.getSignUpEmail()+"?"+TokenGenerator.getToken());
		map.put("EmployerNumber", signUpForm.getEmployerIdentity());
		map.put("CompanyName", "NULL"); // for user
		map.put("isEmployer", "N"); // for user

		repositoryService.save(map);
		
		emailSender.sendMail(map);
		
		return model;
	}
	
	//here We can read the all Form fields and send it to next Jsp Page.
	@RequestMapping(value = "/employerSignup", method = RequestMethod.POST)
	public ModelAndView signupEmployer(@ModelAttribute("employerSignUpForm") EmployerSignUpForm employerSignUpForm) {
		ModelAndView model = new ModelAndView();
		model.addObject("employerSignUpForm", employerSignUpForm);
		model.setViewName("signup");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("FirstName", "NULL"); // for employer
		map.put("LastName", "NULL"); // for employer
		map.put("EmailId", employerSignUpForm.getCompanyId());
		map.put("Password", employerSignUpForm.getPasscode());
		map.put("token", employerSignUpForm.getCompanyId()+"?"+TokenGenerator.getToken());
		map.put("EmployerNumber", employerSignUpForm.getCompanyName().substring(0, 5)+TokenGenerator.getToken().substring(0, 5)); //we have to generate employer number
		map.put("CompanyName", employerSignUpForm.getCompanyName()); 
		map.put("isEmployer", "Y"); // for employer

		repositoryService.save(map);
		
		emailSender.sendMail(map);
		
		return model;
	}
	//end
	
	@RequestMapping(value = "/existance", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Map<String, String> existence(@RequestParam Map<String, String> map) {
		Map<String, String> response = new HashMap<String, String>();
		String flag = repositoryService.checkUserExistance(map);
		response.put("flag", flag);
		return response;
	}
	
	@RequestMapping(value = "/employer", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Map<String, String> verifyEmployerId(@RequestParam Map<String, String> map) {
		Map<String, String> response = new HashMap<String, String>();
		String flag = repositoryService.checkEmployerId(map);
		response.put("flag", flag);
		return response;
	}
	
	@RequestMapping(value = "/verifyToken", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Map<String, String> tokenVerification(@RequestParam Map<String, String> map) {
		Map<String, String> response = new HashMap<String, String>();
		String flag = repositoryService.verifyToken(map);
		response.put("flag", flag);
		return response;
	}
	
	@RequestMapping(value = "/verifyLogin", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Map<String, String> verifyLogin(@RequestParam Map<String, String> map) {
		Map<String, String> response = new HashMap<String, String>();
		String flag = repositoryService.verify(map);
		response.put("flag", flag);
		return response;
	}
	
	@RequestMapping(value = "/resend", method = RequestMethod.GET)
	public ModelAndView resendPage() {
	   ModelAndView model = new ModelAndView();
	   model.addObject("ResendForm", new ResendForm());
	   model.setViewName("signup");
	   return model;
	}
	
	//here We can read the all Form fields and send it to next Jsp Page.
	@RequestMapping(value = "/resend", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("resendForm") ResendForm resendForm) {
		ModelAndView model = new ModelAndView();
		model.addObject("resendForm", resendForm);
		model.setViewName("signup");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("EmailId", resendForm.getEmailResend());
		map.put("token", resendForm.getEmailResend()+"?"+TokenGenerator.getToken());
		
		repositoryService.replaceToken(map);
		
		emailSender.sendMail(map);
		
		return model;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("loginForm") LoginForm loginForm) {
		ModelAndView model = new ModelAndView();
		model.addObject("loginForm", loginForm);
		model.setViewName("loginView");
		return model;
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupPage1() {
	   ModelAndView model = new ModelAndView();
	   model.addObject("verificationForm", new VerificationForm());
	   model.setViewName("signup");
	   return model;
	}
	
	@RequestMapping(value = "/success", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("verificationForm") VerificationForm verificationForm) {
		ModelAndView model = new ModelAndView();
		model.addObject("verificationForm", verificationForm);
		model.setViewName("loginView");
		return model;
	}

}