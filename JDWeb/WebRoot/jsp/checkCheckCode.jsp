<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String input = request.getParameter("ckCode");
String checkCode = String.valueOf(session.getAttribute("checkcode"));
if( input.toUpperCase().equals(checkCode.toUpperCase()) )
{
	out.print("true");
}
else
	out.print("false");
%>

