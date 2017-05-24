package cn.edu.zhku.she.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.zhku.she.Dao.userDao;
import cn.edu.zhku.she.Model.Book;
import cn.edu.zhku.she.Model.Cosmetics;
import cn.edu.zhku.she.Model.Product;
import cn.edu.zhku.she.Model.Shop;
import cn.edu.zhku.she.Model.User;
import cn.edu.zhku.she.Model.Watch;
import cn.edu.zhku.she.Util.PageBean;


public class userService {
	private userDao dao = new userDao();	//  数据库操作
	//  检查手机号码是否存在
	public boolean checkPhone(String phone)
	{
		if( dao.isUserPhoneExist(phone) != null )
			return false;
		return true;
	}
	//  检查会员名是否存在
	public boolean checkUserName(String username)
	{
		if( dao.isUserNameExist(username) != null )
			return false;
		return true;
	}
	//  向数据库插入一条数据并返回数据
	@SuppressWarnings("rawtypes")
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
	//  比较用户名与密码
	@SuppressWarnings("rawtypes")
	public User checkUserPad(String name,String psd)
	{
		HashMap getUser = null;
		User user = null;
		String params[] = {name,name};
		getUser = (HashMap)dao.selectUserInfo(params);
		if( getUser != null )
		{
			//  比较密码,如果匹配
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
	//  通过ID获取用户购物车中的物品数
	@SuppressWarnings("rawtypes")
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
	//  通过ID获取用户信息
	@SuppressWarnings("rawtypes")
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
	//  通过ID保存用户信息，并获取保存后的数据
	@SuppressWarnings("rawtypes")
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
	//  修改用户密码
	public boolean alterUserPsd(String[] params)
	{
		boolean flag = false;
		if( dao.updateUserPsd(params) == 1 )
		{
			flag = true;
		}
		return flag;
	}
	//  获取物品基本信息
	@SuppressWarnings("rawtypes")
	public Product getProductInfo(String[] params)
	{
		HashMap data = null;
		Product product = null;
		data = (HashMap)dao.getGoodsInfo(params);
		if( data != null )
		{
			product = new Product();
			product.setPid(Integer.parseInt(data.get("pid").toString()));
			product.setSid(Integer.parseInt(data.get("sid").toString()));
			product.setBigImg(data.get("bigImg").toString());
			product.setName(data.get("name").toString());
			product.setPrice(Float.parseFloat(data.get("price").toString()));
			product.setSmallImg(data.get("smallImg").toString());
			product.setInfoImg(data.get("infoImg").toString());
			product.setSaveNum(Integer.parseInt(data.get("saveNum").toString()));
			product.setSalesAmount(Integer.parseInt(data.get("salesAmount").toString()));
			product.setGoodsState(data.get("goodsState").toString());
			product.setFirstClass(data.get("firstClass").toString());
			product.setSecondClass(data.get("secondClass").toString());
		}
		return product;
	}
	//   获取店家信息
	@SuppressWarnings("rawtypes")
	public Shop getShopInfo(String[] params)
	{
		HashMap data = null;
		Shop shop = null;
		data = (HashMap)dao.getShopData(params);
		if( data != null )
		{
			shop = new Shop();
			shop.setSid(Integer.parseInt(data.get("sid").toString()));
			shop.setUid(Integer.parseInt(data.get("uid").toString()));
			shop.setShopname(data.get("shopname").toString());
			shop.setOwnername(data.get("ownername").toString());
			shop.setPhoneNumber(data.get("phoneNumber").toString());
			shop.setShopstate(data.get("shopstate").toString());
		}
		return shop;
	}
	//  获取物品详细信息
	@SuppressWarnings("rawtypes")
	public Product getGoodsDetailData(String firstClass,String[] params)
	{
		Product product = null;
		List datas = null;
		datas = dao.selGoodsDetail(params);
		if( datas != null )
		{
			if( firstClass.equals("书") )
			{
				Book book = new Book();
				Map data[] = new Map[datas.size()];
				for(int i=0;i < datas.size(); i++)
				{
					data[i] = new HashMap();
					data[i] = (Map)datas.get(i);
				}
				book.setBookName(data[0].get("val").toString());
				book.setPublishName(data[1].get("val").toString());
				book.setPublishDate(data[2].get("val").toString());
				book.setAuthor(data[3].get("val").toString());
				book.setBookPage(data[4].get("val").toString());
				product = book;
			}
			else if( firstClass.equals("美妆") )
			{
				Cosmetics cos = new Cosmetics();
				Map data[] = new Map[datas.size()];
				for(int i=0;i < datas.size(); i++)
				{
					data[i] = new HashMap();
					data[i] = (Map)datas.get(i);
				}
				cos.setBrank(data[0].get("val").toString());
				cos.setCosSize(data[1].get("val").toString());
				cos.setCosMonth(data[2].get("val").toString());
				cos.setFitSkin(data[3].get("val").toString());
				cos.setCosEffect(data[4].get("val").toString());
				cos.setPeriod(data[5].get("val").toString());
				cos.setProAddress(data[6].get("val").toString());
				product = cos;
			}
			else if( firstClass.equals("手表") )
			{
				Watch watch = new Watch();
				Map data[] = new Map[datas.size()];
				for(int i=0;i < datas.size(); i++)
				{
					data[i] = new HashMap();
					data[i] = (Map)datas.get(i);
				}
				watch.setBrank(data[0].get("val").toString());
				watch.setWatchNo(data[1].get("val").toString());
				watch.setWatchApp(data[2].get("val").toString());
				watch.setWatchMove(data[3].get("val").toString());
				watch.setWatchStyle(data[4].get("val").toString());
				watch.setWatchProduce(data[5].get("val").toString());
				watch.setWatchDisplay(data[6].get("val").toString());
				watch.setWatchStrap(data[7].get("val").toString());
				product = watch;
			}
		}
		return product;
	}
	//  获取商店产品
	@SuppressWarnings("rawtypes")
	public List getShopProducts(String params[])
	{
		List products = null;
		products = dao.selShopProducts(params);
		return products;
	}
	//  添加加入购物车的产品数据
	@SuppressWarnings("rawtypes")
	public int addProductToSC(String uid,String params[])
	{
		int num = 0;
		if( dao.insertGoodsData(params) != 0 )
		{
			String uparams[] = {uid};
			HashMap data = null;
			data = (HashMap)dao.selShoppingCartAmount(uparams);
			if( data != null )
				num = Integer.parseInt(data.get("Sum").toString());
		}
		return num;
	}
	//  判断用户购物车中是否存在该物品,并判断购物数是否会超出99
	@SuppressWarnings("rawtypes")
	public boolean isProductExist(String amount,String params[])
	{
		boolean flag = false;
		HashMap data = null;
		data = (HashMap)dao.selSCProduct(params);
		if( data != null )
		{
			flag = true;
		}
		return flag;
	}
	//   更新用户购物车中的物品数量
	public int updateProductNum(String params[],int flag)
	{
		int result = 0;
		if( flag == 0 )
		{
			String sql = "update shoppingcart set wBuyNum=wBuyNum+?,payAmount=payAmount+? where uid=? and pid=?";
			result = dao.updateSCProductNum(sql,params);
		}
		else
		{
			String sql = "update shoppingcart set wBuyNum=?,payAmount=? where uid=? and pid=?";
			result = dao.updateSCProductNum(sql,params);
		}
		return result;
	}
	//  获取用户购物车中的物品数量
	@SuppressWarnings("rawtypes")
	public String getProductNum(String params[])
	{
		String num = null;
		HashMap data = null;
		data = (HashMap)dao.selSCProduct(params);
		if( data != null )
		{
			num = data.get("wBuyNum").toString();
		}
		return num;
	}
	//  添加订单信息
	public boolean addOrderUpdateAmount(String params[])
	{
		boolean flag = false;
		if( dao.insertUserOrderInfo(params) != 0 && dao.insertShopOrderInfo(params) != 0 )
		{
			flag = true;
		}
		return flag;
	}
	//  获取用户的购物车信息
	@SuppressWarnings("rawtypes")
	public List getUserShoppingCartInfo(String params[])
	{
		List datas = null;
		datas = dao.selOrderData(params);
		return datas;
	}
	//  更新用户购物车数量
	public boolean updateUserSCInfo(String params[])
	{
		boolean flag = false;
		if( dao.updateShoppingCartNum(params) != 0 )
			flag = true;
		return flag;
	}
	//  删除用户购物车中的产品
	@SuppressWarnings("rawtypes")
	public String deleteUSCProduct(String uid,String params[])
	{
		String sum = null;
		if( dao.deleteShoppingCartProduct(params) != 0 )
		{
			String id[] = {uid};
			HashMap data = null;
			data = (HashMap)dao.selShoppingCartAmount(id);
			sum = data.get("Sum").toString();
		}
		return sum;
	}
	//  处理用户在购物车页面提交的请求
	@SuppressWarnings("rawtypes")
	public String settleMentUserOrder(List datas,String uid,String date)
	{
		String sum = null;
		String insertUser = "insert into user_order(uid,pid,sid,buyNum,payAmount,odate) value(?,?,?,?,?,?)";
		String insertShop = "insert into shop_order(uid,pid,sid,buyNum,payAmount,odate) value(?,?,?,?,?,?)";
		//  如果用户订单和商店订单插入成功
		if( dao.insertUserShopOrder(insertUser, datas, uid, date) && dao.insertUserShopOrder(insertShop, datas, uid, date) )
		{
			//  删除用户购物车中相应的产品
			String deleteSql = "delete from shoppingcart where scid=?";
			dao.deleteUserSCProduct(deleteSql, datas);
			//  获取用户的购物车产品数
			Map data = new HashMap();
			String params[] = {uid};
			data = (HashMap)dao.selShoppingCartAmount(params);
			sum = data.get("Sum").toString();
		}
		return sum;
	}
	//  获取用户的订单信息
	public PageBean getUserOrderInfo(String params[],int curpage)
	{
		PageBean datas = null;
		datas = dao.selectUserOrder(params,curpage);
		return datas;
	}
	//  处理用户确认收获处理
	public boolean dealUserConfirmReceipt(String params[],String pid,String num)
	{
		boolean flag = false;
		String userSql = "update user_order set ostate=? where oid=?";
		String shopSql = "update shop_order set ostate=? where oid=?";
		//  更新用户和店铺的订单状态
		if( dao.updateOrderState(userSql, params) != 0 && dao.updateOrderState(shopSql, params) != 0 )
		{
			//  更新产品的销售额
			String pparams[] = {num,pid};
			if( dao.updateProductAmount(pparams) != 0 )
				flag = true;
		}
		return flag;
	}
	//  删除用户订单
	public boolean deleteUserOrder(String params[])
	{
		boolean flag = false;
		if( dao.deleteUserOrderInfo(params) != 0 )
			flag = true;
		return flag;
	}
	//  判断用户是否完善了信息
	@SuppressWarnings("rawtypes")
	public boolean isUserInfoNull(String uid)
	{
		boolean flag = false;
		HashMap data = null;
		String params[] = {uid};
		data = (HashMap)dao.selUInfoById(params);
		if( data != null )
		{
			if( data.get("address") != null )
				flag = true;
		}
		return flag;
	}
	//  获取主页全网热卖前十件物品
	@SuppressWarnings("rawtypes")
	public List getHotSellingProducts()
	{
		List datas = null;
		String state = "正在验证";
		String params[] = {state};
		String sql = "select * from product where sid in(select sid from shop where shopstate=?) order by salesAmount desc limit 10";
		datas = dao.selectHotSellingData(sql,params);
		return datas;
	}
}
