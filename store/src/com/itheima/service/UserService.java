package com.itheima.service;

import java.util.List;

import com.itheima.domain.User;

public interface UserService {

	void regist(User user) throws Exception;

	User active(String code) throws Exception;

	User login(String username, String password) throws Exception;

	User loginAdmin(String username, String password)throws Exception;

	void update(User user)throws Exception;

	List<User> findAll() throws Exception;

	void addUser(User user) throws Exception;

}
