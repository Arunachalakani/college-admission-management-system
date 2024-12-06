<%@  page import="java.sql.*"    %>
<%@  page import="examfees.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="style.css">
</head>
<script type="text/javascript">
function run(id){
	if(confirm("ARE You Want to Delete this record"+id)){
		window.location.href="deletestudent.jsp?id="+id;
	}
}

</script>
<input type="button"  value="GO BACK"  onclick="window.location.href='StudentDetails.html'"  >
<body>
<center>
<h1>   VIEW STUDENT DETAILS LIST     </h1>
<%
try{
  Connection conn=DBConnection.getConnection();
  Statement st=conn.createStatement();
  ResultSet rs=st.executeQuery("select * from student");
  int i=0;
  %>
  <table border="5px solid red" >
  <tr><th>  StudentId  </th><th>  StudentName  </th><th>  E_mail  </th><th>  Phonenumber  </th><th>  Address  </th><th>  Edit  </th> </tr>
   <%
   while(rs.next())   
   {
	   i++;
	  //  "window.location.href='deletestudent.jsp'
   %>
   <tr>   
       <td><%=   rs.getInt(1)   %>  </td>
       <td><%=   rs.getString(2)  %>  </td> 
       <td><%=   rs.getString(3)  %>  </td>
       <td><%=   rs.getLong(4)    %>  </td> 
       <td><%=   rs.getString(5)   %>  </td>  
      <td> <input type="button" value="delete" data-row-id="<%= i %>"  onclick="run(<%= i %>)"> </td>
   </tr> 
   
  
  <%    
   }
   }
   catch(Exception e){
	   e.printStackTrace();
   }
  %>
  
</center>  
</body>
</html>