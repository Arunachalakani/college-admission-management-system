<%@ page import="java.sql.*" %>
<%@ page import="examfees.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"> 
</head>
<script type="text/javascript"> 
function run(i){
	if(confirm("Are You Want to DElete this record"+id)){
		window.location.href="deletestaff.jsp?id="id;
	}
}
</script>
<body>
<center>
<h1>  VIEW STAFF DETAILS LIST  </h1>
<input type="button"  value="GO BACK"  onclick="window.location.href='staffDetails.html'"  >
<%
try{
  Connection conn=DBConnection.getConnection();
  Statement st=conn.createStatement();
  ResultSet rs=st.executeQuery("select * from staff");
  int i=0;
  %>
  <table border="2px solid red">
   <tr><th> name	</th> <th> position	 </th> <th> department	</th> <th> email 	</th> <th>  phoneno	</th>   <th> Edit </th> </tr>
  <% 
  while(rs.next())
  {
  %>
  <tr>
     <td> <%= rs.getString(1)  %></td>
     <td> <%= rs.getString(2)  %></td>
     <td> <%= rs.getString(3)  %></td>
     <td> <%= rs.getString(4)  %></td>
     <td> <%= rs.getLong(5)  %></td>
     <td> <input type="button" value="DELETE" data-row-id=<%= i %>  onclick="run(<%= i %>)"></td>   
  </tr>    
 <%
  }
  }
catch(Exception e)
   {
	e.printStackTrace();
   }
  
 
%>




</center>
</body>
</html>