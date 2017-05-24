package cn.edu.zhku.she.Ctrl.User;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.she.Service.userService;
import cn.edu.zhku.she.Util.CookieUtil;

@WebServlet("/servlet/addToMyShoppingCart")
public class addToMyShoppingCart extends HttpServlet {

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
		//  ��ȡ����
		String uid = request.getParameter("uid").toString();
		String pid = request.getParameter("pid").toString();
		String sid = request.getParameter("sid").toString();
		String amount = request.getParameter("amount").toString();
		String price = request.getParameter("price").toString();
		String params1[] = {uid,pid};
		//  ��ȡ�۸񱣴浽i
		float j = Float.parseFloat(price);
		//  Ӧ�����
		String payAmount = "";
		//  ����ò�Ʒ���ڣ���ִ�и��²���
		if( service.isProductExist(amount, params1) )
		{
			int num = 0;
			String pNum = null;
			pNum = service.getProductNum(params1);
			if( pNum != null )
				num = Integer.parseInt(pNum);
			int buynum = Integer.parseInt(amount);
			payAmount = String.valueOf(buynum * j);
			if( num + buynum <= 99 )
			{
				String params2[] = {amount,payAmount,uid,pid};
				int result = 0;
				result = service.updateProductNum(params2,0);
				if( result != 0 )
				{
					out.print("true");
				}
				else
				{
					out.print("false");
				}
			}
			else
			{
				amount = "99";
				buynum = Integer.parseInt(amount);
				payAmount = String.valueOf(buynum * j);
				String params2[] = {amount,payAmount,uid,pid};
				int result = 0;
				result = service.updateProductNum(params2,1);
				if( result != 0 )
				{
					out.print("true");
				}
				else
				{
					out.print("false");
				}
			}
		}
		else  //  ���򣬲�����Ʒ���ݣ�����cookie
		{
			int buynum = Integer.parseInt(amount);
			payAmount = String.valueOf(buynum * j);
			//  ��������
			String params3[] = {uid,pid,sid,amount,payAmount};
			//  �û����ﳵ�е���Ʒ��
			int scNum = 0;
			String username = "";
			String userImg = "";
			scNum = service.addProductToSC(uid, params3);
			if( scNum != 0 )
			{
				//  ��ȡ�û�cookie
				Cookie cookies[] = request.getCookies();
				for(int i = 0; i < cookies.length; i++ )
				{
					if( cookies[i].getName().equals("mycookie") )
					{
						String val[] = cookies[i].getValue().split("#");
						//  �ѱ�����ַ���
						username = val[1];	//  ��ȡcookie���û���
						userImg = val[2];	//  ��ȡcookie��ͼƬ·��
					}
				}
				//  ɾ��֮ǰ��cookie
				Cookie delcookie = new Cookie("mycookie", "");
				delcookie.setPath("/");
				delcookie.setMaxAge(0);
				response.addCookie(delcookie);
				//  �����µ�cookie
				String cookieParams[] = {uid,username,userImg,scNum+""};
				CookieUtil ck = new CookieUtil("mycookie",cookieParams);
				Cookie mycookie = ck.getCookie();
				//  ����µ�cookie
				response.addCookie(mycookie);
				out.print("true");
			}
			else
			{
				out.print("false");
			}
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
