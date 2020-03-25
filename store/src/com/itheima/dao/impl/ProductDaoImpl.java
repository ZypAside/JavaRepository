package com.itheima.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
//import org.junit.Test;

import com.itheima.constant.Constant;
import com.itheima.dao.ProductDao;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;
import com.itheima.utils.DataSourceUtils;

public class ProductDaoImpl implements ProductDao {
/*
 **按照书名和作者名查询
 */

	public List<Product> findByBname(PageBean<Product> pb, String name) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pname like ? and pflag = ? order by pdate desc limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Product.class), "%"+name+"%",Constant.PRODUCT_IS_UP,pb.getStartIndex(),pb.getPageSize());
	}

	@Override
	/**
	 * 查询热门
	 */
	public List<Product> findHot() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where is_hot = ? and pflag = ? order by pdate desc limit 9";
		return qr.query(sql, new BeanListHandler<>(Product.class), Constant.PRODUCT_IS_HOT,Constant.PRODUCT_IS_UP);
	}

	@Override
	/**
	 * 查询最新
	 */
	public List<Product> findNew() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pflag = ? order by pdate desc limit 9";
		
		return qr.query(sql, new BeanListHandler<>(Product.class),Constant.PRODUCT_IS_UP);
		
	}

	@Override
	/**
	 * 查询单个商品
	 */
	public Product getById(String pid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pid = ? limit 1";
		return qr.query(sql, new BeanHandler<>(Product.class), pid);
		
	}
	

	@Override
	/**
	 * 查询当前页数据
	 */
	public List<Product> findByPage(PageBean<Product> pb, String cid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where cid = ? and pflag = ? order by pdate desc limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Product.class), cid,Constant.PRODUCT_IS_UP,pb.getStartIndex(),pb.getPageSize());
	}

	@Override
	/**
	 * 获取总记录数
	 */
	public int getTotalRecord(String cid) throws Exception {
		return ((Long)new QueryRunner(DataSourceUtils.getDataSource()).query("select count(*) from product where cid = ? and pflag = ?", new ScalarHandler(), cid,Constant.PRODUCT_IS_UP)).intValue();
	}

	

	@Override
	/**
	 * 保存商品
	 */
	public void save(Product p) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		/*
		 * `pid` varchar(32) NOT NULL,
			  `pname` varchar(50) DEFAULT NULL,
			  `market_price` double DEFAULT NULL,
			  
			  `shop_price` double DEFAULT NULL,
			  `pimage` varchar(200) DEFAULT NULL,
			  `pdate` date DEFAULT NULL,
			  
			  `is_hot` int(11) DEFAULT NULL,
			  `pdesc` varchar(255) DEFAULT NULL,
			  `pflag` int(11) DEFAULT NULL,
			  
			  `cid` varchar(32) DEFAULT NULL,
		 */
		String sql="insert into product values(?,?,?,?,?,?,?,?,?,?);";
		qr.update(sql, p.getPid(),p.getPname(),p.getMarket_price(),
				p.getShop_price(),p.getPimage(),p.getPdate(),
				p.getIs_hot(),p.getPdesc(),p.getPflag(),
				p.getCategory().getCid());
	}

	@Override
	public int getTotalRecordByBname(String name) throws Exception {
		return ((Long)new QueryRunner(DataSourceUtils.getDataSource()).query("select count(*) from product where pname like ? and pflag = ?", new ScalarHandler(),"%"+name+"%",Constant.PRODUCT_IS_UP)).intValue();
	}

	@Override
	public void update(Product p) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		/*
		 * `pid` varchar(32) NOT NULL,
			  `pname` varchar(50) DEFAULT NULL,
			  `market_price` double DEFAULT NULL,
			  
			  `shop_price` double DEFAULT NULL,
			  `pimage` varchar(200) DEFAULT NULL,
			  `pdate` date DEFAULT NULL,
			  
			  `is_hot` int(11) DEFAULT NULL,
			  `pdesc` varchar(255) DEFAULT NULL,
			  `pflag` int(11) DEFAULT NULL,
			  
			  `cid` varchar(32) DEFAULT NULL,
		 */
		String sql="update product set pname=?,market_price=?,shop_price=?,pimage=?,pdate=?,is_hot=?, pdesc=?,pflag=?,cid=? where pid=?;";
		qr.update(sql,p.getPname(),p.getMarket_price(),
				p.getShop_price(),p.getPimage(),p.getPdate(),
				p.getIs_hot(),p.getPdesc(),p.getPflag(),
				p.getCategory().getCid(),p.getPid());
	}
	@Override
	/**
	 * 后台展示所有商品
	 */
	public List<Product> findAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product order by pdate desc";
		return qr.query(sql, new BeanListHandler<>(Product.class));
	}
	/**
	 * 后台展已上架商品
	 */
	public List<Product> findAllUp() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pflag = ? order by pdate desc";
		return qr.query(sql, new BeanListHandler<>(Product.class), Constant.PRODUCT_IS_UP);
	}

	/**
	 * 后台展示已下架商品
	 */
	public List<Product> findAllDown() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pflag = ? order by pdate desc";
		return qr.query(sql, new BeanListHandler<>(Product.class), Constant.PRODUCT_IS_DOWN);
	}

	@Override
	public void delete(String pid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="delete from product where pid=?";
		qr.update(sql, pid);
	}
		

}
