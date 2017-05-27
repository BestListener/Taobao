package cn.edu.zhku.she.Ctrl.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Service.adminService;

@WebServlet("/servlet/admin/updateShopState")
public class updateShopState extends HttpServlet {

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
		//  获取参数
		String page = request.getParameter("page").toString();
		String state = request.getParameter("state").toString();
		String sid = request.getParameter("sid").toString();
		String update = "";
		request.setAttribute("page", page);
		request.setAttribute("state", state);
		String search = "";
		String msg = "";
		if( request.getParameter("search") != null )
		{
			search = request.getParameter("search").toString();
			request.setAttribute("search", search);
		}
		if( state.equals("等待验证") )
		{
			update = "正在运营";
			msg = "验证";
		}
		else if( state.equals("正在运营") )
		{
			update = "停止运营";
			msg = "停止";
		}
		else if( state.equals("停止运营") )
		{
			update = "正在运营";
			msg = "恢复";
		}
		String params[] = {update,sid};
		if( service.updateShopState(params) )
			msg = msg+"成功";
		else
			msg = msg+"失败";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/servlet/admin/getShopList").forward(request, response);
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
