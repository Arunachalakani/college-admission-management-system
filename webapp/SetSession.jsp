<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- SetSession.jsp --%>
<%
    // Set a session attribute to indicate the user is logged in
    session.setAttribute("authenticated", true);
%>


</body>
</html>