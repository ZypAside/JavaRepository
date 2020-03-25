package com.itheima.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.domain.User;
import com.itheima.service.UserService;
import com.itheima.service.impl.UserServiceImpl;
import com.itheima.utils.BeanFactory;
import com.itheima.utils.UUIDUtils;
import com.itheima.web.servlet.base.BaseServlet;

public class AdminUserServlet extends BaseServlet {
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.调用service 获取所有的用户
			UserService cs = (UserService) BeanFactory.getBean("UserService");
			List<User> list=cs.findAll();
			
			//2.将返回值放入request域中 请求转发
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		return "/admin/user/list.jsp";
	}


public String addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		
		User user=new User();
		user.setUid(UUIDUtils.getId());
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
			user.setName(request.getParameter("name"));
			user.setBirthday(request.getParameter("birthday"));
			user.setEmail(request.getParameter("email"));
			user.setSex(request.getParameter("sex"));
			
		UserService cs = (UserService) BeanFactory.getBean("UserService");
		cs.addUser(user);
		
response.sendRedirect(request.getContextPath()+"/adminUser?method=findAll");
	
	} catch (Exception e) {
		e.printStackTrace();
		throw new RuntimeException();
	}
	
	return null;
}
}