package com.sucky.project.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	public static String md5(String message) {
		String encData = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			
			// asdf
			// [00000000, 00000000, 00000000, 000000000] 
			byte[] bytes = message.getBytes();
			md.update(bytes);
			
			byte[] digest = md.digest();
			
			// 숫자 -> 문자열 
			for(int i = 0; i < digest.length; i++) {
				encData += Integer.toHexString(digest[i] & 0xff);
				//  00101000
				//& 00110100
				//  00100000	
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		
		return encData;
	}
}
