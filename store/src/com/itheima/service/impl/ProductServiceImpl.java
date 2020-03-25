package com.itheima.service.impl;

import java.util.List;

import com.itheima.dao.CategoryDao;
import com.itheima.dao.OrderDao;
import com.itheima.dao.ProductDao;
import com.itheima.dao.impl.ProductDaoImpl;
import com.itheima.domain.OrderItem;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;
import com.itheima.service.ProductService;
import com.itheima.utils.BeanFactory;
import com.itheima.utils.DataSourceUtils;

public class ProductServiceImpl implements ProductService {
	/**
	 * 按照作者名和书名查询
	 */
	public PageBean<Product> findByBname(int pageNumber, int pageSize, String name) throws Exception{
		ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
		//1.创建pagebean
		PageBean<Product> pb = new PageBean<>(pageNumber, pageSize);
		
		//2.设置当前页数据
		List<Product> data = pDao.findByBname(pb,name);
		if (data==null) {
			return null;
		}
		pb.setData(data);
		System.out.println(data);
		
		//3.设置总记录数
		int totalRecord = pDao.getTotalRecordByBname(name);
		pb.setTotalRecord(totalRecord);
		System.out.println(totalRecord);
		return pb;
	}
	@Override
	/**
	 * 查询热门商品
	 */
	public List<Product> findHot() throws Exception {
		ProductDao pd= (ProductDao) BeanFactory.getBean("ProductDao");
		return pd.findHot();
	}

	@Override
	/**
	 * 查询最新商品
	 */
	public List<Product> findNew() throws Exception {
		//ProductDao pd= (ProductDao) BeanFactory.getBean("ProductDao");
		ProductDao pd= (ProductDao) BeanFactory.getBean("ProductDao");
		return pd.findNew();
	}

	@Override
	/**
	 * 单个商品详情
	 */
	public Product getById(String pid) throws Exception {
		ProductDao pd=(ProductDao) BeanFactory.getBean("ProductDao");
		
		return pd.getById(pid);
	}

	@Override
	/**
	 * 分页展示分类商品
	 */
	public PageBean<Product> findByPage(int pageNumber, int pageSize, String cid) throws Exception {
		ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
		//1.创建pagebean
		PageBean<Product> pb = new PageBean<>(pageNumber, pageSize);
		
		//2.设置当前页数据
		List<Product> data = pDao.findByPage(pb,cid);
		pb.setData(data);
		if (data==null) {
			return null;
		}
		//3.设置总记录数
		int totalRecord = pDao.getTotalRecord(cid);
		pb.setTotalRecord(totalRecord);
		
		
		return pb;
	}

	

	@Override
	/**
	 * 保存商品
	 */
	public void save(Product p) throws Exception {
		ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
		pDao.save(p);
		
	}
	@Override
	public void update(Product p) throws Exception {
		ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
		pDao.update(p);
		
	}
	@Override
	/**
	 * 后台展示所有商品
	 */
	public List<Product> findAll() throws Exception {
		ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
		return pDao.findAll();
	}
	/**
	 * 后台展示已上架商品
	 */
	@Override
	public List<Product> findAllUp() throws Exception {
		ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
		return pDao.findAllUp();
	}
	/**
	 * 后台展示已下架商品
	 */
	@Override
	public List<Product> findAllDowm() throws Exception {
		ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
		return pDao.findAllDown();
	}
	@Override
	public void delete(String pid) throws Exception {
		try {
			//获取dao
			ProductDao pDao= (ProductDao) BeanFactory.getBean("ProductDao");
			//1.开启事务
			DataSourceUtils.startTransaction();
			
			Product product=pDao.getById(pid);
			pDao.delete(pid);
			
			//4.事务控制
			DataSourceUtils.commitAndClose();
		} catch (Exception e) {
			e.printStackTrace();
			DataSourceUtils.rollbackAndClose();
			throw e;
		}
	}
		
		 
	}

