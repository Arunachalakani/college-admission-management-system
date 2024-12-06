<%@ page import="java.sql.* "  %>
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

String sample=request.getParameter("dtype");
session.setAttribute("name", sample);
%>
try{
Connection conn=DBConnection.getConnection();
String query="select amount from feesupdate where coursetype="+sample+"";
preparedstatement st=conn.prepareStatement(query);
Resultset rs=st.executeQuery();
while(rs.next()){
   int aa=rs.nextInt();    
}

}
catch(Exception e){
   e.printStackTrace();
}
</body>
</html>