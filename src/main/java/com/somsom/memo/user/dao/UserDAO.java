package com.somsom.memo.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.memo.user.model.User;

@Repository
public interface UserDAO {
	
	//param("") -> xml에서 사용할 이름
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
	
	public User selectUser(@Param("loginId") String loginId, @Param("password") String password);
}
