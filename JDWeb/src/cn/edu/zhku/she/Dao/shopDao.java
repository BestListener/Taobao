package cn.edu.zhku.she.Dao;

import java.util.List;
import java.util.Map;

import cn.edu.zhku.she.Util.DBUtil;
import cn.edu.zhku.she.Util.PageBean;

public class shopDao {
	private DBUtil db = new DBUtil();
	//  ͨ��id��ѯ�̵���Ϣ
	public Map selShopInfoByid(String[] params)
	{
		Map shop = null;
		String sql = "select * from shop where uid=?";
		shop = db.getMap(sql, params);
		return shop;
	}
	//  �����̵�����
	public Map insertShopInfo(String id,String[] params)
	{
		Map shop = null;
		String sql = "insert into shop(uid,shopname,ownername,phoneNumber,identifyImg,shopstate) value(?,?,?,?,?,?)";
		if( db.update(sql, params) == 1 )	//  ����ɹ�
		{
			sql = "select * from shop where uid=?";
			String uid[] = {id}; 
			shop = db.getMap(sql, uid);
		}
		return shop;
	}
	//  �����̵�����
	public Map updateShopInfoById(String id,String[] params)
	{
		Map shop = null;
		String sql = "update shop set shopname=?,ownername=?,phoneNumber=?,identifyImg=? where uid=?";
		if( db.update(sql, params) == 1 )	//  ����ɹ�
		{
			sql = "select * from shop where uid=?";
			String uid[] = {id}; 
			shop = db.getMap(sql, uid);
		}
		return shop;
	}
	//  ��ȡ����״̬�µĲ�Ʒ����
	public PageBean getProListBySearch(String[] params,int curPage)
	{
		db.setPageSize(8);
		String sql = "select * from product where sid=? and (name like ? or firstClass like ?)";
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  ������״̬��
	public PageBean getProductList(String[] params,int curPage)
	{
		db.setPageSize(8);
		String sql = "select * from product where sid=?";
		PageBean pb = db.getPageBean(sql, params,curPage);
		return pb;
	}
	//  ������̲�Ʒ��Ϣ
	public int insertProduct(String[] params)
	{
		int result = 0;
		String sql = "insert into product(sid,bigImg,name,price,smallImg,infoImg,saveNum,firstClass,secondClass) value(?,?,?,?,?,?,?,?,?)";
		result = db.updateReturnId(sql, params);
		return result;
	}
	//  ���������Ʒ��ϸ��Ϣ
	public int[] insertProductDetail(String pid,int aid,String[] params)
	{
		int result[] = null;
		String sql = "insert into p_detail_info(pid,aid,val) value(?,?,?)";
		result = db.insertByBatch(sql,pid,aid,params);
		return result;
	}
	//  ���µ��̲�Ʒ��Ϣ
	public int updateProduct(String[] params)
	{
		int result = 0;
		String sql = "update product set bigImg=?,name=?,price=?,smallImg=?,infoImg=?,saveNum=? where pid=?";
		result = db.update(sql, params);
		return result;
	}
	//  �������²�Ʒ��ϸ��Ϣ
	public int[] updateProductDetail(String pid,int aid,String[] params)
	{
		int result[] = null;
		String sql = "update p_detail_info set val=? where pid=? and aid=?";
		result = db.updateByBatch(sql,pid,aid,params);
		return result;
	}
	//  ��ȡ��Ʒ�Ļ�����Ϣ
	public Map getProductInfo(String[] params)
	{
		Map product = null;
		String sql = "select * from product where pid=?";
		product = db.getMap(sql, params);
		return product;
	}
	//  ��ȡ��Ʒ����ϸ��Ϣ
	public List getProductDetail(String[] params)
	{
		List detail = null;
		String sql = "select * from p_detail_info where pid=?";
		detail = db.getList(sql, params);
		return detail;
	}
	//  ɾ����Ʒ��Ϣ
	public int delteProduct(String[] params)
	{
		int rs = 0;
		String sql = "delete from product where pid=?";
		rs = db.update(sql, params);
		if( rs != 0 )
		{
			sql = "delete from p_detail_info where pid=?";
			db.update(sql, params);
		}
		return rs;
	}
}
