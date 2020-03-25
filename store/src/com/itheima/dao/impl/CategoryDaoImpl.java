package com.itheima.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.itheima.dao.CategoryDao;
import com.itheima.domain.Category;
import com.itheima.utils.DataSourceUtils;

public class CategoryDaoImpl implements CategoryDao {

	@Override
	/**
	 * 查询所有分类
	 */
	public List<Category> findAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from category";
		return qr.query(sql, new BeanListHandler<>(Category.class));
	}

	@Override
	/**
	 * 添加分类
	 */
	public void save(Category c) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into category values (?,?);";
		qr.update(sql, c.getCid(),c.getCname());
	}

	@Override
	public void update(Category c) throws SQLException {
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update category set cname=? where cid=?";
        qr.update(sql,c.getCname(),c.getCid());
		
	}

	@Override
	public void delete(String cid) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="delete from category where cid=?";
        qr.update(sql,cid);
		
	}

}
