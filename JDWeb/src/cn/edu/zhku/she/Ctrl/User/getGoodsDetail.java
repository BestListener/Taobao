package cn.edu.zhku.she.Ctrl.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Model.Product;
import cn.edu.zhku.she.Model.Shop;
import cn.edu.zhku.she.Service.userService;

@WebServlet("/servlet/getGoodsDetail")
public class getGoodsDetail extends HttpServlet {

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
		String pid = request.getParameter("pid").toString();
		String image = request.getParameter("image").toString();
		Product productDetail = null;
		String[] params = {pid};
		productDetail = service.getGoodsDetailData(firstClass, params);
		if( productDetail != null )
		{
			request.setAttribute("image", image);
			request.setAttribute("firstClass", firstClass);
			request.setAttribute("secondClass", secondClass);
			request.setAttribute("productDetail", productDetail);
		}
		request.getRequestDispatcher("/jsp/goodsDetailView.jsp").forward(request, response);
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
