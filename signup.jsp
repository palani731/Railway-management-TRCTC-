        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
  <%String name= request.getParameter("a");
    String gender=request.getParameter("c");
    String ph= request.getParameter("h");
    String email = request.getParameter("f");
    String age = request.getParameter("d");
    String password = request.getParameter("psw");
    String secqs= request.getParameter("e");
    String secans= request.getParameter("g");
  Connection con=null;
  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","Madurai123");
    Statement statement=con.createStatement();
       statement.executeUpdate("insert into reg_user(name,gender,age,mob_number,password,email,securityq,securitya) values('"+name+"','"+gender+"','"+age+"','"+ph+"','"+password+"','"+email+"','"+secqs+"','"+secans+"')");
       response.sendRedirect("login.html");
%>

