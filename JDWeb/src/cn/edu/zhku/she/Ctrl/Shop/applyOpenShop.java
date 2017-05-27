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

@WebServlet("/servlet/applyOpenShop")
public class applyOpenShop extends HttpServlet {

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
		Shop shop = null;
		String shopName = request.getParameter("shopName").toString();
		String shopowName = request.getParameter("shopowName").toString();
		String shopPhone = request.getParameter("shopPhone").toString();
		String saveSrc = request.getParameter("saveSrc").toString();
		String state = "等待验证";
		String[] params = {uid,shopName,shopowName,shopPhone,saveSrc,state};
		shop = service.addShopInfo(uid, params);
		request.setAttribute("shop", shop);
		if( shop.getShopstate().equals("等待验证") )
			request.setAttribute("msg", "申请成功，您的店铺"+shop.getShopstate());
		request.getRequestDispatcher("/users/jsp/shopInfoManager.jsp").forward(request, response);
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
