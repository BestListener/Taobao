package cn.edu.zhku.she.Ctrl.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Model.User;
import cn.edu.zhku.she.Service.userService;
import cn.edu.zhku.she.Util.CookieUtil;

@WebServlet("/servlet/userRegister")
public class userRegister extends HttpServlet {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//  获取参数
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String psd = request.getParameter("psd");
		String[] params = {username,psd,phone};
		//  保存注册信息
		User user = service.toRegister(params);
		if( user != null )
		{
			String uid =  user.getUserid()+"";
			String usname = user.getUsername();
			String image = user.getImage();
			String spNum = "0";
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
