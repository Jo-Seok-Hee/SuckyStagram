package com.sucky.project.sns.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sucky.project.sns.model.SNS;

@Repository
public interface SNSDAO {
	
	
	public int insertSignUp(
			@Param("loginId") String loginId   ,
			@Param("password") String password  ,
			@Param("name") String name   ,
			@Param("nickname") String nickname  ,
			@Param("email") String email  
			);
	
	public int checkDuplicatedId(@Param("loginId")String loginId);
	
	public SNS selectSignIn(
			@Param("loginId")String loginId,
			@Param("password")String password
			);
}
