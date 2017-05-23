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
		//  ��ȡ����
		String scid = request.getParameter("scid").toString();
		String params[] = {scid};
		//	��ȡsession�е�uidֵ
		HttpSession session = request.getSession();
		String uid = session.getAttribute("uid").toString();
		String sum = null;
		sum = service.deleteUSCProduct(uid,params);
		if( sum != null )
		{
			String username = "";
			String userImg = "";
			//  ��ȡ�û�cookie
			Cookie cookies[] = request.getCookies();
			for(int i = 0; i < cookies.length; i++ )
			{
				if( cookies[i].getName().equals("mycookie") )
				{
					String val[] = cookies[i].getValue().split("#");
					//  �ѱ�����ַ���
					username = val[1];	//  ��ȡcookie���û���
					userImg = val[2];	//  ��ȡcookie��ͼƬ·��
				}
			}
			//  ɾ��֮ǰ��cookie
			Cookie delcookie = new Cookie("mycookie", "");
			delcookie.setPath("/");
			delcookie.setMaxAge(0);
			response.addCookie(delcookie);
			//  �����µ�cookie
			String cookieParams[] = {uid,username,userImg,sum};
			CookieUtil ck = new CookieUtil("mycookie",cookieParams);
			Cookie mycookie = ck.getCookie();
			//  ����µ�cookie
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
