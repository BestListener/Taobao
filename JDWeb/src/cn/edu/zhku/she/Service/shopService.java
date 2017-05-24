package cn.edu.zhku.she.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.zhku.she.Dao.shopDao;
import cn.edu.zhku.she.Model.Book;
import cn.edu.zhku.she.Model.Cosmetics;
import cn.edu.zhku.she.Model.Product;
import cn.edu.zhku.she.Model.Shop;
import cn.edu.zhku.she.Model.Watch;
import cn.edu.zhku.she.Util.PageBean;

@SuppressWarnings("rawtypes")
public class shopService {
	private shopDao dao = new shopDao();	//  ���ݿ����
	//  ͨ���û�id��ѯ�̵�
	public Shop isShopExist(String uid)
	{
		HashMap data = null;
		Shop shop = null;
		String params[] = {uid};
		data = (HashMap)dao.selShopInfoByid(params);
		if( data != null )
		{
			shop = new Shop();
			shop.setSid(Integer.parseInt(data.get("sid").toString()));
			shop.setUid(Integer.parseInt(data.get("uid").toString()));
			shop.setShopname(data.get("shopname").toString());
			shop.setOwnername(data.get("ownername").toString());
			shop.setPhoneNumber(data.get("phoneNumber").toString());
			shop.setIdentifyImg(data.get("identifyImg").toString());
			shop.setShopstate(data.get("shopstate").toString());
		}
		return shop;
	}
	//  �����̵�
	public Shop addShopInfo(String id,String[] params)
	{
		HashMap data = null;
		Shop shop = null;
		data = (HashMap)dao.insertShopInfo(id,params);
		if( data != null )
		{
			shop = new Shop();
			shop.setSid(Integer.parseInt(data.get("sid").toString()));
			shop.setUid(Integer.parseInt(data.get("uid").toString()));
			shop.setShopname(data.get("shopname").toString());
			shop.setOwnername(data.get("ownername").toString());
			shop.setPhoneNumber(data.get("phoneNumber").toString());
			shop.setIdentifyImg(data.get("identifyImg").toString());
			shop.setShopstate(data.get("shopstate").toString());
		}
		return shop;
	}
	//  �����̵���Ϣ
	public Shop updateShopInfo(String id,String[] params)
	{
		HashMap data = null;
		Shop shop = null;
		data = (HashMap)dao.updateShopInfoById(id,params);
		if( data != null )
		{
			shop = new Shop();
			shop.setSid(Integer.parseInt(data.get("sid").toString()));
			shop.setUid(Integer.parseInt(data.get("uid").toString()));
			shop.setShopname(data.get("shopname").toString());
			shop.setOwnername(data.get("ownername").toString());
			shop.setPhoneNumber(data.get("phoneNumber").toString());
			shop.setIdentifyImg(data.get("identifyImg").toString());
		}
		return shop;
	}
	//  ��ȡ������Ʒ��Ϣ
	public PageBean getProductListBySearch(String[] params,int flag,int curPage)
	{
		PageBean pb = null;
		//  ����״̬��
		if( flag == 1 )
		{
			pb = dao.getProListBySearch(params,curPage);
		}else if(flag == 0){
			pb = dao.getProductList(params,curPage);
		}
		return pb;
	}
	//  ��ӵ�����Ʒ
	public boolean addProduct(String[] params,String[] detail,int aid)
	{
		//  �����Ʒ������Ϣ
		int pid = dao.insertProduct(params);
		if( pid != 0 )	//  ������Ϣ�ɹ�
		{
			if( dao.insertProductDetail(pid+"",aid, detail) != null )
				return true;
			else
				return false;
		} 
		return false;
	}
	//  ��ȡ��Ʒ��Ϣ
	public Product getProduct(String[] params)
	{
		Product product = null;
		HashMap info = null;
		List detail = null;
		info = (HashMap)dao.getProductInfo(params);
		if( info != null )
		{
			String firstClass = info.get("firstClass").toString();
			if( firstClass.equals("��") )//  ����ò�Ʒ����
			{
				Book book = new Book();
				detail = dao.getProductDetail(params);
				Map data[] = new Map[detail.size()];
				for(int i=0;i < detail.size(); i++)
				{
					data[i] = new HashMap();
					data[i] = (Map)detail.get(i);
				}
				book.setBookName(data[0].get("val").toString());
				book.setPublishName(data[1].get("val").toString());
				book.setPublishDate(data[2].get("val").toString());
				book.setAuthor(data[3].get("val").toString());
				book.setBookPage(data[4].get("val").toString());
				product = book;
			}
			else if( firstClass.equals("��ױ") )
			{
				Cosmetics cos = new Cosmetics();
				detail = dao.getProductDetail(params);
				Map data[] = new Map[detail.size()];
				for(int i=0;i < detail.size(); i++)
				{
					data[i] = new HashMap();
					data[i] = (Map)detail.get(i);
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
			else if( firstClass.equals("�ֱ�") )
			{
				Watch watch = new Watch();
				detail = dao.getProductDetail(params);
				Map data[] = new Map[detail.size()];
				for(int i=0;i < detail.size(); i++)
				{
					data[i] = new HashMap();
					data[i] = (Map)detail.get(i);
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
			product.setPid(Integer.parseInt(info.get("pid").toString()));
			product.setSid(Integer.parseInt(info.get("sid").toString()));
			product.setBigImg(info.get("bigImg").toString());
			product.setName(info.get("name").toString());
			product.setPrice(Float.parseFloat(info.get("price").toString()));
			product.setSmallImg(info.get("smallImg").toString());
			product.setInfoImg(info.get("infoImg").toString());
			product.setSaveNum(Integer.parseInt(info.get("saveNum").toString()));
			product.setSalesAmount(Integer.parseInt(info.get("salesAmount").toString()));
			product.setGoodsState(info.get("goodsState").toString());
			product.setFirstClass(info.get("firstClass").toString());
			product.setSecondClass(info.get("secondClass").toString());
		}
		return product;
	}
	//  �޸ĵ�����Ʒ
	public Product alterProduct(String[] params,String[] detail,String pid,int aid)
	{
		Product product = null;
		//  ���²�Ʒ������Ϣ
		int result = dao.updateProduct(params);
		if( result != 0 )	//  ������Ϣ�ɹ�
		{
			if( dao.updateProductDetail(pid,aid, detail) != null )
			{
				String id[] = {pid};
				product = this.getProduct(id);
			}
		} 
		return product;
	}
	//  ɾ�����̲�Ʒ
	public int deleteProduct(String[] params)
	{
		int result = 0;
		result = dao.delteProduct(params);
		return result;
	}
	//  ��ȡ��Ҷ���
	public PageBean getShopOrderInfo(String sid,int flag,int curpage)
	{
		PageBean datas = null;
		
		String sql = "";
		if( flag == 1 )
			sql = "select * from shop_order,product,user where shop_order.pid=product.pid " +
					"and shop_order.uid=user.uid and shop_order.sid=? and ostate=?";
		else if( flag == 0 )
			sql = "select * from shop_order,product,user where shop_order.pid=product.pid " +
					"and shop_order.uid=user.uid and shop_order.sid=? and ostate<>?";
		String ostate = "�ȴ�����";
		String params[] = {sid,ostate};
		datas = dao.selectShopOrder(sql,params,curpage);
		return datas;
	}
	//  �����ҷ�������
	public boolean shopDeliverGoods(String oid)
	{
		boolean flag = false;
		String userSql = "update user_order set ostate=? where oid=?";
		String shopSql = "update shop_order set ostate=? where oid=?";
		String ostate = "��������";
		String params[] = {ostate,oid};
		//  �����û��͵��̶�����״̬
		if( dao.updateOrderState(userSql, params) != 0 && dao.updateOrderState(shopSql, params) != 0 )
		{
			flag = true;
		}
		return flag;
	}
	//  ���ɾ����������
	public boolean deleteShopOrder(String oid)
	{
		boolean flag = false;
		String params[] = {oid};
		//  ɾ�����ݿ��е��̼Ҷ���
		if( dao.deleteShopOrderData(params) != 0)
		{
			flag = true;
		}
		return flag;
	}
}
