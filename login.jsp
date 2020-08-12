<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% String a=request.getParameter("a");
String b=request.getParameter("psw");
Connection con=null;
  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","Madurai123");
    Statement statement=con.createStatement();
    String command="select email,password from reg_user where email='"+a+"' and password='"+b+"'";
    ResultSet rs=statement.executeQuery(command);
    if (rs.next()) {
    	response.sendRedirect("menu page.html");
    }
    else{
    response.sendRedirect("login1.html");
}
%>