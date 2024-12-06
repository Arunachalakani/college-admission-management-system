<%@ page import="java.sql.*" %>
<%@ page import="examfees.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

        /* Home button hover effect */
        .home-button:hover {
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
    
    input[type="text"] {
            padding: 8px;
            margin: 10px 0;
            width: 200px;
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

  <!--     <input type="submit"  class="ho-button" name="dtment" value="View All"  onclick="Buss.jsp">     --> 


</form>
     
    <input type="submit"  class="ho-button" name="dtment" value="View All"  onclick="window.location.href='Buss.jsp'">  


<!--     <br>
<form action="Buss.jsp" method="post">
<input type="submit"  class="hv-button"   value="Refresh">
</form>  
-->

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
  	  query="select * from feescomplete where department_type='"+str+"' and bus_fee=2000 order by id;";
	}
else{
   query="select * from feescomplete WHERE bus_fee=2000 order by id";
}
ResultSet rs=st.executeQuery(query);
int i=0;
%>
<table>
<th>S No   </th>     <th> Id </th>   <th> Name </th>   <th> department_type </th>         <th> Bus Fees  </th>
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
 <td> <%= rs.getString(9) %>  </td>
</tr>
<%
}
}
catch(Exception e){
  e.printStackTrace();	
 
}
%>
</table>


<%--


////temporary use///////////////

if(abc.equals("View ALL")){
	   query="select * fromo feescomplete";
    } 
	else{	   

///////   use   /////////////








<%   String ee=request.getParameter("dtment");         %>
<%
try{
Connection conn=DBConnection.getConnection();
//Statement st=conn.createStatement();

String query="select id,name,department_type,bus_fee from feescomplete  department_type = ?";
PreparedStatement pst=conn.prepareStatement(query);
pst.setString(1, ee);
ResultSet ras=pst.executeQuery();
int j=0;
%>
<table>
<th> Id </th>   <th> Name </th>   <th> department_type </th>      
<%
while(ras.next())
{
	j++;
%>
<tr>
 <td> <%= ras.getInt(1) %>    </td>
 <td> <%= ras.getString(2) %>    </td>
 <td> <%= ras.getString(3) %>    </td>
</tr>
<%
}
}
catch(Exception e){
  e.printStackTrace();	
 
}
%>
</table>

--%>

<script>
// JavaScript function to filter table based on search input
function searchFunction() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById('search-box');
    filter = input.value.toLowerCase();
    table = document.getElementById('student-table');
    tr = table.getElementsByTagName('tr');

    // Loop through all table rows (excluding the first header row)
    for (i = 1; i < tr.length; i++) {
        tr[i].style.display = 'none'; // Hide the row by default

        // Loop through all table columns in the row
        for (j = 0; j < 3; j++) {
            td = tr[i].getElementsByTagName('td')[j];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toLowerCase().indexOf(filter) > -1) {
                    tr[i].style.display = ''; // Show the row if a match is found
                    break;
                }
            }
        }
    }
}
</script>

</body>
</html>