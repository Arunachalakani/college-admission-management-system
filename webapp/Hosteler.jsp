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
            background-color: #45a049;
        }


</style>

<body>

<a href="HomePage.jsp">
     <input type="button"  class="home-button"  value="Home">
</a>

<center>
<h1><b>   Hostel Students          </b></h1>
</center>
<% 
try{
Connection conn=DBConnection.getConnection();
String query="select id,rollno,name,department_type,shift_type,phone from feescomplete  where bus_fee = 2000 and room_fee = 3000 order by id";

PreparedStatement ps=conn.prepareStatement(query);
ResultSet rs=ps.executeQuery();
%>
<table border="1">
<center>
<tr> <th>  ID </th>     <th> Roll NO  </th>     <th>  Name  </th>      <th>  Department_Type   </th>     <th>  Shift_Type  </th>     <th>  Phone  </th>   </tr>   
<%
while(rs.next())
{ 
%>
<tr>
<td><%= rs.getInt(1) %> </td>
<td><%= rs.getString(2) %>  </td> 
<td><%= rs.getString(3) %>  </td>
<td><%= rs.getString(4) %>  </td>
<td><%= rs.getString(5) %>  </td>
<td><%= rs.getString(6) %>  </td>
</tr>
<% 
}
}
catch(Exception e){
	e.printStackTrace();
}


%>


</center>
</table>
</body>
</html>