package com.itheima.dao;

import java.util.List;

import com.itheima.domain.User;

import jdk.nashorn.internal.runtime.ECMAErrors;

public interface UserDao {

	void save(User user) throws Exception;

	User getByCode(String code) throws Exception;

	void update(User user) throws Exception;

	User getByUsernameAndPwd(String username, String password) throws Exception;

	User getByUsernameAndPwdAdmin(String username, String password) throws Exception;

	List<User> findAll() throws Exception;


}
