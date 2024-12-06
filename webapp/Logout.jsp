<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- Logout.jsp --%>
<%
    // Invalidate the session
    session.invalidate();
    // Redirect to the login page
    response.sendRedirect("loginpagesample.html");
%>



</body>
</html>