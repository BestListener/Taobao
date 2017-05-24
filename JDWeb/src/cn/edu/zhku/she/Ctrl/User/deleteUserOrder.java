package cn.edu.zhku.she.Ctrl.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Service.userService;

@WebServlet("/servlet/deleteUserOrder")
public class deleteUserOrder extends HttpServlet {

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
		//  »ñÈ¡¶©µ¥id
		String oid = request.getParameter("oid").toString();
		String page = request.getParameter("page").toString();
		String params[] = {oid};
		request.setAttribute("page", page);
		//  É¾³ý³É¹¦
		if( service.deleteUserOrder(params) )
		{
			request.setAttribute("msg", "É¾³ý³É¹¦");
			request.getRequestDispatcher("/servlet/getUserOrderInfo").forward(request, response);
		}
		else{	// É¾³ýÊ§°Ü
			request.setAttribute("msg", "É¾³ýÊ§°Ü");
			request.getRequestDispatcher("/servlet/getUserOrderInfo").forward(request, response);
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
