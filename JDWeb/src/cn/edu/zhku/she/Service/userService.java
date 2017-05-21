package cn.edu.zhku.she.Service;

import java.util.HashMap;
import java.util.Map;

import cn.edu.zhku.she.Dao.userDao;
import cn.edu.zhku.she.Model.User;
import cn.edu.zhku.she.Util.CookieUtil;


public class userService {
	private userDao dao = new userDao();	//  ���ݿ����
	//  ����ֻ������Ƿ����
	public boolean checkPhone(String phone)
	{
		if( dao.isUserPhoneExist(phone) != null )
			return false;
		return true;
	}
	//  ����Ա���Ƿ����
	public boolean checkUserName(String username)
	{
		if( dao.isUserNameExist(username) != null )
			return false;
		return true;
	}
	//  �����ݿ����һ�����ݲ���������
	public User toRegister(String[] params)
	{
		HashMap getUser = null;
		User user = null;
		getUser = (HashMap)dao.insertUserInfo(params);
		if( getUser != null )
		{
			user = new User();
			user.setUserid( Integer.parseInt(getUser.get("uid").toString()) );
			user.setUsername( String.valueOf(getUser.get("username")) );
			user.setImage( String.valueOf(getUser.get("image")) );
		}
		return user;
	}
	//  �Ƚ��û���������
	public User checkUserPad(String name,String psd)
	{
		HashMap getUser = null;
		User user = null;
		String params[] = {name,name};
		getUser = (HashMap)dao.selectUserInfo(params);
		if( getUser != null )
		{
			//  �Ƚ�����,���ƥ��
			if( psd.equals(String.valueOf(getUser.get("password"))) )
			{
				user = new User();
				user.setUserid( Integer.parseInt(getUser.get("uid").toString()) );
				if( getUser.get("name") != null )
				{
					user.setName(String.valueOf(getUser.get("name")));
				}
				else
				{
					user.setUsername( String.valueOf(getUser.get("username")) );
				}
				user.setImage( String.valueOf(getUser.get("image")) );
			}
		}
		return user;
	}
	//  ͨ��ID��ȡ�û����ﳵ�е���Ʒ��
	public int getUserShoppingCart(String id)
	{
		HashMap num = null;
		int Sum = 0;
		String params[] = {id};
		num = (HashMap)dao.selectUserSpCart(params);
		if( num != null )
		{
			Sum = Integer.parseInt(num.get("Sum").toString());
		}
		return Sum;
	}
	//  ͨ��ID��ȡ�û���Ϣ
	public User getUserInfo(String id)
	{
		HashMap data = null;
		User user = null;
		String params[] = {id};
		data = (HashMap)dao.selUInfoById(params);
		if( data != null )
		{
			user = new User();
			user.setImage(data.get("image").toString());
			if( data.get("name") != null )
				user.setName(data.get("name").toString());
			if( data.get("realname") != null )
				user.setRealname(data.get("realname").toString());
			user.setSex(Integer.parseInt(data.get("sex").toString()));
			if( data.get("brithday") != null )
				user.setBrithday(data.get("brithday").toString());
			if( data.get("phone") != null )
				user.setPhone(data.get("phone").toString());
			if( data.get("address") != null )
				user.setAddress(data.get("address").toString());
		}
		return user;
	}
	//  ͨ��ID�����û���Ϣ������ȡ����������
	public User saveUserInfo(String id,String[] params,int flag)
	{
		HashMap data = null;
		User user = null;
		data = (HashMap)dao.saveUInfo(id,params,flag);
		if( data != null )
		{
			user = new User();
			user.setImage(data.get("image").toString());
			if( data.get("name") != null )
				user.setName(data.get("name").toString());
			if( data.get("realname") != null )
				user.setRealname(data.get("realname").toString());
			user.setSex(Integer.parseInt(data.get("sex").toString()));
			if( data.get("brithday") != null )
				user.setBrithday(data.get("brithday").toString());
			if( data.get("phone") != null )
				user.setPhone(data.get("phone").toString());
			if( data.get("address") != null )
				user.setAddress(data.get("address").toString());
		}
		return user;
	}
}
