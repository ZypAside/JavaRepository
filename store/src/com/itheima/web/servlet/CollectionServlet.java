package com.itheima.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.dao.CollectionDao;
import com.itheima.domain.CollectionItem;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;
import com.itheima.domain.User;
import com.itheima.service.CollectionService;
import com.itheima.utils.BeanFactory;
import com.itheima.utils.UUIDUtils;
import com.itheima.web.servlet.base.BaseServlet;


public class CollectionServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

		/*
	 * 获取该用户的所有收藏
	 * */
	public String findMyCOllectionByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取pageNumber 设置pagesize 获取userid
			int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			int pageSize=3;
			
			User user=(User)request.getSession().getAttribute("user");
			if(user == null){
				//未登录 提示
				request.setAttribute("msg", "请先登录");
				return "/jsp/msg.jsp";
			}
			//2.调用service获取当前页所有数据  pagebean
			CollectionService os = (CollectionService) BeanFactory.getBean("CollectionService");
			PageBean<Product> bean = os.findMyCollectionByPage(pageNumber,pageSize,user.getUid());
			
			//3.将pagebean放入request域中,请求转发collection_list.jsp
			request.setAttribute("pb", bean);
			if (bean==null) {
				request.setAttribute("msg", "收藏夹空空如也，快去收藏吧！");
				return "/jsp/msg.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "获取我的收藏失败");
			return "/jsp/msg.jsp";
		}
		return "/jsp/collection_list.jsp";
	}
	
	/*
	 * 通过用户名和pid删除收藏
	 * */
	
	public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		User user=(User) request.getSession().getAttribute("user");
		//1.获取pid
		String pid = request.getParameter("pid");
		//2.封装collection
		CollectionItem collectionItem=new CollectionItem();
		collectionItem.setPid(pid);
		collectionItem.setUser(user);
		
		//调用service完成删除
		CollectionService  cs = (CollectionService) BeanFactory.getBean("CollectionService");
		cs.delete(collectionItem);
		response.sendRedirect(request.getContextPath()+"/collection?method=findMyCOllectionByPage&pageNumber=1");
		
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("msg", "删除收藏失败");
		return "/jsp/msg.jsp";
	}
		return null;
}
	/**
	 * 加入收藏
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addByPid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user=(User) request.getSession().getAttribute("user");
			if(user == null){
				//未登录 提示
				request.setAttribute("msg", "请先登录!");
				return "/jsp/msg.jsp";
			}
			//1.获取pid
			String pid = request.getParameter("pid");
			
			//2.封装collection
			CollectionItem collectionItem=new CollectionItem();
			collectionItem.setCid(UUIDUtils.getId());
			collectionItem.setPid(pid);
			collectionItem.setUser(user);
			
			//调用service完成添加
			CollectionDao cd=(CollectionDao)BeanFactory.getBean("CollectionDao");
			CollectionItem cItem=cd.findById(collectionItem);
			if (cItem!=null) {
				String msg="您已经收藏了";
				request.setAttribute("msg", msg);
				return "/jsp/msg.jsp";
			}
			CollectionService  cs = (CollectionService) BeanFactory.getBean("CollectionService");
			cs.addByPid(collectionItem);
			String msg="收藏成功";
			request.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath()+"/product?method=getById&pid="+pid);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "加入收藏失败");
			return "/jsp/msg.jsp";
		}return null;
	}
	
}
