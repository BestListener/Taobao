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
		//  ��list���洫�ݹ����Ĳ�������
		List datas = new ArrayList();
		//  ��ȡǰ̨���ݹ�����json����
		String acceptjson = "";  
        try {  
        	//  ��ȡpost��ʽ���ݵ����ݰ�ͷ����
            BufferedReader br = new BufferedReader(new InputStreamReader(
            		(ServletInputStream) request.getInputStream(), "utf-8"));  
            StringBuffer sb = new StringBuffer("");  
            String temp;  
            while ((temp = br.readLine()) != null) {  
                sb.append(temp);
            }  
            br.close();
            acceptjson = sb.toString();
            //  ����ȡ��json�����ַ�������
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
        //  ��ȡ�û�uid
        HttpSession session = request.getSession();
		String uid = session.getAttribute("uid").toString();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//�������ڸ�ʽ
		String date = df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
		//  ����û���Ϣ������
		if( service.isUserInfoNull(uid) )
		{
			//  ��������Ϣ����ȡ�û����ﳵ�еĲ�Ʒ��
			String sum = null;
			sum = service.settleMentUserOrder(datas,uid,date);
			//  �������ɹ�
			if( sum != null )
			{
				String username = "";
				String userImg = "";
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
				String cookieParams[] = {uid,username,userImg,sum};
				CookieUtil ck = new CookieUtil("mycookie",cookieParams);
				Cookie mycookie = ck.getCookie();
				//  ����µ�cookie
				response.addCookie(mycookie);
				// ����json����
				JSONObject resultJson = new JSONObject();
		        resultJson.put("flag", "true");
		        out.println(resultJson);
			}
			else		//  ����ʧ��
			{
				// ����json����
				JSONObject resultJson = new JSONObject();
		        resultJson.put("flag", "false");
		        out.println(resultJson);
			}
		}
		else
		{
			// ����json����
			JSONObject resultJson = new JSONObject();
	        resultJson.put("flag", "����ǰ�����������������ĸ�����Ϣ��");
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
