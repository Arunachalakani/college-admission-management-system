

<%@ page import="java.sql.*" %>
<%@ page import="examfees.DBConnection"  %>
<html>
<head>
    <title>Fees Management Report</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Fees Management Report</h2>
    <table border="1">
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Department</th>
            <th>Amount Paid</th>
            <th>Date of Payment</th>
        </tr>
        <%
            try {
                Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT student_id, student_name, department, amount, date_of_payment FROM fees");

                while(rs.next()){
                    String student_id = rs.getString("student_id");
                    String student_name = rs.getString("student_name");
                    String dep = rs.getString("department");
System.out.println(dep);
                    
//--
                   //int rate = 0;
                    int amount_paid = 0; 
                    String departmentName =dep;     // "Arts";  // Example department name, you can dynamically set this

                    try {
                        Connection aconn = DBConnection.getConnection();
                        String sql = "SELECT amount FROM feesupdate WHERE coursetype = ?";
                        PreparedStatement ps = conn.prepareStatement(sql);
                        ps.setString(1, departmentName);
                        
                        ResultSet ars = ps.executeQuery();
                        
                        if (ars.next()) {
                        	amount_paid = rs.getInt("amount");
                        }
                        
                        aconn.close();
                    } catch(Exception e) {
                        e.printStackTrace();
                    }

                    out.println("Rate for " + departmentName + ": " + amount_paid);
                    
  //---                    
                    
                    
                    
                    
                    
                    
                  //  double amount_paid = rs.getDouble("amount");
                    java.sql.Date date_of_payment = rs.getDate("date_of_payment");

                    out.println("<tr>");
                    out.println("<td>" + student_id + "</td>");
                    out.println("<td>" + student_name + "</td>");
                    out.println("<td>" + dep + "</td>");
                    out.println("<td>" + amount_paid + "</td>");
                    out.println("<td>" + date_of_payment + "</td>");
                    out.println("</tr>");
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        out.println("----------+++++++++++-----------");
        %>
    </table>
    <center>
        <br><br>
        <input style="height:100px; width:100px; background-color:green;" type="button" value="print" onclick="window.print()">
    </center>
</body>
</html>












<%-- 

<%@ page import="java.sql.*" %>
<%@ page import="examfees.DBConnection"  %>
<html>
<head>
    <title>Fees Management Report</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Fees Management Report</h2>
    <table border="1">
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Department</th>
            <th>Amount Paid</th>
            <th>Date of Payment</th>
        </tr>
        <%
            try {
                Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT student_id, student_name, department, amount, date_of_payment FROM fees");

                while(rs.next()){
                    String student_id = rs.getString("student_id");
                    String student_name = rs.getString("student_name");
                    String dep = rs.getString("department");
                    double amount_paid = rs.getDouble("amount");
                    java.sql.Date date_of_payment = rs.getDate("date_of_payment");

                    out.println("<tr>");
                    out.println("<td>" + student_id + "</td>");
                    out.println("<td>" + student_name + "</td>");
                    out.println("<td>" + dep + "</td>");
                    out.println("<td>" + amount_paid + "</td>");
                    out.println("<td>" + date_of_payment + "</td>");
                    out.println("</tr>");
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <center>
        <br><br>
        <input style="height:100px; width:100px; background-color:green;" type="button" value="print" onclick="window.print()">
    </center>
</body>
</html>


--%>