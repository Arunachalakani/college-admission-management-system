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
    // Check if the user is authenticated
    Boolean isAuthenticated = (Boolean) session.getAttribute("authenticated");
    if (isAuthenticated == null || !isAuthenticated) {
        // If not authenticated, redirect to the login page
        response.sendRedirect("loginpagesample.html");
        return;
    }
%>


</body>
</html>