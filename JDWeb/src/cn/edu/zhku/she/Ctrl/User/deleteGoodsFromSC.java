package cn.edu.zhku.she.Ctrl.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Service.userService;
import cn.edu.zhku.she.Util.CookieUtil;

@WebServlet("/servlet/deleteGoodsFromSC")
public class deleteGoodsFromSC extends HttpServlet {

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
		String scid = request.getParameter("scid").toString();
		String params[] = {scid};
		//	获取session中的uid值
		HttpSession session = request.getSession();
		String uid = session.getAttribute("uid").toString();
		String sum = null;
		sum = service.deleteUSCProduct(uid,params);
		if( sum != null )
		{
			String username = "";
			String userImg = "";
			//  获取用户cookie
			Cookie cookies[] = request.getCookies();
			for(int i = 0; i < cookies.length; i++ )
			{
				if( cookies[i].getName().equals("mycookie") )
				{
					String val[] = cookies[i].getValue().split("#");
					//  已编码的字符串
					username = val[1];	//  获取cookie的用户名
					userImg = val[2];	//  获取cookie的图片路径
				}
			}
			//  删除之前的cookie
			Cookie delcookie = new Cookie("mycookie", "");
			delcookie.setPath("/");
			delcookie.setMaxAge(0);
			response.addCookie(delcookie);
			//  创建新的cookie
			String cookieParams[] = {uid,username,userImg,sum};
			CookieUtil ck = new CookieUtil("mycookie",cookieParams);
			Cookie mycookie = ck.getCookie();
			//  添加新的cookie
			response.addCookie(mycookie);
			out.print("true");
		}
		else
		{
			out.print("false");
		}
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
