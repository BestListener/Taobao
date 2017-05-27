package cn.edu.zhku.she.Dao;

import java.util.Map;

import cn.edu.zhku.she.Util.DBUtil;
import cn.edu.zhku.she.Util.PageBean;

public class adminDao {
	private DBUtil db = new DBUtil();
	@SuppressWarnings("rawtypes")
	//  根据用户名查找管理员
	public Map selectAdminByUserPsd(String params[])
	{
		Map data = null;
		String sql = "select * from admin where name=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  插入新的管理员记录
	public int insertNewManager(String params[])
	{
		int result = 0;
		String sql = "insert into admin(name,password) value(?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  获取用户总数
	@SuppressWarnings("rawtypes")
	public Map selectUserSum()
	{
		String sql = "select count(*) as 'sum' from user";
		String params[] = new String[0];
		Map sum = db.getMap(sql, params);
		return sum;
	}
	//  获取用户列表数据
	public PageBean selectUserListData(String sql,String params[],int curPage)
	{
		db.setPageSize(7);
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  更新用户状态
	public int updateUserState(String params[])
	{
		int result = 0;
		String sql = "update user set state=? where uid=?";
		result = db.update(sql, params);
		return result;
	}
	@SuppressWarnings("rawtypes")
	//  根据uid查找用户信息
	public Map selectUserById(String params[])
	{
		Map data = null;
		String sql = "select * from user where uid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  获取店铺列表数据
	public PageBean selectShopListData(String sql,String params[],int curPage)
	{
		db.setPageSize(7);
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  更新店铺状态
	public int updateShopState(String params[])
	{
		int result = 0;
		String sql = "update shop set shopstate=? where sid=?";
		result = db.update(sql, params);
		return result;
	}
	@SuppressWarnings("rawtypes")
	//  根据sid查找店铺信息
	public Map selectShopById(String params[])
	{
		Map data = null;
		String sql = "select * from shop,user where shop.uid=user.uid and sid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  获取店铺总数
	@SuppressWarnings("rawtypes")
	public Map selectShopSum()
	{
		String sql = "select count(*) as 'sum' from shop";
		String params[] = new String[0];
		Map sum = db.getMap(sql, params);
		return sum;
	}
}
