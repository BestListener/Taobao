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
	//  ���췽��
	public DBUtil()
	{
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://127.0.0.1:3306/taobao?useUnicode=true&characterEncoding=utf8";
		username = "root";
		password = "123456";
	}
	//  ��ȡ���Ӷ���
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
	//  ��ȡ������
	private PreparedStatement getPrepareStatement(String sql)
	{
		try{
			pstmt = getConnection().prepareStatement(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return pstmt;
	}
	//  ��pstmt��SQL������ò���(Ҫ�������������ʽ����)
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
	//  �رն���
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
	//  ִ�����ݿ��ѯ����ʱ�������صĽ����װ��List������
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
	//  ִ�����ݿ��ѯ����ʱ,�����صĽ����װ��List������
	public Map getMap(String sql,String[] params)
	{
		List list = getList(sql,params);
		if( list.isEmpty() )
			return null;
		else
			return (Map)list.get(0);
	}
	//  �������ݿ�ʱ���õ�update����
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
}
