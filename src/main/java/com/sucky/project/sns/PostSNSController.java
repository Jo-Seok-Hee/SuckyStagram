package com.sucky.project.sns;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sucky.project.sns.comment.dao.CommentDAO;
import com.sucky.project.sns.comment.vo.CommentVO;
import com.sucky.project.sns.model.Comment;
import com.sucky.project.sns.model.Post;
import com.sucky.project.sns.model.PostDetail;
import com.sucky.project.sns.vo.PostSNSVO;
import com.sucky.project.sns.vo.SNSVO;



@Controller
public class PostSNSController {
	
	@Autowired
	private PostSNSVO postSNSVO;
	
	@GetMapping("/post/timeline")
	public String timeline(Model model, HttpServletRequest request) {
		
		
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postSNSVO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		model.addAttribute("userId", userId);
		

		
		
		
		return "/post/timeline";
	}
}
