package cn.edu.zhku.she.Dao;

import java.util.Map;

import cn.edu.zhku.she.Util.DBUtil;

public class userDao {
	private DBUtil db = new DBUtil();
	//  ��ѯ�ֻ������Ƿ����
	public Map isUserPhoneExist(String phone)
	{
		Map user = null;
		String sql = "select * from user where phone=?";
		String[] params = {phone};
		user = db.getMap(sql, params);
		return user;
	}
	//  ��ѯ�û����Ƿ����
	public Map isUserNameExist(String username)
	{
		Map user = null;
		String sql = "select * from user where username=?";
		String[] params = {username};
		user = db.getMap(sql, params);
		return user;
	}
	//  ����һ���û�����
	public Map insertUserInfo(String[] params)
	{
		Map user = null;
		String sql = "insert into user(username,password,phone) value(?,?,?)";
		if( db.update(sql, params) == 1 )	//  ����ɹ�
		{
			sql = "select * from user where username=?";
			String[] selparams = {params[0]};
			user = db.getMap(sql, selparams);
		}
		return user;
	}
	//  ͨ����Ա�������ֻ������ѯ�û�����
	public Map selectUserInfo(String[] params)
	{
		Map user = null;
		String sql = "select * from user where username=? or phone=?";
		user = db.getMap(sql, params);
		return user;
	}
	//  ��ȡ�û��Ĺ��ﳵ��Ʒ��
	public Map selectUserSpCart(String[] params)
	{
		Map num = null;
		String sql = "select count(*) as 'Sum' from shoppingcart where uid=?";
		num = db.getMap(sql, params);
		return num;
	}
}
