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

@WebServlet("/servlet/judgeShopExist")
public class judgeShopExist extends HttpServlet {

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
		//  ��ȡ�û�ID
		HttpSession session = request.getSession();
		String uid = session.getAttribute("uid")+"";
		//  �ж��û��Ƿ���ӵ�е���
		Shop shop = null;
		shop = service.isShopExist(uid);
		//test
		session.setAttribute("sid", shop.getSid());
		request.getRequestDispatcher("/users/jsp/shopGoodsView.jsp").forward(request, response);
		//
//		if( shop != null )  // �����Ѵ���
//		{
//			String shopstate = shop.getShopstate();
//			if( !shopstate.equals("��֤ͨ��") )	//  �쳣״̬
//			{
//				String msg = "���ĵ��������� "+shopstate+" ״̬";
//				request.setAttribute("msg", msg);
//				request.getRequestDispatcher("/users/jsp/showResult.jsp").forward(request, response);
//			}else{	//  ����״̬
//				//  ��ȡ��ҳid
//				String pid = request.getParameter("Pid");
//				request.setAttribute("sid", shop.getSid());
//				if( pid.equals("1") )
//				{
//					request.getRequestDispatcher("/users/jsp/showResult.jsp").forward(request, response);
//				}else if( pid.equals("2") )
//				{
//					request.getRequestDispatcher("/users/jsp/shopGoodsView.jsp").forward(request, response);
//				}
//			}
//			
//		}else{
//			String msg = "����δӵ�е��̣������������";
//			request.setAttribute("msg", msg);
//			request.getRequestDispatcher("/users/jsp/showResult.jsp").forward(request, response);
//		}
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
