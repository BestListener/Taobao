package cn.edu.zhku.she.Dao;

import java.util.List;
import java.util.Map;

import cn.edu.zhku.she.Util.DBUtil;
import cn.edu.zhku.she.Util.PageBean;

@SuppressWarnings("rawtypes")
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
	//  修改用户密码
	public int updateUserPsd(String[] params)
	{
		int result = 0;
		String sql = "update user set password=? where phone=?";
		if( db.update(sql, params) == 1 )
		{
			result = 1;
		}
		return result;
	}
	//  获取物品基本信息
	public Map getGoodsInfo(String[] params)
	{
		Map data = null;
		String sql = "select * from product where pid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  获取店铺信息
	public Map getShopData(String[] params)
	{
		Map data = null;
		String sql = "select * from shop where sid=?";
		data = db.getMap(sql,params);
		return data;
	}
	//  获取物品详细信息
	public List selGoodsDetail(String[] params)
	{
		List datas = null;
		String sql = "select * from p_detail_info where pid=?";
		datas = db.getList(sql, params);
		return datas;
	}
	//  获取商店产品数据
	public List selShopProducts(String[] params)
	{
		List datas = null;
		String sql = "select * from product where sid=? and pid<>?";
		datas = db.getList(sql, params);
		return datas;
	}
	//  插入加进购物车的产品数据
	public int insertGoodsData(String[] params)
	{
		int result = 0;
		String sql = "insert into shoppingcart(uid,pid,sid,wBuyNum,payAmount) value(?,?,?,?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  查找用户购物车的产品总数
	public Map selShoppingCartAmount(String[] params)
	{
		Map data = null;
		String sql = "select count(*) as 'Sum' from shoppingcart where uid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  查找用户购物车物品
	public Map selSCProduct(String[] params)
	{
		Map data = null;
		String sql = "select * from shoppingcart where uid=? and pid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  更新用户购物车物品
	public int updateSCProductNum(String sql,String[] params)
	{
		int result = 0;
		result = db.update(sql, params);
		return result;
	}
	//  添加店铺订单信息
	public int insertShopOrderInfo(String[] params)
	{
		int result = 0;
		String sql = "insert into shop_order(uid,pid,sid,buyNum,payAmount,odate) value(?,?,?,?,?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  添加用户订单信息
	public int insertUserOrderInfo(String[] params)
	{
		int result = 0;
		String sql = "insert into user_order(uid,pid,sid,buyNum,payAmount,odate) value(?,?,?,?,?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  更新产品销售额
	public int updateProductAmount(String[] params)
	{
		int result = 0;
		String sql = "update product set salesAmount=salesAmount+? where pid=?";
		result = db.update(sql, params);
		return result;
	}
	//  获取用户订单信息
	public List selOrderData(String[] params)
	{
		List datas = null;
		String sql = "select scid,shoppingcart.uid,shoppingcart.pid,shoppingcart.sid,bigImg,name,shopname,price,wBuyNum,payAmount" +
				" from shoppingcart,product,shop where shoppingcart.pid=product.pid and shoppingcart.sid=shop.sid " +
				"and shoppingcart.uid=?";
		datas = db.getList(sql, params);
		return datas;
	}
	//  更新用户购物车数量
	public int updateShoppingCartNum(String[] params)
	{
		int result = 0;
		String sql = "update shoppingcart set wBuyNum=?,payAmount=? where scid=?";
		result = db.update(sql, params);
		return result;
	}
	//  删除用户购物车中的产品
	public int deleteShoppingCartProduct(String[] params)
	{
		int result = 0;
		String sql = "delete from shoppingcart where scid=?";
		result = db.update(sql, params);
		return result;
	}
	//  插入用户/商店订单信息
	public boolean insertUserShopOrder(String sql,List datas,String uid,String date)
	{
		boolean flag = false;
		if( db.insertByBatch(sql, datas, uid, date) != null )
			flag = true;
		return flag;
	}
	//  批量更新产品销售额
	public boolean updateProductAmount(String sql,List datas)
	{
		boolean flag = false;
		if( db.updateByBatch(sql, datas) != null )
			flag = true;
		return flag;
	}
	//  批量删除购物车产品
	public boolean deleteUserSCProduct(String sql,List datas)
	{
		boolean flag = false;
		if( db.deleteByBatch(sql, datas) != null )
			flag = true;
		return flag;
	}
	//  获取用户订单信息
	public PageBean selectUserOrder(String params[],int curPage)
	{
		db.setPageSize(7);
		String sql = "select * from user_order,product where user_order.pid=product.pid and uid=?";
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  更新订单状态
	public int updateOrderState(String sql,String params[])
	{
		int result = 0;
		result = db.update(sql, params);
		return result;
	}
	//  删除用户订单信息
	public int deleteUserOrderInfo(String params[])
	{
		int result = 0;
		String sql = "delete from user_order where oid=?";
		result = db.update(sql, params);
		return result;
	}
	//  获取网站销售额排名前十的产品
	public List selectHotSellingData(String sql,String params[])
	{
		List datas = null;
		datas = db.getList(sql, params);
		return datas;
	}
	//  获取主题页产品列表
	public PageBean selectProductListData(String sql,String params[],int curPage)
	{
		db.setPageSize(20);	
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
}
