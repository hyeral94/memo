package com.somsom.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.memo.common.EncryptUtils;
import com.somsom.memo.user.dao.UserDAO;
import com.somsom.memo.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		
		// 암호화 진행
		String encPassword = EncryptUtils.mb5(password);
		
		return userDAO.insertUser(loginId, encPassword, name, email);
	}
	
	public User getUSer(String loginId, String password) {
		
		String encPassword = EncryptUtils.mb5(password);
		
		return userDAO.selectUser(loginId, encPassword);		
	}
}
