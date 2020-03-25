package com.itheima.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.constant.Constant;
import com.itheima.domain.Order;
import com.itheima.domain.OrderItem;
import com.itheima.service.OrderService;
import com.itheima.utils.BeanFactory;
import com.itheima.utils.JsonUtil;
import com.itheima.web.servlet.base.BaseServlet;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * 后台订单模块
 */
public class AdminOrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 修改订单状态
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updateState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取oid
			String oid = request.getParameter("oid");
			String action=request.getParameter("action");
			//2.调用service 获取订单
			OrderService os = (OrderService) BeanFactory.getBean("OrderService");
			Order order = os.getById(oid);
			
			//3.设置订单的状态,更新
			//设置为已发货
			if ("qufahuo".equals(action)) {
				order.setState(Constant.ORDER_YIFAHUO);
				os.update(order);
				response.sendRedirect(request.getContextPath()+"/adminOrder?method=findAllByState&state=1");
			}
			//设置为完成
			if ("querenshouhuo".equals(action)) {
				order.setState(Constant.ORDER_YIWANCHENG);
				os.update(order);
				response.sendRedirect(request.getContextPath()+"/order?method=findMyOrdersByPage&pageNumber=1");
			}
			//设置为退款中
			if ("qutuikuan".equals(action)) {
				order.setState(Constant.ORDER_TUIKUANZHONG);
				os.update(order);
				response.sendRedirect(request.getContextPath()+"/order?method=findMyOrdersByPage&pageNumber=1");
			}
			//设置为已退款
			if ("yituikuan".equals(action)) {
				order.setState(Constant.ORDER_CHENGGONGTUIHUO);
				os.update(order);
				response.sendRedirect(request.getContextPath()+"/adminOrder?method=findAllByState&state=4");
			}
			
		} catch (Exception e) {
		}
		return null;
	}
	
	/**
	 * 展示订单详情
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//0.设置编码
			response.setContentType("text/html;charset=utf-8");
			
			//1.获取oid
			String oid = request.getParameter("oid");
			
			//2.调用service 获取订单
			OrderService os = (OrderService) BeanFactory.getBean("OrderService");
			Order order = os.getById(oid);
			
			//3.获取订单的订单项列表 转成json 写回浏览器
			if(order != null){
				List<OrderItem> list = order.getItems();
				if(list != null && list.size()>0){
					response.getWriter().println(JsonUtil.list2json(list));
					
				/*	JsonConfig config = JsonUtil.configJson(new String[]{"order","pdate","pdesc","itemid"});
					response.getWriter().println(JSONArray.fromObject(list, config));*/
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 后台按照状态查询订单列表
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllByState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取state
			String state = request.getParameter("state");
			
			//2.调用service 获取不同的列表
			OrderService os = (OrderService) BeanFactory.getBean("OrderService");
			List<Order> list=os.findAllByState(state);
			
			//3.将list放入request域中,请求转发
			request.setAttribute("list", list);
			
		} catch (Exception e) {
		}
		return "/admin/order/list.jsp";
	}

}
