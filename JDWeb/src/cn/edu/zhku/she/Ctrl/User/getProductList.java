package cn.edu.zhku.she.Ctrl.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Service.userService;
import cn.edu.zhku.she.Util.PageBean;

@WebServlet("/servlet/getProductList")
public class getProductList extends HttpServlet {

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
		//  获取参数
		String firstClass = request.getParameter("firstClass").toString();
		String secondClass = request.getParameter("secondClass").toString();
		String sortMethod = request.getParameter("sort").toString();
		String brank = "";
		String search = "";
		//  用map传递参数
		Map<String, String> params = new HashMap<String,String>();
		params.put("firstClass",firstClass);
		params.put("secondClass",secondClass);
		params.put("sortMethod",sortMethod);
		String url = "./servlet/getProductList?firstClass="+firstClass+"&secondClass="+secondClass
				+"&sort="+sortMethod;
		if( request.getParameter("brank") != null )
		{
			brank = request.getParameter("brank").toString();
			params.put("brank",brank);
			url = url+"&brank="+brank;
		}
		if( request.getParameter("search") != null )
		{
			search = request.getParameter("search").toString();
			params.put("search",search);
			url = url+"&search="+search;
			request.setAttribute("search", search);
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
		int curPage = 1;
		//  如果传入页数
		if( page != null && page.length() > 0 )
		{
			curPage = Integer.parseInt(page);
		}
		PageBean pageBean = new PageBean();
		pageBean = service.getWebProductInfo(params,curPage);
		//  将当前地址传回
		HttpSession session = request.getSession();
		session.setAttribute("pageurl", url);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/jsp/booksDataView.jsp").forward(request, response);
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
