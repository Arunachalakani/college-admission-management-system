<%@ page import="java.sql.*" %>
<%@ page import="examfees.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>





<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<center>
<h1>   ALL PAYMENTS     </h1>
<style>
/* General styling for the body */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

button {
    margin: auto;
    background-color: red;
    box-shadow: 0 0 10px rgba(10,12,20,0.5);
}

/* Center the table and set a maximum width */
table {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Table header styling */
table th {
    background-color: #f44336;
    color: white;
    font-weight: bold;
    padding: 10px;
    text-align: center;
}

/* Table row styling */
table tr {
    border-bottom: 1px solid #dddddd;
}

table tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tr:hover {
    background-color: #f1f1f1;
}

/* Table data cells */
table td {
    padding: 8px 12px;
    text-align: center;
    color: #333;
}

/* Table borders */
table, th, td {
    border: 2px solid #f44336;
}

/* Center heading */
h1 {
    text-align: center;
    color: #333;
}

/* Styles for the container wrapping the table */
.container {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Center the heading and apply padding */
h1 {
    color: #333;
    font-size: 28px;
    padding-bottom: 20px;
    font-family: 'Arial', sans-serif;
}

/* Add custom scrollbars */
table {
    overflow-x: auto;
}

::-webkit-scrollbar {
    width: 12px;
}

::-webkit-scrollbar-track {
    background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
    background-color: #f44336;
    border-radius: 6px;
    border: 3px solid #f1f1f1;
}

.h-button {
 
 position: absolute;
    top: 20px;
    right: 20px;
    background-color: green;  <%--#ff6b6b;   --%>
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


</style>
<input type="button"  class="h-button"  value="Home"  onclick="window.location.href='HomePage.jsp'" > 

<%
try{
	Connection conn=DBConnection.getConnection();
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("select * from feescomplete order by id");
	int i=0;
	%>
	<table border="5px solid red"> 
	<center>
<tr><th>Serial No  </th>       <th>Student Roll NO</th>            <th>Name</th>            <th>Phone</th>             <th>Department_Type</th>           <th>Shift_Type</th>            <th>Tution_fee</th>            <th>Mess_fee</th>            <th>Bus_fee</th>            <th>Lab_Fee</th>            <th>Room_Fee</th>            <th>Total_amount</th>             <th>Submission_time</th> </tr>
	<%
	while(rs.next()){
	   i++;
	%>	
	 <tr>
	    <td> <%=  rs.getInt(1)   %> </td>
        <td> <%=  rs.getString(2) %></td>		
        <td> <%=  rs.getString(3)   %> </td>
        <td> <%=  rs.getString(4) %></td>	
        <td> <%=  rs.getString(5)   %> </td>
        <td> <%=  rs.getString(6) %></td>	
        <td> <%=  rs.getInt(7)   %> </td>
        <td> <%=  rs.getInt(8) %></td>	
        <td> <%=  rs.getInt(9) %></td>	
        <td> <%=  rs.getInt(10) %></td>
        <td> <%=  rs.getTimestamp(11) %></td>
        <td> <%=  rs.getInt(12) %></td>	
        <td> <%=  rs.getInt(13)  %> </td>
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
<footer> <pre>


</pre>      </footer>

</body> 
</html>          




