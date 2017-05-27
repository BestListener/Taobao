package cn.edu.zhku.she.Ctrl.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.she.Service.adminService;

@WebServlet("/servlet/admin/updateShopStateFromInfoPage")
public class updateShopStateFromInfoPage extends HttpServlet {

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
		//  ��ȡ����
		String sid = request.getParameter("sid").toString();
		String state = request.getParameter("state").toString();
		if( state.equals("������Ӫ") )
		{
			state = "ֹͣ��Ӫ";
		}
		else if( state.equals("ֹͣ��Ӫ") )
		{
			state = "������Ӫ";
		}
		//  ����session
		HttpSession session = request.getSession();
		String page = session.getAttribute("shoppage").toString();
		String after = session.getAttribute("shopafterPage").toString();
		//  ������߲���ȣ�����ҳ��
		if( !page.equals(after) )
		{
			session.setAttribute("shoppage",after);
			session.setAttribute("shopafterPage",page);
		}
		String params[] = {state,sid};
		if( service.updateShopState(params) )
		{
			out.print("true");
		}
		else
		{
			out.print("false");
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
