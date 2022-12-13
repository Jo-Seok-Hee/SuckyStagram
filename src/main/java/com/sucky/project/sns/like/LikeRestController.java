package com.sucky.project.sns.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sucky.project.sns.like.vo.LikeVO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeVO likeVO;
	
	@GetMapping("/post/like")
	public Map<String, Boolean> like(
			@RequestParam("postId") int postId
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		boolean isLike = likeVO.like(postId, userId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("dd", isLike);
		
		return result;
	}
	
//	@GetMapping("/post/unlike")
//	public Map<String, String> unlike(
//			@RequestParam("postId") int postId
//			, HttpServletRequest request
//			
//			){
//		
//		HttpSession session = request.getSession();
//		
//		int userId = (Integer)session.getAttribute("userId");
//		
//		int count = likeVO.removeLike(postId, userId);
//		
//		Map<String, String> result = new HashMap<>();
//		
//		if(count == 0) {
//			result.put("result", "fail");
//		} else {
//			result.put("result", "success");
//		}
//		
//		return result;
//		
//	}
}
