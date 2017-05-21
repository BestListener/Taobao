package cn.edu.zhku.she.Ctrl.Shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Service.shopService;
import cn.edu.zhku.she.Util.PageBean;

@WebServlet("/servlet/getProductInfo")
public class getProductInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private shopService service = new shopService();
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
		//  获取店铺id
		HttpSession session = request.getSession();
		String sid =session.getAttribute("sid")+"";
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
		//  增加查询条件
		if( request.getParameter("search") != null || request.getAttribute("search") != null )
		{
			String search = null;
			if( request.getParameter("search") != null )
				search = request.getParameter("search").toString();
			else
				search = request.getAttribute("search").toString();
			request.setAttribute("search", search);
			search = "%" + search + "%";
			String params[] = {sid,search,search};
			pageBean = service.getProductListBySearch(params, 1,curPage);
		}
		else{		//  普通查询
			String params[] = {sid};
			pageBean = service.getProductListBySearch(params, 0,curPage);
		}
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/users/jsp/goodsListView.jsp").forward(request, response);
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
