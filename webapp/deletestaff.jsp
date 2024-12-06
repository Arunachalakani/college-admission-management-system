<%@ page import="java.sql.* " %>
<%@ page import="examfees.DBConnection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try
{
int ide=Integer.parseInt(request.getParameter("id"));
	
Connection conn=DBConnection.getConnection();
String sql="delete from staff where sid in(select sid from staff OFFSET "+ ide +" LIMIT 1 )";
PreparedStatement ps=conn.prepareStatement(sql);

if(ps.executeUpdate()>0){
	out.println("alert('delete sucessfully')");
	response.sendRedirect("viewstaff.jsp");
}
else
{
	out.println("alert('delete not sucessfully') ");
	response.sendRedirect("viewstaff.jsp");
}



}
catch(Exception e){
	e.printStackTrace();
}

%>

</body>
</html>