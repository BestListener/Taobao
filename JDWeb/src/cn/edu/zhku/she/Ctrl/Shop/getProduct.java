package cn.edu.zhku.she.Ctrl.Shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Model.Book;
import cn.edu.zhku.she.Model.Cosmetics;
import cn.edu.zhku.she.Model.Product;
import cn.edu.zhku.she.Model.Watch;
import cn.edu.zhku.she.Service.shopService;

@WebServlet("/servlet/getProduct")
public class getProduct extends HttpServlet {

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
		//  获取产品pid值
		String pid = request.getParameter("pid").toString();
		String params[] = {pid};
		Product product = null;
		//  获得产品数据
		product = service.getProduct(params);
		//  如果产品数据不为空，分发到changeGoodsInfo页面
		if( product != null )
		{
			if( product.getFirstClass().equals("书") )
			{
				Book book = (Book)product;
				request.setAttribute("product", book);
			}
			else if( product.getFirstClass().equals("美妆") )
			{
				Cosmetics cosmetics = (Cosmetics)product;
				request.setAttribute("product", cosmetics);
			}
			else if( product.getFirstClass().equals("手表") )
			{
				Watch watch = (Watch)product;
				request.setAttribute("product", watch);
			}
			request.getRequestDispatcher("/users/jsp/changeGoodsInfo.jsp").forward(request, response);
		}
		else		//  为空，返回上一页
		{
			out.print("<script type='text/javascript'>history.back()</script>");
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
