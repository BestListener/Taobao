package cn.edu.zhku.she.Util;

import javax.servlet.http.Cookie;

public class CookieUtil {
	private Cookie mycookie = null;
	public CookieUtil(String name,String[] params)
	{
		String val = "";
		for(int i = 0; i < params.length; i++)
		{
			if( val.equals("") )
				val = params[i];
			else
				val = val + "#" + params[i];
		}
		mycookie=new Cookie(name,val);
		//   注意要设置作用范围，否则js前端获取不到
		mycookie.setPath("/");
      	mycookie.setMaxAge(1*24*60*60);
	}
	public Cookie getCookie()
	{
		return this.mycookie;
	}
}
