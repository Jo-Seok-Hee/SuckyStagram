package com.sucky.project.sns.comment.vo;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sucky.project.sns.comment.dao.CommentDAO;
import com.sucky.project.sns.model.Comment;

@Service
public class CommentVO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId, int userId, String userName, String content) {
		return commentDAO.insertComment(postId, userId, userName, content);
	}
	
	//postId로 댓글 가져오기

	public List<Comment> getCommentList(int postId){
		
		return commentDAO.selectCommentList(postId);
	}
	
	public int removeComment(int postId) {
		
		return commentDAO.deleteComment(postId);
	}
}
