<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.nilesh.DAO.*" %>
    <%@page import="com.nilesh.model.*" %>
<%
System.out.println("logincheck.jsp");
String name=request.getParameter("uname");
String pass=request.getParameter("pass");

if(name==null||name.length()<=0||name==""||pass==null||pass.length()<=0||pass==""){
	System.out.println("Invalid UserName or Password !!");
	response.sendRedirect("login.jsp?msg=Invalid UserName or Password !!");
//}else if((name.equalsIgnoreCase("admin")&&pass.equalsIgnoreCase("admin"))||(name.equalsIgnoreCase("dinesha")&&pass.equalsIgnoreCase("dinesha"))||(name.startsWith("2018"))){
}else{
	StudentDAO dao=new StudentDAO();
	Student st=dao.checklogin(name, pass);
			if(st.getStatus()>0){
	System.out.println("success !! "+name+" pass : "+pass);
	response.sendRedirect("index.jsp");
	}else {
		response.sendRedirect("login.jsp?msg=Invalid UserName or Password !!");
		
	}
}


%>