package com.sucky.project.sns;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SNSController {
	
	
	@GetMapping("/user/mainView")
	public String mainView() {
		return "user/loginView";
	}
	
	@GetMapping("/user/signUpView")
	public String signUpView() {
		return "user/signUpView";
	}
	
	@GetMapping("/user/signout")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/mainView";
	}
}
