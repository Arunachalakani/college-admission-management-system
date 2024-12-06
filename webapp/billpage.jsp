

<%@ page import="java.sql.*" %>
<%@ page import="examfees.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<%
    String rrr = (String) request.getAttribute("sam");
    Integer feesamount = (Integer) request.getAttribute("feesamount");
    if (feesamount == null) {
        feesamount = 0; // Default value if not set
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Bill Receipt</title>
    <style>
        /* General Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1{
            color: #ffffff;
        }
        h2{
            color: blue;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .header {
            background-color: #4CAF50;
            padding: 20px;
            text-align: center;
            border-radius: 10px 10px 0 0;
            width: 100%;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .date-time {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            width: 100%;
        }

        /* Left Form Side */
        .left {
            flex: 1;
            min-width: 45%;
            padding: 20px;
            background-color: #eeeeee;
            border-radius: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Right Display Side */
        .right {
            flex: 1;
            min-width: 45%;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #cccccc;
        }

        .fees-group {
            margin-bottom: 20px;
        }

        .fees-group label {
            font-size: 16px;
            color: #333;
        }

        .result {
            font-size: 18px;
            color: #ff5722;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Print Button */
        .print-btn {
            background-color: #ff9800;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .print-btn:hover {
            background-color: #e68900;
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left, .right {
                width: 100%;
                min-width: unset;
            }
        }
    </style>
</head>

<body>
    <form action="pay" method="post">
        <div class="container">
            <div class="header">
                <h1><%= rrr %> Student Bill Receipt</h1>
            </div>

            <!-- Date and Time -->
            <div class="date-time">
                <span id="date"></span> <br>
                <span id="time"></span>
            </div>

            <!-- Form Left Side -->
            <div class="left">
                <div class="form-group">
                    <label for="rollno">Roll No:</label>
                    <input type="text" id="rollno" name="rollno" required>
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="number" id="phone" name="phone" required>
                </div>
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
                <div class="form-group">
                    <label for="stype">Shift Type:</label>
                    <select id="stype" name="stype" required>
                        <option value="">Select a Shift Type</option>
                        <option value="Shift-1">Shift-1</option>
                        <option value="Shift-2">Shift-2</option>
                    </select>
                </div>

                <!-- Form submission -->
                <center>
                    <button type="submit">Add to Database</button>
                </center>
            </div>

            <!-- Display Fees -->
            <div class="right">
                <h2>Department course Fees : $<%= feesamount %></h2>
                <div class="fees-group">
                    <label><input type="radio" id="arts" name="department" value="Arts" required> Arts</label><br>
                    <label><input type="radio" id="science" name="department" value="Science" required> Science</label><br>
                    <label><input type="radio" id="language" name="department" value="Language" required> Language</label>
                </div>

                <div class="fees-group">
                    <label><input type="checkbox" id="lab-fee" name="lab-fee" value="5000"> LAB FEES ($5000)</label><br>                
                    <label><input type="checkbox" id="room-fee" name="room-fee" value="3000"> Room Fees ($3000)</label><br>                
                    <label><input type="checkbox" id="tution-fee" name="tution-fee" value="2000"> Tuition Fees ($2000)</label><br>
                    <label><input type="checkbox" id="mess-fee" name="mess-fee" value="2000"> Mess Fees ($2000)</label><br>
                    <label><input type="checkbox" id="bus-fee" name="bus-fee" value="2000"> Bus Fees ($2000)</label>
                </div>

                <!-- Total Amount -->
                <div class="result" id="totalAmount" name="totalamount">Total Amount: $</div>

                <!-- Print Button -->
                <button class="print-btn" onclick="window.print()">Print Receipt</button>
            </div>
        </div>

        <script>
            // Set Date and Time
            const today = new Date();
            document.getElementById('date').innerText = 'Date: ' + today.toLocaleDateString();
            document.getElementById('time').innerText = 'Time: ' + today.toLocaleTimeString();

            // Fee Calculation
            const labFeeCheckbox = document.getElementById('lab-fee');
            const roomFeeCheckbox = document.getElementById('room-fee');
            const tutionFeeCheckbox = document.getElementById('tution-fee');
            const messFeeCheckbox = document.getElementById('mess-fee');
            const busFeeCheckbox = document.getElementById('bus-fee');
            const totalAmountDisplay = document.getElementById('totalAmount');

            let departmentFees = <%= feesamount %>;  // Pass department fees from the server

            function calculateTotal() {
                let total = departmentFees;

                // Static fees
                if (labFeeCheckbox.checked) total += 5000;
                if (roomFeeCheckbox.checked) total += 3000;                
                if (tutionFeeCheckbox.checked) total += 2000;
                if (messFeeCheckbox.checked) total += 2000;
                if (busFeeCheckbox.checked) total += 2000;

                // Update total display
                totalAmountDisplay.innerText = 'Total Amount: $' + total;
            }

            // Event listeners for fee changes
            labFeeCheckbox.addEventListener('change', calculateTotal);
            roomFeeCheckbox.addEventListener('change', calculateTotal);
            tutionFeeCheckbox.addEventListener('change', calculateTotal);
            messFeeCheckbox.addEventListener('change', calculateTotal);
            busFeeCheckbox.addEventListener('change', calculateTotal);

            // Initial calculation
            calculateTotal();
        </script>
    </form>
    
    <footer>
    <pre>
    
    
    
    
    </pre>
    </footer>
</body>
</html>





