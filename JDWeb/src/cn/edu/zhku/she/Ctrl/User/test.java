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
		
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
        //�洢·��
        String savePath = request.getServletContext().getRealPath("/uploadFile/user");
        //��ȡ�ϴ����ļ�����
         Collection<Part> parts = request.getParts();
        //�ϴ������ļ�
        if (parts.size()==1) {
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
            System.out.println(savePath+File.separator+fileName);
            System.out.println(savePath);
            System.out.println(File.separator);
            System.out.println(fileName);
            String localhostPath = "uploadFile/user/" + fileName;
            out.print(localhostPath);
         }else {
             //һ�����ϴ�����ļ�
             for (Part part : parts) {//ѭ�������ϴ����ļ�
                 //��ȡ����ͷ������ͷ�ĸ�ʽ��form-data; name="file"; filename="snmp4j--api.zip"
                 String header = part.getHeader("content-disposition");
                 //��ȡ�ļ���
                 String fileName = getFileName(header);
                 //���ļ�д��ָ��·��
                 part.write(savePath+File.separator+fileName);
                 System.out.println(savePath+File.separator+fileName);
             }
             out.println("�ϴ��ɹ�");
         }	
//		// Ϊ�˼򵥣�����Ҳֱ�Ӿ���fileName��Ϊ�����ļ�������
//		Part file = request.getPart("file");
//		String fileName = request.getParameter("file")+".jpg";
//		
//		out.println("�ϴ��ļ�������Ϊ��" +file.getContentType() +  "<br />"); 
//		out.println("�ϴ��ļ��Ĵ�СΪ��" + file.getSize() + "<br />");
//		Collection<String> headerNames = file.getHeaderNames();
//		// �����ļ��ϴ����Header Name
//		for (String headerName : headerNames) {
//			out.println(headerName + "---->" + file.getHeader(headerName) + "<br />");
//		}
//		// ���ļ����浽��Ŀ�µ�uploads�ļ����£�Ϊ�˼�����ûд�ж�Ŀ¼�Ƿ���ڼ�����Ŀ¼�Ĳ�����Ҫ��ȷ����Ŀ¼�Ѿ�����
//		file.write(getServletContext().getRealPath("/uploads") + "/" + fileName);
		
//		Part file = request.getPart("file");
//		String header = file.getHeader("content-disposition");
//		String filename = ((header.split(";")[2]).split("=")[1]).replaceAll("\"", "");
//		String extname = filename.substring(filename.lastIndexOf('.')+1);
//		String newfilename = System.currentTimeMillis()+extname;
//		String uploadpath = getServletContext().getRealPath("/upload");
//		try{
//			file.write(uploadpath+File.separator+newfilename);
//			out.println("1 file uploaded.<br>");
//			out.println("file description:");
//		}catch(IOException e){
//			out.println("Unable to upload the file.<br>");
//			out.println("Error:"+e.toString());
//		}
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
