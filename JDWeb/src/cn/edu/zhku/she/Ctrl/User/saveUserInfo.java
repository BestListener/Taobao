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
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Model.User;
import cn.edu.zhku.she.Service.userService;
import cn.edu.zhku.she.Util.CookieUtil;

@WebServlet("/servlet/saveUserInfo")
public class saveUserInfo extends HttpServlet {

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
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//  ��ȡ�û�ID
		HttpSession session = request.getSession();
		String uid = session.getAttribute("uid")+"";
		//  ��ȡ������
		String phoneNum = request.getParameter("phoneNum").toString();
		String saveSrc = null;
		if( !request.getParameter("saveSrc").toString().equals("") )
			saveSrc = request.getParameter("saveSrc").toString();
		String subName = request.getParameter("subName").toString();
		String trueName = request.getParameter("trueName").toString();
		String sex = request.getParameter("sex").toString();
		String Year = request.getParameter("Year").toString();
		String Month = request.getParameter("Month").toString();
		String day = request.getParameter("Date").toString();
		String province = request.getParameter("province").toString();
		String city = request.getParameter("city").toString();
		String area = request.getParameter("address").toString();
		//  ƴ���������ַ����
		String brithday = Year+"/"+Month+"/"+day;
		String address = province+"/"+city+"/"+area;
		User user;
		//  û���ϴ�ͷ��ʱ
		if( saveSrc == null )
		{
			String[] params = {phoneNum,subName,trueName,sex,brithday,address,uid};
			user = service.saveUserInfo(uid, params, 0);
		}else{
			String[] params = {phoneNum,saveSrc,subName,trueName,sex,brithday,address,uid};
			user = service.saveUserInfo(uid, params, 1);
		}
		//  ��ȡ�û�cookie
		Cookie cookies[] = request.getCookies();
		String spNum = "";
		for(int i = 0; i < cookies.length; i++ )
		{
			if( cookies[i].getName().equals("mycookie") )
			{
				String val[] = cookies[i].getValue().split("#");
				spNum = val[3];
			}
		}
		//  ɾ��֮ǰ��cookie
		Cookie delcookie = new Cookie("mycookie", "");
		delcookie.setPath("/");
		delcookie.setMaxAge(0);
		response.addCookie(delcookie);
		//  �������ı���
		String usname = user.getName();
		String usimage = user.getImage();
		usname = URLEncoder.encode(usname,"UTF-8");
		usimage = URLEncoder.encode(usimage,"UTF-8");
		//�޸��û�cookie
		String ckParams[] = {uid,usname,usimage,spNum};
		CookieUtil ck = new CookieUtil("mycookie",ckParams);
		Cookie mycookie = ck.getCookie();
		//  ���cookie
		response.addCookie(mycookie);
		//  �޸�idֵ��session
		session.setAttribute("Mid", "per_info");
		request.setAttribute("user", user);
		request.setAttribute("msg", "����ɹ���");
		request.getRequestDispatcher("/users/jsp/userInfoView.jsp").forward(request, response);
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
