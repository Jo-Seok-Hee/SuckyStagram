package com.sucky.project.sns.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sucky.project.sns.comment.vo.CommentVO;

@RestController
public class CommentRestController {
	
	@Autowired
	private CommentVO commentVO;
	
	@PostMapping("/post/uploadComment")
	public Map<String, String> create(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpServletRequest request ) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int count = commentVO.addComment(postId, userId, userName, content);
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
