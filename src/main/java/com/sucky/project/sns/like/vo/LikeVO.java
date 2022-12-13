package com.sucky.project.sns.like.vo;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sucky.project.sns.like.dao.LikeDAO;

@Service
public class LikeVO {
	
	
	@Autowired
	private LikeDAO likeDAO;
	
	
	public boolean like(int postId,int userId) {
		
		//좋아요 상태면 >> 취소
		//비좋아요 상태면 >> 좋아요
		
		if(this.isLike(postId, userId) == true) { //좋아요 상태 >> 취소
			this.removeLike(postId, userId);
			return false;
		} else { //비좋아요 >> 좋아요
			likeDAO.insertLike(postId, userId);
			return true;
		}
		

	}
	
	//postId로 좋아요 개수 조회
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	//postId와 userId 로 좋아요 여부 확인
	public boolean isLike(int postId, int userId) {
		int count = likeDAO.selectLikeCountByUserId(postId, userId);
		
		if(count ==0) {
			return false;
		} else {
			return true;
		}
		
		//return ~(likeDAO.S
	
	}
	
	public int removeLike(int postId, int userId) {
		
		return likeDAO.deleteLike(postId, userId);
	}
	
	public int removeLikeByPost(int postId) {
		
		return likeDAO.deleteLikeByPost(postId);
	}
	

	
}
