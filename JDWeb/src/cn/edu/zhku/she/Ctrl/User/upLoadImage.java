package cn.edu.zhku.she.Ctrl.User;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/servlet/upLoadImage")
public class upLoadImage extends HttpServlet {

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
	@SuppressWarnings("unused")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//�洢·��
        String savePath = request.getServletContext().getRealPath("/uploadFile/user");
        //��ȡ�ϴ����ļ�����
        Collection<Part> parts = request.getParts();
        //�ϴ������ļ�
        //Servlet3.0��multipart/form-data��POST�����װ��Part��ͨ��Part���ϴ����ļ����в�����
        //Part part = parts[0];//���ϴ����ļ������л�ȡPart����
        Part part = request.getPart("file");//ͨ����file�ؼ�(<input type="file" name="file">)������ֱ�ӻ�ȡPart����
         //Servlet3û���ṩֱ�ӻ�ȡ�ļ����ķ���,��Ҫ������ͷ�н�������
        //��ȡ����ͷ������ͷ�ĸ�ʽ��form-data; name="file"; filename="snmp4j--api.zip"
        String header = part.getHeader("content-disposition");
        //��ȡ�ļ���
        String fileName = getFileName(header);
         //���ļ�д��ָ��·��
        part.write(savePath+File.separator+fileName);
//        System.out.println(savePath+File.separator+fileName);
        String localhostPath = "uploadFile/user/" + fileName;
        out.print(localhostPath);
        out.flush();
		out.close();
	}
	public String getFileName(String header) {
	        /**
	         * String[] tempArr1 = header.split(";");����ִ����֮���ڲ�ͬ��������£�tempArr1���������������������
	         * �������google������£�tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
	         * IE������£�tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
	         */
	        String[] tempArr1 = header.split(";");
	        /**
	         *�������google������£�tempArr2={filename,"snmp4j--api.zip"}
	         *IE������£�tempArr2={filename,"E:\snmp4j--api.zip"}
	        */
			 String[] tempArr2 = tempArr1[2].split("=");
	       //��ȡ�ļ��������ݸ����������д��
	        String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\")+1).replaceAll("\"", "");
	        return fileName;
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
