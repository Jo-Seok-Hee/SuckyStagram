package com.sucky.project.sns;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.sucky.project.sns.model.SNS;
import com.sucky.project.sns.vo.SNSVO;

@RestController
public class SNSRestController {
	
	@Autowired
	private SNSVO snsVO;
	
	@PostMapping("/user/signUp")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("nickname") String nickname,
			@RequestParam("email") String email   
			){
		
		int count = snsVO.addSignUp(loginId, password, name, nickname, email);
		

		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/user/signIn")
	public Map<String, String> SignIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			){
		
		SNS sns = snsVO.getSignIn(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		if(sns != null) {
			result.put("result","success");
			//성공시 세션 부여
			HttpSession session =  request.getSession();
			//id, loginId, name 
			session.setAttribute("userId", sns.getId());
			session.setAttribute("userLoginId", sns.getLoginId());
			session.setAttribute("userName", sns.getNickname());
			
			
			
		} else {
			result.put("result","fail");
		}
		return result;
	}
	
	@PostMapping("/user/isDuplicatedId")
	public Map<String, String> isDuplicatedId(
			@RequestParam("loginId")String loginId
			){
		Map<String, String> result = new HashMap<>();
		
		boolean duplicate = snsVO.isDuplicatedId(loginId);
		
		if(duplicate == true) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
