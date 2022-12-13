package com.sucky.project.sns.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sucky.project.common.FileManagerService;
import com.sucky.project.sns.comment.vo.CommentVO;
import com.sucky.project.sns.dao.PostSNSDAO;
import com.sucky.project.sns.like.vo.LikeVO;
import com.sucky.project.sns.model.Comment;
import com.sucky.project.sns.model.Post;
import com.sucky.project.sns.model.PostDetail;

@Service
public class PostSNSVO {
	
	@Autowired
	private PostSNSDAO postSNSDAO;
	
	@Autowired
	private CommentVO commentVO;
	
	@Autowired
	private LikeVO likeVO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postSNSDAO.insertPost(userId, userName, content, filePath);
	}
	
	public List<PostDetail> getPostList(int userId){
		
		//post리스트 가져오기, 댓글,좋아요 가져오기
		List<Post> postList = postSNSDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		for(Post post:postList) {
			List<Comment> commentList = commentVO.getCommentList(post.getId());
			
			int likeCount = likeVO.getLikeCount(post.getId());
			boolean isLike = likeVO.isLike(post.getId(), userId);
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;

//		return postSNSDAO.selectPost();
	}
	
	public int removePost(
			int postId
			,int userId
			) {
		//좋아요 삭제
		likeVO.removeLikeByPost(postId);
		//댓글 삭제
		commentVO.removeComment(postId);
		//파일 삭제
		Post post = postSNSDAO.selectPostImage(postId);
		FileManagerService.removeFile(post.getImagePath());
		
		return postSNSDAO.deletePost(postId, userId);
	}
	
	
}
