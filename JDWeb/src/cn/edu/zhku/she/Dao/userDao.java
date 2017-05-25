package cn.edu.zhku.she.Dao;

import java.util.List;
import java.util.Map;

import cn.edu.zhku.she.Util.DBUtil;
import cn.edu.zhku.she.Util.PageBean;

@SuppressWarnings("rawtypes")
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
		if( db.update(sql, params) == 1 )	//  ����ɹ�
		{
			sql = "select * from user where uid=?";
			String[] selparams = {id};
			user = db.getMap(sql, selparams);
		}
		return user;
	}
	//  �޸��û�����
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
	//  ��ȡ��Ʒ������Ϣ
	public Map getGoodsInfo(String[] params)
	{
		Map data = null;
		String sql = "select * from product where pid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  ��ȡ������Ϣ
	public Map getShopData(String[] params)
	{
		Map data = null;
		String sql = "select * from shop where sid=?";
		data = db.getMap(sql,params);
		return data;
	}
	//  ��ȡ��Ʒ��ϸ��Ϣ
	public List selGoodsDetail(String[] params)
	{
		List datas = null;
		String sql = "select * from p_detail_info where pid=?";
		datas = db.getList(sql, params);
		return datas;
	}
	//  ��ȡ�̵��Ʒ����
	public List selShopProducts(String[] params)
	{
		List datas = null;
		String sql = "select * from product where sid=? and pid<>?";
		datas = db.getList(sql, params);
		return datas;
	}
	//  ����ӽ����ﳵ�Ĳ�Ʒ����
	public int insertGoodsData(String[] params)
	{
		int result = 0;
		String sql = "insert into shoppingcart(uid,pid,sid,wBuyNum,payAmount) value(?,?,?,?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  �����û����ﳵ�Ĳ�Ʒ����
	public Map selShoppingCartAmount(String[] params)
	{
		Map data = null;
		String sql = "select count(*) as 'Sum' from shoppingcart where uid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  �����û����ﳵ��Ʒ
	public Map selSCProduct(String[] params)
	{
		Map data = null;
		String sql = "select * from shoppingcart where uid=? and pid=?";
		data = db.getMap(sql, params);
		return data;
	}
	//  �����û����ﳵ��Ʒ
	public int updateSCProductNum(String sql,String[] params)
	{
		int result = 0;
		result = db.update(sql, params);
		return result;
	}
	//  ��ӵ��̶�����Ϣ
	public int insertShopOrderInfo(String[] params)
	{
		int result = 0;
		String sql = "insert into shop_order(uid,pid,sid,buyNum,payAmount,odate) value(?,?,?,?,?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  ����û�������Ϣ
	public int insertUserOrderInfo(String[] params)
	{
		int result = 0;
		String sql = "insert into user_order(uid,pid,sid,buyNum,payAmount,odate) value(?,?,?,?,?,?)";
		result = db.update(sql, params);
		return result;
	}
	//  ���²�Ʒ���۶�
	public int updateProductAmount(String[] params)
	{
		int result = 0;
		String sql = "update product set salesAmount=salesAmount+? where pid=?";
		result = db.update(sql, params);
		return result;
	}
	//  ��ȡ�û�������Ϣ
	public List selOrderData(String[] params)
	{
		List datas = null;
		String sql = "select scid,shoppingcart.uid,shoppingcart.pid,shoppingcart.sid,bigImg,name,shopname,price,wBuyNum,payAmount" +
				" from shoppingcart,product,shop where shoppingcart.pid=product.pid and shoppingcart.sid=shop.sid " +
				"and shoppingcart.uid=?";
		datas = db.getList(sql, params);
		return datas;
	}
	//  �����û����ﳵ����
	public int updateShoppingCartNum(String[] params)
	{
		int result = 0;
		String sql = "update shoppingcart set wBuyNum=?,payAmount=? where scid=?";
		result = db.update(sql, params);
		return result;
	}
	//  ɾ���û����ﳵ�еĲ�Ʒ
	public int deleteShoppingCartProduct(String[] params)
	{
		int result = 0;
		String sql = "delete from shoppingcart where scid=?";
		result = db.update(sql, params);
		return result;
	}
	//  �����û�/�̵궩����Ϣ
	public boolean insertUserShopOrder(String sql,List datas,String uid,String date)
	{
		boolean flag = false;
		if( db.insertByBatch(sql, datas, uid, date) != null )
			flag = true;
		return flag;
	}
	//  �������²�Ʒ���۶�
	public boolean updateProductAmount(String sql,List datas)
	{
		boolean flag = false;
		if( db.updateByBatch(sql, datas) != null )
			flag = true;
		return flag;
	}
	//  ����ɾ�����ﳵ��Ʒ
	public boolean deleteUserSCProduct(String sql,List datas)
	{
		boolean flag = false;
		if( db.deleteByBatch(sql, datas) != null )
			flag = true;
		return flag;
	}
	//  ��ȡ�û�������Ϣ
	public PageBean selectUserOrder(String params[],int curPage)
	{
		db.setPageSize(7);
		String sql = "select * from user_order,product where user_order.pid=product.pid and uid=?";
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  ���¶���״̬
	public int updateOrderState(String sql,String params[])
	{
		int result = 0;
		result = db.update(sql, params);
		return result;
	}
	//  ɾ���û�������Ϣ
	public int deleteUserOrderInfo(String params[])
	{
		int result = 0;
		String sql = "delete from user_order where oid=?";
		result = db.update(sql, params);
		return result;
	}
	//  ��ȡ��վ���۶�����ǰʮ�Ĳ�Ʒ
	public List selectHotSellingData(String sql,String params[])
	{
		List datas = null;
		datas = db.getList(sql, params);
		return datas;
	}
	//  ��ȡ����ҳ��Ʒ�б�
	public PageBean selectProductListData(String sql,String params[],int curPage)
	{
		db.setPageSize(20);	
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
}
