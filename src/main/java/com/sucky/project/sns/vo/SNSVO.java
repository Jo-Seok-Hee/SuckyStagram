package com.sucky.project.sns.vo;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sucky.project.common.EncryptUtils;
import com.sucky.project.sns.dao.SNSDAO;
import com.sucky.project.sns.model.SNS;

@Service
public class SNSVO {
	
	@Autowired
	private SNSDAO snsDAO;
	
	public int addSignUp(String loginId, String password, String name, String nickname, String email) {
		String encPassword = EncryptUtils.md5(password);
		
		
		return snsDAO.insertSignUp(loginId, encPassword, name, nickname, email);
	}
	
	public SNS getSignIn(String loginId, String password) {
		
		String encPassword = EncryptUtils.md5(password);
		return snsDAO.selectSignIn(loginId, encPassword);
	}
	
	public boolean isDuplicatedId(String loginId) {

		int count = snsDAO.checkDuplicatedId(loginId);
		
		if(count == 1) {
			//중복 되었음  >> 실패 사용불가능
			return false;
		} else {
			//count == 0
			//중복 되지 않음 >> 사용가능 성공
			return true;
		}
	}
	
	
}
