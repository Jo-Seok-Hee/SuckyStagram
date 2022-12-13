package com.sucky.project.sns.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sucky.project.sns.model.Post;

@Repository
public interface PostSNSDAO {
	
	public int insertPost(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("imagePath") String imagePath	
			);
	
	public List<Post> selectPost();
	
	public int deletePost(
			@Param("postId") int postId
			, @Param("userId") int userId
			
			);
	
	public Post selectPostImage(@Param("postId") int postId);
}
