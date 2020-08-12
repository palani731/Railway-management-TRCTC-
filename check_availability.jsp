<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("a")%>
<%=session.getAttribute("src")%>
<%=session.getAttribute("dest")%>
<%=session.getAttribute("dat")%>
<%String t_num=request.getParameter("t_num");%>
<%String src=request.getParameter("src");%>
<%String dest=request.getParameter("dest");%>
    <% session.setAttribute("t_num",t_num);%>
    <% String dat=(String)session.getAttribute("dat"); %>
<%Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:PALANI1","system","Pal731731");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select coach_no,seat_no from coaches where train_no='"+t_num+"' and departure_date='"+dat+"'");
//if(rs.next())
{
String avail;
int x=0;
int y=0;
%>
<table>
		<tr>
			<th>Class</th>
			<th>Availability</th>
        </tr>
<%
while(rs.next())
{
	avail=rs.getString("seat_no");
	x=Integer.parseInt(avail);
	y=16-x;
	%><tr>
		<td><%=rs.getString("coach_no")%></td>
		<td><% out.print(y);%></td>
	</tr>
<%
} 
%>
</table>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<form method="post" action="book_ticket.jsp">
	coach:<input type="text" name="coach" />
	No.of passengers<input type="number" name="pass_no" max="4" />
	<input type="submit" value="book" />
</form>

</body>
</html>
<% } 
//else 
//response.sendRedirect("booking.html");
%>