package cn.edu.zhku.she.Ctrl.Admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/servlet/test")
public class test extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
		String acceptjson = "";  
        try {  
            BufferedReader br = new BufferedReader(new InputStreamReader(
            		(ServletInputStream) request.getInputStream(), "utf-8"));  
            StringBuffer sb = new StringBuffer("");  
            String temp;  
            while ((temp = br.readLine()) != null) {  
                sb.append(temp);
            }  
            br.close();
            acceptjson = sb.toString();
            acceptjson = URLDecoder.decode(acceptjson,"utf-8");
            System.out.println(acceptjson);
            if (acceptjson != "") {
                JSONObject jo = JSONObject.fromObject(acceptjson);  
                JSONArray orders = jo.getJSONArray("orders");  
                for (int i = 0; i < orders.size(); i++) {  
                    JSONObject order = JSONObject.fromObject(orders  
                            .get(i));  
                    System.out.println(order.get("name"));  
                }  
            }
        }catch(Exception e) {  
            e.printStackTrace();  
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
