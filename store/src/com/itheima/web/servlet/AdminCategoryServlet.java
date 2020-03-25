package com.itheima.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.domain.Category;
import com.itheima.service.CategoryService;
import com.itheima.utils.BeanFactory;
import com.itheima.utils.UUIDUtils;
import com.itheima.web.servlet.base.BaseServlet;

/**
 * 后台分类管理模块
 */
public class AdminCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 修改分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException 
	 */
	public String update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		//1.封装category对象
		Category c = new Category();
		c.setCid(request.getParameter("cid"));
		c.setCname(request.getParameter("cname"));
		
		//2.调用service完成添加操作
		CategoryService cs = (CategoryService) BeanFactory.getBean("CategoryService");
		cs.update(c);
	
		
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
		return null;
	}
	/**
	 * 跳转编辑页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException 
	 */
	public String setUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String cid=(String) request.getParameter("cid");
		request.setAttribute("cid", cid);
		return "/admin/category/edit.jsp";
	}
	
	/**
	 * 跳转删除页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException 
	 */
	public String deleteByCid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		//1.获取cid
		String cid=(String) request.getParameter("cid");
		//2.调用service删除对应的值
		CategoryService cs = (CategoryService) BeanFactory.getBean("CategoryService");
		cs.delete(cid);
		//3.重定向
				response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
				return null;
	}
	/**
	 * 添加分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.封装category对象
			Category c = new Category();
			c.setCid(UUIDUtils.getId());
			c.setCname(request.getParameter("cname"));
			
			//2.调用service完成添加操作
			CategoryService cs = (CategoryService) BeanFactory.getBean("CategoryService");
			cs.save(c);
			
			//3.重定向
			response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return null;
	}
	
	/**
	 * 跳转到添加页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/admin/category/add.jsp";
	}
	/**
	 * 展示所有分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.调用service 获取所有的分类
			CategoryService cs = (CategoryService) BeanFactory.getBean("CategoryService");
			List<Category> list=cs.findList();
			
			//2.将返回值放入request域中 请求转发
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		return "/admin/category/list.jsp";
	}

}
