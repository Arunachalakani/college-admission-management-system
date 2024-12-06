<%@ page import="java.sql.* " %>
<%@ page import="examfees.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" type="text/css"  href="New.css">

</head>
<style> 
    
.h-button {
 
 position: absolute;
    top: 20px;
    left: 20px;
    background-color: #ff6b6b;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.h-button:hover {
    background: linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
}



     .home-button {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Home button hover effect */
        .home-button:hover {
            background:  linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
        }


</style>
<input type="button" value="Go Back" class="h-button"   onclick="window.location.href='departmentfeesfixed.html'">
<body>
<center>
<h1>  Fees List   </h1>


<a href="HomePage.jsp">
     <input type="button"  class="home-button"  value="Home">
</a>

<%
try{
	
	Connection conn=DBConnection.getConnection();
    Statement st=conn.createStatement();
    ResultSet rs=st.executeQuery("select * from feesupdate");
int i=0;
%>
<table border="5px solid red">
<tr><th><b>  Course Type   </b></th>   <th><b>  Amount </b></th>   </tr>
<%
while(rs.next())
  {
	i++;
%>
<tr>
 <td><%= rs.getString(1)  %> </td>
 <td><%= rs.getInt(2)  %> </td>
</tr>
<%
}
}
catch(Exception e){
	e.printStackTrace();
}

%>
</table>
</center>

</body>
</html>
