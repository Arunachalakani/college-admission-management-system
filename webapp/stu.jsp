
<%@  page import="java.sql.* " %>
<%@  page import="examfees.DBConnection " %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="Stylesheet" type="text/css"  href="New.css" > 
<style>
     .home-button {
            position: absolute;
            top: 10px;
            left: 10px;
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


.ho-button, .hom-button {
    margin: 10px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    display: inline-block;
}

/* Button hover effect */
.ho-button:hover, .hom-button:hover {
    background-color: #45a049;
}





    /* Style the table */
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        background-color: #f9f9f9;
    }

    /* Style the table header */
    th {
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        font-size: 16px;
        text-align: left;
    }

    /* Style the table data */
    td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    /* Add zebra stripes to the table rows */
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    /* Add hover effect */
    tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    /* Center the table */
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #e0f7fa;
    }

    h1 {
        text-align: center;
        font-family: 'Arial', sans-serif;
        color: #333;
    }

</style>

</head>

<body>
<!--  
<center>
<label for="search-box">Search by Name or Department:</label>
<input type="text" id="search-box" placeholder="Enter Name or Department..." onkeyup="searchFunction()">
</center>
-->
<form action="" method="post">
<div class="form-group">
                <label for="dtment">Department Type:</label>
                <select id="dtment" name="dtment" required>
                    <option value="">Select a Department Type</option>
                    <option value="Tamil">Tamil</option>
                    <option value="English">English</option>
                    <option value="Economics">Economics</option>
                    <option value="ComputerScience">Computer Science</option>
                    <option value="Maths">Maths</option>
                    <option value="Physics">Physics</option>
                    <option value="Chemistry">Chemistry</option>
                    <option value="Microbiology">Microbiology</option>
                    <option value="Zoology">Zoology</option>
                    <option value="BBA">BBA</option>
                    <option value="BCom">BCom</option>
                    <option value="Wiscom">Wiscom</option>
               </select>
         </div>
         
<input type="submit"  class="hom-button" value="Submit" >
</form>
<input type="submit" onclick="window.location.href='stu.jsp'"  class="ho-button" name="dtment" value="View All"   >



<a href="HomePage.jsp">
    <input type="button" class="home-button" value="Home">
</a>
<br>
<%
try{
Connection conn=DBConnection.getConnection();
Statement st=conn.createStatement();
String query="";
String str=request.getParameter("dtment");
String abc="View ALL";
if(str!=null){
  	  query="select * from feescomplete where department_type='"+str+"'";
	}
else{
   query="select * from feescomplete order by id";
}
ResultSet rs=st.executeQuery(query);

int i=0;
%>

<table>
<tr>
<th>S No   </th>     <th> Id </th>   <th> Name </th>   <th> department_type </th>       </tr>
<%
while(rs.next())
{
	
	i++;
%>
<tr>
 <td> <%= rs.getInt(1) %>     </td>
 <td> <%= rs.getString(2) %>  </td>
 <td> <%= rs.getString(3) %>  </td>
 <td> <%= rs.getString(5) %>  </td>
</tr>
<%
}
}
catch(Exception e){
  e.printStackTrace();	
 
}
%>
</table>


</body>
</html>


