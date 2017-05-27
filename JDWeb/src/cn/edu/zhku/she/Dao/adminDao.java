package cn.edu.zhku.she.Dao;

import java.util.Map;

import cn.edu.zhku.she.Util.DBUtil;
import cn.edu.zhku.she.Util.PageBean;

public class adminDao {
	private DBUtil db = new DBUtil();
	@SuppressWarnings("rawtypes")
	//  �����û������ҹ���Ա
	public Map selectAdminByUserPsd(String params[])
	{
		Map data = null;
		String sql = "select * from admin where name=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  �����µĹ���Ա��¼
	public int insertNewManager(String params[])
	{
		int result = 0;
		String sql = "insert into admin(name,password) value(?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  ��ȡ�û�����
	@SuppressWarnings("rawtypes")
	public Map selectUserSum()
	{
		String sql = "select count(*) as 'sum' from user";
		String params[] = new String[0];
		Map sum = db.getMap(sql, params);
		return sum;
	}
	//  ��ȡ�û��б�����
	public PageBean selectUserListData(String sql,String params[],int curPage)
	{
		db.setPageSize(7);
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  �����û�״̬
	public int updateUserState(String params[])
	{
		int result = 0;
		String sql = "update user set state=? where uid=?";
		result = db.update(sql, params);
		return result;
	}
	@SuppressWarnings("rawtypes")
	//  ����uid�����û���Ϣ
	public Map selectUserById(String params[])
	{
		Map data = null;
		String sql = "select * from user where uid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  ��ȡ�����б�����
	public PageBean selectShopListData(String sql,String params[],int curPage)
	{
		db.setPageSize(7);
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  ���µ���״̬
	public int updateShopState(String params[])
	{
		int result = 0;
		String sql = "update shop set shopstate=? where sid=?";
		result = db.update(sql, params);
		return result;
	}
	@SuppressWarnings("rawtypes")
	//  ����sid���ҵ�����Ϣ
	public Map selectShopById(String params[])
	{
		Map data = null;
		String sql = "select * from shop,user where shop.uid=user.uid and sid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  ��ȡ��������
	@SuppressWarnings("rawtypes")
	public Map selectShopSum()
	{
		String sql = "select count(*) as 'sum' from shop";
		String params[] = new String[0];
		Map sum = db.getMap(sql, params);
		return sum;
	}
}
