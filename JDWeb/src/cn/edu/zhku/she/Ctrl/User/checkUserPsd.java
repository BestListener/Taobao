package cn.edu.zhku.she.Ctrl.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Model.User;
import cn.edu.zhku.she.Service.userService;
import cn.edu.zhku.she.Util.CookieUtil;

@WebServlet("/servlet/checkUserPsd")
public class checkUserPsd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private userService service = new userService();
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String psd = request.getParameter("psd");
		//  获取用户数据
		User user = service.checkUserPad(username,psd);
		if( user != null )
		{
			String uid =  user.getUserid()+"";
			String usname;
			if( user.getName() != null )
			{
				usname = user.getName();
			}else
			{
				usname = user.getUsername();
			}
			//  处理中文名字
			usname = URLEncoder.encode(usname,"UTF-8");
			String image = user.getImage();
			//   获取用户购物车物品数
			String spNum = service.getUserShoppingCart(uid)+"";
			//  创建用户cookie
			String[] cookieParams = {uid,usname,image,spNum};
			//  删除之前的cookie
			Cookie delcookie = new Cookie("mycookie", "");
			delcookie.setPath("/");
			delcookie.setMaxAge(0);
			response.addCookie(delcookie);
			//  创建新的cookie
			CookieUtil ck = new CookieUtil("mycookie",cookieParams);
			Cookie mycookie = ck.getCookie();
			//  添加cookie
			response.addCookie(mycookie);
			out.print("true");
		}
		else
			out.print("false");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
