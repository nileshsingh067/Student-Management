<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("logincheck.jsp");
String name=request.getParameter("uname");
String pass=request.getParameter("pass");

if(name==null||name.length()<=0||name==""||pass==null||pass.length()<=0||pass==""){
	System.out.println("Invalid UserName or Password !!");
	response.sendRedirect("login.jsp?msg=Invalid UserName or Password !!");
}else if((name.equalsIgnoreCase("admin")&&pass.equalsIgnoreCase("admin"))||(name.equalsIgnoreCase("dinesha")&&pass.equalsIgnoreCase("dinesha"))||(name.startsWith("2018"))){
	
	//admin login
	System.out.println("success !! "+name+" pass : "+pass);
	response.sendRedirect("index.jsp");
}else {
	response.sendRedirect("login.jsp?msg=Invalid UserName or Password !!");
	
}


%>