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

@WebServlet("/servlet/getShopOrderInfo")
public class getShopOrderInfo extends HttpServlet {

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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 //  获取店铺sid
        HttpSession session = request.getSession();
		String sid = session.getAttribute("sid").toString();
		if( request.getAttribute("msg") != null )
			request.setAttribute("msg", request.getAttribute("msg"));
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
		//  获取页面参数
		String state = null;
		if( request.getParameter("state") != null )
			state = request.getParameter("state").toString();
		else if( request.getAttribute("state") != null )
			state = request.getParameter("state").toString();
		int flag;
		if( state.equals("未处理") )
			flag = 1;
		else
			flag = 0;		//  其他状态
		pageBean = service.getShopOrderInfo(sid, flag, curPage);
		request.setAttribute("orders", pageBean);
		if( flag == 1 )
			request.getRequestDispatcher("/users/jsp/unDeliverOrder.jsp").forward(request, response);
		else if( flag == 0 )
			request.getRequestDispatcher("/users/jsp/deliverOrder.jsp").forward(request, response);
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
