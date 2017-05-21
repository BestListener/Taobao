package cn.edu.zhku.she.Dao;

import java.util.Map;

import cn.edu.zhku.she.Util.DBUtil;

public class userDao {
	private DBUtil db = new DBUtil();
	//  查询手机号码是否存在
	public Map isUserPhoneExist(String phone)
	{
		Map user = null;
		String sql = "select * from user where phone=?";
		String[] params = {phone};
		user = db.getMap(sql, params);
		return user;
	}
	//  查询用户名是否存在
	public Map isUserNameExist(String username)
	{
		Map user = null;
		String sql = "select * from user where username=?";
		String[] params = {username};
		user = db.getMap(sql, params);
		return user;
	}
	//  插入一条用户数据
	public Map insertUserInfo(String[] params)
	{
		Map user = null;
		String sql = "insert into user(username,password,phone) value(?,?,?)";
		if( db.update(sql, params) == 1 )	//  插入成功
		{
			sql = "select * from user where username=?";
			String[] selparams = {params[0]};
			user = db.getMap(sql, selparams);
		}
		return user;
	}
	//  通过会员名或者手机号码查询用户数据
	public Map selectUserInfo(String[] params)
	{
		Map user = null;
		String sql = "select * from user where username=? or phone=?";
		user = db.getMap(sql, params);
		return user;
	}
	//  获取用户的购物车物品数
	public Map selectUserSpCart(String[] params)
	{
		Map num = null;
		String sql = "select count(*) as 'Sum' from shoppingcart where uid=?";
		num = db.getMap(sql, params);
		return num;
	}
	public Map selUInfoById(String[] params)
	{
		Map user = null;
		String sql = "select * from user where uid=?";
		user = db.getMap(sql, params);
		return user;
	}
	public Map saveUInfo(String id,String[] params,int flag)
	{
		Map user = null;
		String sql;
		if( flag == 0 )
			sql = "update user set phone=?,name=?,realname=?,sex=?,brithday=?,address=? where uid=?";
		else
			sql = "update user set phone=?,image=?,name=?,realname=?,sex=?,brithday=?,address=? where uid=?";
		if( db.update(sql, params) == 1 )	//  插入成功
		{
			sql = "select * from user where uid=?";
			String[] selparams = {id};
			user = db.getMap(sql, selparams);
		}
		return user;
	}
}
