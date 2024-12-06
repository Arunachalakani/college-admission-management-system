<%@ page import="java.sql.* " %>
<%@ page import="examfees.DBConnection" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        li:last-child {
            border-bottom: none;
        }

        .delete-btn {
            background-color: #ff4d4d;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: #ff1a1a;
        }
    </style>
</head>
<body>
<%    
try
{
int ide=Integer.parseInt(request.getParameter("id")); 
ide--;

Connection conn=DBConnection.getConnection();
String sql="delete from student where sid in(select sid from student OFFSET "+ ide +" LIMIT 1) ";
PreparedStatement ps=conn.prepareStatement(sql);

if(ps.executeUpdate()>0){
	
	out.println(" alert('delete Sucessfully ');  ");
	response.sendRedirect("viewstudent.jsp");
  }
else{
	out.println(" alert('delete row  not successfully');   ");
	response.sendRedirect("viewstudent.jsp");
}



}
catch(Exception e){
e.printStackTrace();	
}

%>


</body>
</html>


<!--  
    <div class="container">
        <h1>Staff Details</h1>
        <ul id="staffList">
            <li>
                <span>John Doe - johndoe@example.com</span>
                <button class="delete-btn" onclick="deleteStaff(this)">Delete</button>
            </li>
            <li>
                <span>Jane Smith - janesmith@example.com</span>
                <button class="delete-btn" onclick="deleteStaff(this)">Delete</button>
            </li>
            <li>
                <span>Emily Johnson - emilyj@example.com</span>
                <button class="delete-btn" onclick="deleteStaff(this)">Delete</button>
            </li>
        </ul>
    </div>
    <script>
        function deleteStaff(button) {
            const listItem = button.parentElement;
            listItem.remove();
        }
    </script>
-->




<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>         -->