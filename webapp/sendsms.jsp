<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.twilio.Twilio" %>
<%@ page import="com.twilio.rest.api.v2010.account.Message" %>
<%@ page import="com.twilio.type.PhoneNumber" %>
<%@ page import="java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send SMS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 50px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
          label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Send SMS</h2>
    <form id="smsForm" action="send_sms.jsp" method="post">
        <label for="mobileNumber">Enter Mobile Number:</label>
        <input type="text" id="mobileNumber" name="mobileNumber" placeholder="+1234567890" required>

        <label for="message">Enter Message:</label>
        <input type="text" id="message" name="message" placeholder="Your message here" required>

        <input type="submit" value="Send SMS">
    </form>
</div>

<% 
// Backend code to send SMS using Twilio when the form is submitted
final String ACCOUNT_SID = "your_account_sid";
final String AUTH_TOKEN = "your_auth_token";

String mobileNumber = request.getParameter("mobileNumber");
String messageText = request.getParameter("message");

if (mobileNumber != null && messageText != null) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    try {
        Message message = Message.creator(
                new PhoneNumber(mobileNumber),  // To phone number
                new PhoneNumber("your_twilio_phone_number"),  // From Twilio number
                messageText)
                .create();
        out.println("<p>Message sent successfully to " + mobileNumber + "!</p>");
    } catch (Exception e) {
        out.println("<p>Error sending message: " + e.getMessage() + "</p>");
    }
}
%>

<script>
    // Optional: Validate the mobile number format before submitting the form
    document.getElementById("smsForm").addEventListener("submit", function(event) {
        var mobileNumber = document.getElementById("mobileNumber").value;
        if (!/^\+\d{10,15}$/.test(mobileNumber)) {
            alert("Please enter a valid mobile number in the format: +1234567890");
            event.preventDefault();
        }
    });
</script>

</body>
</html>






<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>






</body>
</html>     -->