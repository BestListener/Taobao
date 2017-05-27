package cn.edu.zhku.she.Ctrl.Shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Model.Shop;
import cn.edu.zhku.she.Service.shopService;

@WebServlet("/servlet/getShopInfo")
public class getShopInfo extends HttpServlet {
	
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
		//  获取用户ID
		HttpSession session = request.getSession();
		String uid = session.getAttribute("uid")+"";
		//  判断用户是否已拥有店铺
		Shop shop = null;
		shop = service.isShopExist(uid);
		if( shop != null )  // 店铺已存在
		{
			String shopstate = shop.getShopstate();
			if( !shopstate.equals("正在运营") )
			{
				String msg = "您的店铺正处于 "+shopstate+" 状态";
				request.setAttribute("msg", msg);
			}
			request.setAttribute("shop", shop);
			request.getRequestDispatcher("/users/jsp/shopInfoManager.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/users/jsp/applyOpenShop.jsp").forward(request, response);
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
