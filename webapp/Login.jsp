<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <nav>	 <center>  <h1>   ADMISSION MANAGEMENT SYSTEM      </h1>  </center>   </nav>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <script>
        function validateLogin(event) {
            event.preventDefault(); // Prevent form submission

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const message = document.getElementById('message');

            if (username === 'admin' && password === '123') {
                // Set a flag in the session to indicate the user is logged in
                fetch('SetSession.jsp')
                    .then(() => {
                        window.location.href = "HomePage.jsp"; // Redirect to the home page
                    })
                    .catch((error) => {
                        message.textContent = 'Error logging in. Please try again.';
                        message.style.color = 'red';
                    });
            } else {
                message.textContent = 'Invalid username or password.';
                message.style.color = 'red';
            }
        }
    </script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ffafbd, #ffc3a0, #fbc2eb, #a6c1ee);
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .login-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        #message {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form onsubmit="validateLogin(event)">
            <div style="margin-bottom: 15px;">
                <label for="username" style="display: block; margin-bottom: 5px;">Username:</label>
                <input type="text" id="username" name="username">
            </div>
            <div style="margin-bottom: 15px;">
                <label for="password" style="display: block; margin-bottom: 5px;">Password:</label>
                <input type="password" id="password" name="password">
            </div>
            <div style="text-align: center;">
                <button type="submit">Login</button>
            </div>
        </form>
        <p id="message"></p>
    </div>
</body>
</html>
