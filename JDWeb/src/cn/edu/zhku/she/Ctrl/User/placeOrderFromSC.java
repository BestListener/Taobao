package cn.edu.zhku.she.Ctrl.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import cn.edu.zhku.she.Service.userService;
import cn.edu.zhku.she.Util.CookieUtil;

@WebServlet("/servlet/placeOrderFromSC")
public class placeOrderFromSC extends HttpServlet {

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
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//  用list保存传递过来的参数数据
		List datas = new ArrayList();
		//  获取前台传递过来的json数据
		String acceptjson = "";  
        try {  
        	//  获取post方式传递的数据包头数据
            BufferedReader br = new BufferedReader(new InputStreamReader(
            		(ServletInputStream) request.getInputStream(), "utf-8"));  
            StringBuffer sb = new StringBuffer("");  
            String temp;  
            while ((temp = br.readLine()) != null) {  
                sb.append(temp);
            }  
            br.close();
            acceptjson = sb.toString();
            //  将获取的json数据字符串解码
            acceptjson = URLDecoder.decode(acceptjson,"utf-8");
            if (acceptjson != "") {
                JSONObject jo = JSONObject.fromObject(acceptjson);  
                JSONArray orders = jo.getJSONArray("orders");  
                for (int i = 0; i < orders.size(); i++) {  
                	Map<String , String> map = new HashMap<String , String>();
                    JSONObject order = JSONObject.fromObject(orders.get(i));  
                    map.put("scid", order.get("scid").toString());
                    map.put("pid", order.get("pid").toString());
                    map.put("sid", order.get("sid").toString());
                    map.put("number", order.get("number").toString());
                    map.put("payAmount", order.get("payAmount").toString());
                    datas.add(map);
                }  
            }
        }catch(Exception e) {  
            e.printStackTrace();  
        }
        //  获取用户uid
        HttpSession session = request.getSession();
		String uid = session.getAttribute("uid").toString();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String date = df.format(new Date());// new Date()为获取当前系统时间
		//  如果用户信息已完善
		if( service.isUserInfoNull(uid) )
		{
			//  处理订单信息，获取用户购物车中的产品数
			String sum = null;
			sum = service.settleMentUserOrder(datas,uid,date);
			//  如果处理成功
			if( sum != null )
			{
				String username = "";
				String userImg = "";
				//  获取用户cookie
				Cookie cookies[] = request.getCookies();
				for(int i = 0; i < cookies.length; i++ )
				{
					if( cookies[i].getName().equals("mycookie") )
					{
						String val[] = cookies[i].getValue().split("#");
						//  已编码的字符串
						username = val[1];	//  获取cookie的用户名
						userImg = val[2];	//  获取cookie的图片路径
					}
				}
				//  删除之前的cookie
				Cookie delcookie = new Cookie("mycookie", "");
				delcookie.setPath("/");
				delcookie.setMaxAge(0);
				response.addCookie(delcookie);
				//  创建新的cookie
				String cookieParams[] = {uid,username,userImg,sum};
				CookieUtil ck = new CookieUtil("mycookie",cookieParams);
				Cookie mycookie = ck.getCookie();
				//  添加新的cookie
				response.addCookie(mycookie);
				// 创建json数据
				JSONObject resultJson = new JSONObject();
		        resultJson.put("flag", "true");
		        out.println(resultJson);
			}
			else		//  处理失败
			{
				// 创建json数据
				JSONObject resultJson = new JSONObject();
		        resultJson.put("flag", "false");
		        out.println(resultJson);
			}
		}
		else
		{
			// 创建json数据
			JSONObject resultJson = new JSONObject();
	        resultJson.put("flag", "请先前往个人中心完善您的个人信息。");
	        out.println(resultJson);
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
