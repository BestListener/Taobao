package cn.edu.zhku.she.Util;

import java.sql.*;
import java.util.*;


public class DBUtil {
	private String driver;
	private String url;
	private String username;
	private String password;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int pageSize;
	public void setDriver(String driver)
	{
		this.driver = driver;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	//  构造方法
	public DBUtil()
	{
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://127.0.0.1:3306/taobao?useUnicode=true&characterEncoding=utf8";
		username = "root";
		password = "123456";
	}
	//  获取连接对象
	private Connection getConnection()
	{
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url,username,password);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	//  获取语句对象
	private PreparedStatement getPrepareStatement(String sql)
	{
		try{
			pstmt = getConnection().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return pstmt;
	}
	//  给pstmt的SQL语句设置参数(要求参数以数组形式给出)
	private void setParams(String sql,String[] params)
	{
		pstmt = this.getPrepareStatement(sql);
		for(int i = 0; i < params.length; i++)
		{
			try{
				pstmt.setString(i + 1, params[i]);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	//  关闭对象
	private void close()
	{
		try{
			if( rs != null )
				rs.close();
			if( pstmt != null )
				pstmt.close();
			if( con != null )
				con.close();
		}catch(SQLException e){
		}
	}
	//  执行数据库查询操作时，将返回的结果封装到List对象中
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getList(String sql,String[] params)
	{
		List list = new ArrayList();
		try{
			this.setParams(sql, params);
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next())
			{
				Map m = new HashMap();
				for(int i = 1;i <= rsmd.getColumnCount(); i++)
				{
					String colName = rsmd.getColumnName(i);
					m.put(colName, rs.getString(colName));
				}
				list.add(m);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	//  执行数据库查询操作时,将返回的结果封装到map对象中
	@SuppressWarnings("rawtypes")
	public Map getMap(String sql,String[] params)
	{
		List list = getList(sql,params);
		if( list.isEmpty() )
			return null;
		else
			return (Map)list.get(0);
	}
	//  更新数据库时调用的update方法
	public int update(String sql,String[] params)
	{
		int recNo = 0;
		try{
			setParams(sql,params);
			recNo = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return recNo;
	}
	//  更新数据库时调用的update方法
	public int updateReturnId(String sql,String[] params)
	{
		int recNo = 0;
		try{
			setParams(sql,params);
			recNo = pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys(); //获取结果   
			if (rs.next()) {
				recNo = rs.getInt(1);//取得ID
			} else {
				// throw an exception from here
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return recNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	//  执行数据库查询操作时，返回结果的记录总数
	private int getDataSize(String sql,String[] params)
	{
		int dataSize = 0;
		sql = sql.toLowerCase();
		String countSql = "";
		if( sql.indexOf("group") >= 0 ){
			countSql = "select count(*) from (" + sql + ") as 'tempNum'";
		}
		else{
			countSql = "select count(*) as 'tempNum' " + sql.substring(sql.indexOf("from"));
		}
		//  count中存放总记录数
		String count = (String)getMap(countSql,params).get("tempNum");
		dataSize = Integer.parseInt(count);
		return dataSize;
	}
	//  分页显示查询结果时，将当前页中的所有信息封装到PageBean中
	@SuppressWarnings("rawtypes")
	public PageBean getPageBean(String sql,String[] params,int curPage)
	{
		String newSql = sql + " limit "+(curPage-1)*pageSize+","+pageSize;
		List data = this.getList(newSql, params);
		PageBean pb = new PageBean();
		pb.setCurPage(curPage);
		pb.setPageSize(pageSize);
		pb.setDataSize(getDataSize(sql,params));
		pb.setData(data);
		return pb;
	}
	//  批量执行插入语句
	public int[] insertByBatch(String sql,String id,int aid,String[] params)
	{
		int recNo[] = null ;
		pstmt = this.getPrepareStatement(sql);
		try {
			con.setAutoCommit(false);
			for(int i=0;i < params.length; i++)
			{
				pstmt.setString(1,id);
				pstmt.setString(2,aid+"");
				pstmt.setString(3,params[i]);
				pstmt.addBatch();
				aid++;
			}
			recNo = pstmt.executeBatch();
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return recNo;
	}
	//  批量执行更新语句
	public int[] updateByBatch(String sql,String pid,int aid,String[] params)
	{
		int recNo[] = null ;
		pstmt = this.getPrepareStatement(sql);
		try {
			con.setAutoCommit(false);
			for(int i=0;i < params.length; i++)
			{
				pstmt.setString(1,params[i]);
				pstmt.setString(2,pid);
				pstmt.setString(3,aid+"");
				pstmt.addBatch();
				aid++;
			}
			recNo = pstmt.executeBatch();
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return recNo;
	}
	//   批量执行插入语句
	@SuppressWarnings("rawtypes")
	public int[] insertByBatch(String sql,List datas,String uid,String date)
	{
		int recNo[] = null ;
		pstmt = this.getPrepareStatement(sql);
		try {
			con.setAutoCommit(false);
			for(int i=0;i < datas.size(); i++)
			{
				Map data = new HashMap();
				data = (Map)datas.get(i);
				String pid = data.get("pid").toString();
				String sid = data.get("sid").toString();
				String number = data.get("number").toString();
				String payAmount = data.get("payAmount").toString();
				String params[] = {uid,pid,sid,number,payAmount,date};
				this.setBatchParams(params);
				pstmt.addBatch();
			}
			recNo = pstmt.executeBatch();
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return recNo;
	}
	//  批量执行更新产品数
	@SuppressWarnings("rawtypes")
	public int[] updateByBatch(String sql,List datas)
	{
		int recNo[] = null ;
		pstmt = this.getPrepareStatement(sql);
		try {
			con.setAutoCommit(false);
			for(int i=0;i < datas.size(); i++)
			{
				Map data = new HashMap();
				data = (Map)datas.get(i);
				String pid = data.get("pid").toString();
				String number = data.get("number").toString();
				String params[] = {number,pid};
				this.setBatchParams(params);
				pstmt.addBatch();
			}
			recNo = pstmt.executeBatch();
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return recNo;
	}
	//  批量删除产品数
	@SuppressWarnings("rawtypes")
	public int[] deleteByBatch(String sql,List datas)
	{
		int recNo[] = null ;
		pstmt = this.getPrepareStatement(sql);
		try {
			con.setAutoCommit(false);
			for(int i=0;i < datas.size(); i++)
			{
				Map data = new HashMap();
				data = (Map)datas.get(i);
				String scid = data.get("scid").toString();
				String params[] = {scid};
				this.setBatchParams(params);
				pstmt.addBatch();
			}
			recNo = pstmt.executeBatch();
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return recNo;
	}
	//  给pstmt的SQL语句设置参数(要求参数以数组形式给出)
	private void setBatchParams(String[] params)
	{
		for(int i = 0; i < params.length; i++)
		{
			try{
				pstmt.setString(i + 1, params[i]);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
