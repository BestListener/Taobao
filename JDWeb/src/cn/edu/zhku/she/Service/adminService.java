package cn.edu.zhku.she.Service;

import java.util.Map;

import cn.edu.zhku.she.Dao.adminDao;
import cn.edu.zhku.she.Util.PageBean;

public class adminService {
	private adminDao dao = new adminDao();	//  数据库操作
	@SuppressWarnings("rawtypes")
	//  检查用户名密码
	public boolean checkUserNamePsd(String username,String psd)
	{
		boolean flag = false;
		Map data = null;
		String params[] = {username};
		data = dao.selectAdminByUserPsd(params);
		if( data != null )
		{
			if( psd.equals(data.get("password").toString()) )
				flag = true;
		}
		return flag;
	}
	//  添加管理员
	public boolean toAddManager(String username,String psd)
	{
		boolean flag = false;
		String params[] = {username,psd};
		if( dao.insertNewManager(params) != 0 )
		{
			flag = true;
		}
		return flag;
	}
	//  判断管理员是否已经存在
	@SuppressWarnings("rawtypes")
	public boolean isManagerExist(String username)
	{
		boolean flag = false;
		String params[] = {username};
		Map data = null;
		data = dao.selectAdminByUserPsd(params);
		if( data == null )
			flag = true;
		return flag;
	}
	//  获取用户总数
	@SuppressWarnings("rawtypes")
	public String getUserSum()
	{
		String sum = "";
		Map data = dao.selectUserSum();
		sum = data.get("sum").toString();
		return sum;
	}
	//  获取用户列表
	public PageBean getUserList(String state,String search,int curpage)
	{
		PageBean users = null;
		String sql = "";
		String params[];
		if( !search.equals("") && search.length() > 0 )
		{
			sql = "select * from user where state=? and (username like ? or phone like ?)";
			params = new String[]{state,"%"+search+"%","%"+search+"%"};	
		}
		else
		{
			sql = "select * from user where state=?";
			params = new String[]{state};	
		}
		users = dao.selectUserListData(sql, params, curpage);
		return users;
	}
	//  更新用户状态
	public boolean updateUserState(String params[])
	{
		if( dao.updateUserState(params) != 0 )
			return true;
		return false;
	}
	//  获取用户个人信息
	@SuppressWarnings("rawtypes")
	public Map getUserInfo(String uid)
	{
		Map datas = null;
		String params[] = {uid};
		datas = dao.selectUserById(params);
		return datas;
	}
	//  获取店铺列表
	public PageBean getShopList(String state,String search,int curpage)
	{
		PageBean shops = null;
		String sql = "";
		String params[];
		if( !search.equals("") && search.length() > 0 )
		{
			sql = "select * from shop,user where shop.uid=user.uid and shopstate=? and (shopname like ? or ownername like ? or phoneNumber like ?)";
			params = new String[]{state,"%"+search+"%","%"+search+"%","%"+search+"%"};	
		}
		else
		{
			sql = "select * from shop,user where shop.uid=user.uid and shopstate=?";
			params = new String[]{state};	
		}
		shops = dao.selectUserListData(sql, params, curpage);
		return shops;
	}
	//  获取店铺总数
	@SuppressWarnings("rawtypes")
	public String getShopSum()
	{
		String sum = "";
		Map data = dao.selectShopSum();
		sum = data.get("sum").toString();
		return sum;
	}
	//  更新店铺状态
	public boolean updateShopState(String params[])
	{
		if( dao.updateShopState(params) != 0 )
			return true;
		return false;
	}
	//  获取个体店铺信息
	@SuppressWarnings("rawtypes")
	public Map getShopInfo(String sid)
	{
		Map datas = null;
		String params[] = {sid};
		datas = dao.selectShopById(params);
		return datas;
	}
}
