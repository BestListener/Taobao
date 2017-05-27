package cn.edu.zhku.she.Ctrl.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Service.adminService;
import cn.edu.zhku.she.Util.PageBean;

@WebServlet("/servlet/admin/getShopList")
public class getShopList extends HttpServlet {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//  创建session
		HttpSession session = request.getSession();
		//  获取参数
		String state = "";
		String search = "";
		String msg = "";
		String url = "/JDWeb/servlet/admin/getShopList";
		if( request.getAttribute("msg") != null )
		{
			msg = request.getAttribute("msg").toString();
			request.setAttribute("msg", msg);
		}
		if( request.getParameter("state") != null )
		{
			state = request.getParameter("state").toString();
		}
		else if( request.getAttribute("state") != null )
		{
			state = request.getAttribute("state").toString();
		}
		else if( session.getAttribute("shopstate") != null )
		{
			state = session.getAttribute("shopstate").toString();
			session.removeAttribute("shopstate");
		}
		url = url + "?state=" + state;
		if( request.getParameter("search") != null )
		{	
			search = request.getParameter("search").toString();
			url = url + "&search=" + search;
			request.setAttribute("search", search);
		}
		else if( request.getAttribute("search") != null )
		{
			search = request.getParameter("search").toString();
			url = url + "&search=" + search;
		}
		else if( session.getAttribute("shopsearch") != null )
		{
			search = session.getAttribute("shopsearch").toString();
			session.removeAttribute("shopsearch");
			url = url + "&search=" + search;
			session.setAttribute("shopmsg", "不存在相关店铺。");
		}
		//  设置页数
		String page = null;
		if( request.getParameter("page") != null )
		{
			page = request.getParameter("page").toString();
		}
		else if( request.getAttribute("page") != null )
		{
			page = request.getAttribute("page").toString();
		}
		else if( session.getAttribute("shoppage") != null )
		{
			page = session.getAttribute("shoppage").toString();
			session.removeAttribute("shoppage");
		}
		int curPage = 1;
		//  如果传入页数
		if( page != null && page.length() > 0 )
		{
			curPage = Integer.parseInt(page);
		}
		PageBean pageBean = new PageBean();
		pageBean = service.getShopList(state, search, curPage);
		//  将当前地址传回
		session.setAttribute("shoppageurl", url);
		request.setAttribute("pageBean", pageBean);
		if( state.equals("等待验证") )
			request.getRequestDispatcher("/Admin/jsp/verifyShopView.jsp").forward(request, response);
		else if( state.equals("正在运营") )
			request.getRequestDispatcher("/Admin/jsp/normalShopView.jsp").forward(request, response);
		else
			request.getRequestDispatcher("/Admin/jsp/shpedShopView.jsp").forward(request, response);
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
