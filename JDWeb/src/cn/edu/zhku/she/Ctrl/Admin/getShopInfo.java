package cn.edu.zhku.she.Ctrl.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Service.adminService;

@WebServlet("/servlet/admin/getShopInfo")
public class getShopInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private adminService service = new adminService();
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
	@SuppressWarnings("rawtypes")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//  获取参数
		String sid = request.getParameter("sid").toString();
		String state = request.getParameter("state").toString();
		String page = request.getParameter("page").toString();
		String afterPage = request.getParameter("afterPage").toString();
		//  创建session
		//  保存参数
		HttpSession session = request.getSession();
		session.setAttribute("shopstate", state);
		session.setAttribute("shoppage", page);
		session.setAttribute("shopafterPage", afterPage);
		if( request.getParameter("search") != null )
			session.setAttribute("shopsearch", request.getParameter("search"));
		Map shop = null;
		shop = service.getShopInfo(sid);
		request.setAttribute("shop", shop);
		request.getRequestDispatcher("/Admin/jsp/showShopInfo.jsp").forward(request, response);
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
