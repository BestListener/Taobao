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

@WebServlet("/servlet/alterProductInfo")
public class alterProductInfo extends HttpServlet {

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
		//  获取表单值
		String pid = request.getParameter("pid").toString();
		String bigImg = request.getParameter("saveShowImage").toString();
		String name = request.getParameter("goodsName").toString();
		String price = request.getParameter("goodsPrice").toString();
		String smallImg = request.getParameter("saveInterImage").toString();
		String infoImg = request.getParameter("saveInfoImage").toString();
		String saveNum = request.getParameter("goodsNum").toString();
		String firstClass = request.getParameter("firstClass").toString();
		//  设置基本属性参数数组
		String params[] = {bigImg,name,price,smallImg,infoImg,saveNum,pid};
		Product product = null;
		//  根据不同的种类获取不同的属性值
		if( firstClass.equals("书") )
		{
			String bookName = request.getParameter("bookName").toString();
			String publishName = request.getParameter("publishName").toString();
			String publishDate = request.getParameter("publishDate").toString();
			String author = request.getParameter("author").toString();
			String bookPage = request.getParameter("bookPage").toString();
			//  设置详细信息参数数组
			String details[] = {bookName,publishName,publishDate,author,bookPage};
			product = service.alterProduct(params, details,pid, 1);
			Book book = (Book)product;
			request.setAttribute("product", book);
		}
		else if( firstClass.equals("美妆") )
		{
			String cosSize = request.getParameter("cosSize").toString();
			String cosMonth = request.getParameter("cosMonth").toString();
			String fitSkin = request.getParameter("fitSkin").toString();
			String cosEffect = request.getParameter("cosEffect").toString();
			String period = request.getParameter("period").toString();
			String proAddress = request.getParameter("proAddress").toString();
			//  设置详细信息参数数组
			String details[] = {cosSize,cosMonth,fitSkin,cosEffect,period,proAddress};
			product = service.alterProduct(params, details,pid, 7);
			Cosmetics cosmetics = (Cosmetics)product;
			request.setAttribute("product", cosmetics);
		}
		else if( firstClass.equals("手表") )
		{
			String watchNo = request.getParameter("watchNo").toString();
			String watchApp = request.getParameter("watchApp").toString();
			String watchMove = request.getParameter("watchMove").toString();
			String watchStyle = request.getParameter("watchStyle").toString();
			String watchProduce = request.getParameter("watchProduce").toString();
			String watchDisplay = request.getParameter("watchDisplay").toString();
			String watchStrap = request.getParameter("watchStrap").toString();
			//  设置详细信息参数数组
			String details[] = {watchNo,watchApp,watchMove,watchStyle,watchProduce,watchDisplay,watchStrap};
			product = service.alterProduct(params, details,pid, 14);
			Watch watch = (Watch)product;
			request.setAttribute("product", watch);
		}
		//  修改信息成功
		if( product != null )
		{
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("/users/jsp/changeGoodsInfo.jsp").forward(request, response);
		}
		else{	//  修改信息失败
			request.setAttribute("msg", "修改失败");
			request.getRequestDispatcher("/users/jsp/changeGoodsInfo.jsp").forward(request, response);
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
