package cn.edu.zhku.she.Ctrl.Shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Service.shopService;

@WebServlet("/servlet/delProduct")
public class delProduct extends HttpServlet {

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
		//  获取产品id
		String pid = request.getParameter("pid").toString();
		String page = request.getParameter("page").toString();
		String params[] = {pid};
//		String url = "/JDWeb/servlet/getProductInfo";
		if( request.getParameter("search") != null )
		{
			String search = request.getParameter("search").toString();
			request.setAttribute("search", search);
//			url = url+"?search="+search+"&page="+page;
		}
//		else{
//			url = url+"?&page="+page;
//		}
		int rs = service.deleteProduct(params);
		request.setAttribute("page", page);
//		System.out.println(url);
		//  删除成功
		if( rs != 0 )
		{
			request.setAttribute("msg", "删除成功");
			request.getRequestDispatcher("/servlet/getProductInfo").forward(request, response);
		}
		else{	// 删除失败
			request.setAttribute("msg", "删除失败");
			request.getRequestDispatcher("/servlet/getProductInfo").forward(request, response);
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
