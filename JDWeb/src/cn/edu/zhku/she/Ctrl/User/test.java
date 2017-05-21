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
        //存储路径
        String savePath = request.getServletContext().getRealPath("/uploadFile/user");
        //获取上传的文件集合
         Collection<Part> parts = request.getParts();
        //上传单个文件
        if (parts.size()==1) {
             //Servlet3.0将multipart/form-data的POST请求封装成Part，通过Part对上传的文件进行操作。
            //Part part = parts[0];//从上传的文件集合中获取Part对象
            Part part = request.getPart("file");//通过表单file控件(<input type="file" name="file">)的名字直接获取Part对象
             //Servlet3没有提供直接获取文件名的方法,需要从请求头中解析出来
            //获取请求头，请求头的格式：form-data; name="file"; filename="snmp4j--api.zip"
            String header = part.getHeader("content-disposition");
            //获取文件名
             String fileName = getFileName(header);
             //把文件写到指定路径
            part.write(savePath+File.separator+fileName);
            System.out.println(savePath+File.separator+fileName);
            System.out.println(savePath);
            System.out.println(File.separator);
            System.out.println(fileName);
            String localhostPath = "uploadFile/user/" + fileName;
            out.print(localhostPath);
         }else {
             //一次性上传多个文件
             for (Part part : parts) {//循环处理上传的文件
                 //获取请求头，请求头的格式：form-data; name="file"; filename="snmp4j--api.zip"
                 String header = part.getHeader("content-disposition");
                 //获取文件名
                 String fileName = getFileName(header);
                 //把文件写到指定路径
                 part.write(savePath+File.separator+fileName);
                 System.out.println(savePath+File.separator+fileName);
             }
             out.println("上传成功");
         }	
//		// 为了简单，后面也直接就以fileName作为保存文件的名称
//		Part file = request.getPart("file");
//		String fileName = request.getParameter("file")+".jpg";
//		
//		out.println("上传文件的类型为：" +file.getContentType() +  "<br />"); 
//		out.println("上传文件的大小为：" + file.getSize() + "<br />");
//		Collection<String> headerNames = file.getHeaderNames();
//		// 遍历文件上传域的Header Name
//		for (String headerName : headerNames) {
//			out.println(headerName + "---->" + file.getHeader(headerName) + "<br />");
//		}
//		// 将文件保存到项目下的uploads文件夹下，为了简单这里没写判断目录是否存在及创建目录的操作，要先确保该目录已经存在
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
		          * String[] tempArr1 = header.split(";");代码执行完之后，在不同的浏览器下，tempArr1数组里面的内容稍有区别
		          * 火狐或者google浏览器下：tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
		          * IE浏览器下：tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
		          */
		         String[] tempArr1 = header.split(";");
		         /**
		          *火狐或者google浏览器下：tempArr2={filename,"snmp4j--api.zip"}
		          *IE浏览器下：tempArr2={filename,"E:\snmp4j--api.zip"}
		         */
				 String[] tempArr2 = tempArr1[2].split("=");
		        //获取文件名，兼容各种浏览器的写法
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
