<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="image/png" %> 
<%@ page import="cn.edu.zhku.she.Util.CheckedCode" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	CheckedCode image = new CheckedCode();
	String str = image.getCheckCode(response.getOutputStream());
	// 将认证码存入session  
    session.setAttribute("checkcode", str);
    out.clear();  
    out = pageContext.pushBody(); 
%>

