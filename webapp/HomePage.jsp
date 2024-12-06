<%@ page import="java.sql.* "  %>
<%@ page import="examfees.DBConnection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Admission Fees Details Management</title>

    <style>
        /* General Reset */
        body, h1, h2, h3, p, ul {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
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

        body {
            display: flex;
            min-height: 100vh;
            background-color: #f4f4f4;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #34495e;
            color: #ecf0f1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .sidebar h2 {
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
            width: 100%;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: #ecf0f1;
            text-decoration: none;
            display: block;
            padding: 10px;
            text-align: center;
            transition: background 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #2980b9;
        }

        /* Main Content Styling */
        .main-content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header h1 {
            color: darkred;
            text-align: center;
            width: 100%;
        }

        /* Cards Styling */
        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 20px;
            width: 100%;
        }

        .card {
            padding: 20px;
            border-radius: 10px;
            background-color: #ecf0f1;
            color: #2c3e50;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-icon {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .card-1 {
            background-color: #e74c3c;
            color: #fff;
        }

        .card-2 {
            background-color: #27ae60;
            color: #fff;
        }

        .card-3 {
            background-color: #f39c12;
            color: #fff;
        }

        .card-4 {
            background-color: #2980b9;
            color: #fff;
        }

        footer {
            background-color: skyblue;
            text-align: center;
            color: darkred;
            height: 40px;
            padding: 30px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Dashboard</h2>
        <ul>
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="Studentdet.jsp">Students</a></li>
            <li><a href="departmentfeesfixed.html">Department</a></li>
            <li><a href="bill.html">Bill Page and Receipt</a></li> 
            <li><a href="payment.jsp">Payments</a></li>
            <li><a href="Hosteler.jsp">Hosteler</a></li>
            <li><a href="Dayscholar.jsp">Dayscholar</a></li>
            <li><a href="aboutus.html">About Us</a></li>
            <li><a href="loginpagesample.html">Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Admission Fees Details Management</h1>
        </div>

          
          
          
        <%  
            int studentCount = 0;
            int bussCount = 0;
            int messCount = 0;
            int tutCount = 0;
            int AmountCount = 0;
            int DayscholarCount = 0;
            int HostelerCount = 0;
            try { 
                Connection conn = DBConnection.getConnection();
                String query = "SELECT COUNT(id) FROM feescomplete";
                PreparedStatement pst = conn.prepareStatement(query);
                ResultSet rs = pst.executeQuery();
                  rs.next();
                  studentCount = rs.getInt(1);
                  
                  
                  
                  
                  String quer = "SELECT COUNT(bus_fee) FROM feescomplete where bus_fee = 2000 ";
                  PreparedStatement pst1 = conn.prepareStatement(quer);
                  ResultSet rs1 = pst1.executeQuery();
                    rs1.next();
                  bussCount = rs1.getInt(1);

                  
                  
                  String que = "SELECT COUNT(mess_fee) FROM feescomplete where mess_fee = 2000 ";
                  PreparedStatement pst2 = conn.prepareStatement(que);
                  ResultSet rs2 = pst2.executeQuery();
                    rs2.next();
                  messCount = rs2.getInt(1);
                  
                  
                  
                  
                  String quo = "SELECT COUNT(tution_fee) FROM feescomplete where tution_fee = 2000 ";
                  PreparedStatement pst3 = conn.prepareStatement(quo);
                  ResultSet rs3 = pst3.executeQuery();
                    rs3.next();
                  tutCount = rs3.getInt(1);
                  
                  

                  
                  
                  String quor = "SELECT SUM(total_amount) FROM feescomplete";
                  PreparedStatement pst4 = conn.prepareStatement(quor);
                  ResultSet rs4 = pst4.executeQuery();
                    rs4.next();
                  AmountCount = rs4.getInt(1);
                  
                  
               
                  String popr= "SELECT COUNT(id) FROM feescomplete where bus_fee = 2000";
                  PreparedStatement pst5 = conn.prepareStatement(popr);
                  ResultSet rs5 = pst5.executeQuery();
                     rs5.next();
                  DayscholarCount = rs5.getInt(1);
                  
                  
                  
                  
                  String poprg= "SELECT COUNT(id) FROM feescomplete where bus_fee = 2000 and room_fee = 3000";
                  PreparedStatement pst6 = conn.prepareStatement(poprg);
                  ResultSet rs6 = pst6.executeQuery();
                     rs6.next();
                  HostelerCount = rs6.getInt(1);
                  
                  
                  
                  
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
          
          
          

        <!-- Cards Section -->
        <div class="cards">
        <a href="stu.jsp" style="text-decoration: none; color: inherit;">
            <div class="card card-1">
                <i class="fa fa-user card-icon"></i>
                <h3>Students</h3>
                <p><%= studentCount %></p>
             <!--     <button onclick="window.location.href='stu.jsp'">Go to Fill Page</button>                           
                 <button onclick="window.location.href='stu.jsp'" style="margin-top: 10px; padding: 10px; background-color: #34495e; color: white; border: none; border-radius: 5px; cursor: pointer;">Go to Fill Page</button>
             -->
            </div>
        </a>
        
        <a href="Buss.jsp" style="text-decoration: none; color: inherit;">
            <div class="card card-2">
                <i class="fa fa-bus card-icon"></i>
                <h3>Bus</h3>
                <p><%= bussCount %></p>
            </div>
        </a>
        
        
        <a href="Mess.jsp" style="text-decoration: none; color: inherit;">    
            <div class="card card-3">
                <i class="fa fa-cutlery card-icon"></i>
                <h3>Mess</h3>
                <p><%= messCount %></p>
            </div>
         </a>   
            
         <a href="tut.jsp" style="text-decoration: none; color: inherit;">   
            <div class="card card-4">
                <i class="fa fa-book card-icon"></i>
                <h3>Tution</h3>
                <p><%= tutCount %></p>
            </div>
         </a>
         
         <a href="tut.jsp" style="text-decoration: none; color: inherit;">   
            <div class="card card-2">
                <i class="fa fa-money card-icon"></i>
                <h3>Total Amounts</h3>
                <p><%= AmountCount %></p>
            </div>
          </a>  
            
            
          <a href="Studentdet.jsp" style="text-decoration: none; color: inherit;">  
            <div class="card card-1">
                <i class="fa fa-users card-icon"></i>
                <h3> Student Details </h3>
            </div>
          </a>  
            
            
          <a href="Dayscholar.jsp" style="text-decoration: none; color: inherit;">  
            <div class="card card-3">
                <i class="fa fa-car card-icon"></i>
                <h3>Dayscholar</h3>
                <p><%= studentCount - HostelerCount  %>   </p>
            </div>
          </a>  
            
            
          <a href="Hosteler.jsp" style="text-decoration: none; color: inherit;">  
            <div class="card card-4">
                <i class="fa fa-bed card-icon"></i>
                <h3>Hosteler</h3>
                <p><%= HostelerCount %>
            </div>
          </a>  
        </div>

       <!--   <footer>
            <h1>  Footer Content     </h1>
        </footer>     -->
    </div>
    
</body>
</html>
















<%-- 

<%@ page import="java.sql.*" %>
<%@ page import="examfees.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Admission Fees Details Management</title>

    <style>
        /* Your existing styles here */
        /* General Reset */
        body, h1, h2, h3, p, ul {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
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

        body {
            display: flex;
            min-height: 100vh;
            background-color: #f4f4f4;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #34495e;
            color: #ecf0f1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .sidebar h2 {
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
            width: 100%;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: #ecf0f1;
            text-decoration: none;
            display: block;
            padding: 10px;
            text-align: center;
            transition: background 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #2980b9;
        }

        /* Main Content Styling */
        .main-content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header h1 {
            color: darkred;
            text-align: center;
            width: 100%;
        }

        /* Cards Styling */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            padding: 20px;
            border-radius: 10px;
            background-color: #ecf0f1;
            color: #2c3e50;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-1 {
            background-color: #e74c3c;
            color: #fff;
        }

        .card-2 {
            background-color: #27ae60;
            color: #fff;
        }

        .card-3 {
            background-color: #f39c12;
            color: #fff;
        }

        .card-4 {
            background-color: #2980b9;
            color: #fff;
        }

        footer {
            background-color: skyblue;
            text-align: center;
            color: darkred;
            height: 40px;
            padding: 30px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Dashboard</h2>
        <ul>
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="Studentdet.jsp">Students</a></li>
            <li><a href="departmentfeesfixed.html">Department</a></li>
            <li><a href="bill.html">Bill Page and Receipt</a></li> 
            <li><a href="payment.jsp">Payments</a></li>
            <li><a href="Hosteler.jsp">Hosteler</a></li>
            <li><a href="Dayscholar.jsp">Dayscholar</a></li>
            <li><a href="aboutus.html">About Us</a></li>
            <li><a href="loginpagesample.html">Login</a></li>

        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Admission Fees Details Management</h1>
        </div>



 
            <a href="loginpagesample.html" class="home-button">
            <i class="fa fa-power-off" style="font-size:24px;"></i> 
           <b> Logout  </b>
        </a>     
        <br>

        <%  
            int studentCount = 0;
            int bussCount = 0;
            int messCount = 0;
            int tutCount = 0;
            int AmountCount = 0;
            try { 
                Connection conn = DBConnection.getConnection();
                String query = "SELECT COUNT(id) FROM feescomplete";
                PreparedStatement pst = conn.prepareStatement(query);
                ResultSet rs = pst.executeQuery();
                  rs.next();
                  studentCount = rs.getInt(1);
                  
                  
                  
                  
                  String quer = "SELECT COUNT(bus_fee) FROM feescomplete where bus_fee = 2000 ";
                  PreparedStatement pst1 = conn.prepareStatement(quer);
                  ResultSet rs1 = pst1.executeQuery();
                    rs1.next();
                  bussCount = rs1.getInt(1);

                  
                  
                  String que = "SELECT COUNT(mess_fee) FROM feescomplete where mess_fee = 2000 ";
                  PreparedStatement pst2 = conn.prepareStatement(que);
                  ResultSet rs2 = pst2.executeQuery();
                    rs2.next();
                  messCount = rs2.getInt(1);
                  
                  
                  
                  
                  String quo = "SELECT COUNT(tution_fee) FROM feescomplete where tution_fee = 2000 ";
                  PreparedStatement pst3 = conn.prepareStatement(quo);
                  ResultSet rs3 = pst3.executeQuery();
                    rs3.next();
                  tutCount = rs3.getInt(1);
                  
                  

                  
                  
                  String quor = "SELECT SUM(total_amount) FROM feescomplete";
                  PreparedStatement pst4 = conn.prepareStatement(quor);
                  ResultSet rs4 = pst4.executeQuery();
                    rs4.next();
                  AmountCount = rs4.getInt(1);
                  
                  
                  
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>

        <div class="form-container">
            <div class="cards">
                <div class="card card-1">
                    <h3>Students</h3>
                    <p><%= studentCount %></p>
                    <button onclick="window.location.href='stu.jsp'"></button>                           
                </div>
                <div class="card card-2">
                    <h3>Bus</h3>
                    <p><%=  bussCount  %></p>
                    <button onclick="window.location.href='Buss.jsp'">Go to Fill Page</button>   
                </div>
                <div class="card card-3">
                    <h3>Mess</h3>
                    <p><%= messCount %></p>
                    <button onclick="window.location.href='Mess.jsp'">Go to Fill Page</button>   
                </div>
                <div class="card card-4">
                    <h3>Tution</h3>
                    <p><%= tutCount  %></p>
                    <button onclick="window.location.href='tut.jsp'">Go to Fill Page</button>                      
                </div>
                
                
                <div class="card card-2">
                    <h3>Total Amounts</h3>
                    <p><%= AmountCount  %></p>
                    <button onclick="window.location.href='tut.jsp'">Go to Fill Page</button>                      
                </div>
                
                <div class="card card-1" >  <h3> All Students  </h3>
                  <button onclick="window.location.href='Studentdet.jsp'">   Go To the Page </button>
                </div>
                
                 <div class="card card-3">  <h3> Dayscholar  </h3>   <button onclick="window.location.href='Dayscholar.jsp'">   Go To the Page </button>
                </div>
                
                 <div class="card card-4"> <h3> Hosteler </h3>  <button onclick="window.location.href='Hosteler.jsp'">   Go To the Page </button>
                </div>
                
            </div>    
        </div>

        <footer>
            <h1>Footer Content</h1>
        </footer>
    </div>
    
 </body>
</html>
--%>