package examfees;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class pay
 */
public class pay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public pay() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

       //  String totalAmoundupd=request.getParameter("totalamount"); 
       //  int temp=Integer.parseInt(request.getParameter("totalamount"));
       //  pw.println("TOTAL AMOUNT------"+temp);
       //  Get parameters from the form
        String rollno = request.getParameter("rollno");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String departmentType = request.getParameter("dtment");
        String shiftType = request.getParameter("stype");

        String totalAmountStr = request.getParameter("totalamount");
       int temp = 0; // Default value in case totalamount is null or empty

        if (totalAmountStr != null && !totalAmountStr.isEmpty()) {
            temp = Integer.parseInt(totalAmountStr);
        }
        
        pw.println("TOTAL AMOUNT------" + temp);   
        
  
        
        // Declare fee variables
        int tutionFee = 0;
        int messFee = 0;
        int busFee = 0;
        int labFee = 0;
        int roomFee = 0;

        // Handle possible null values in fees
        try {
            // If any of the parameters are null or empty, assign a default value of 0
        
        	
        	
        	String tutionFeeStr = request.getParameter("tution-fee");
        	if (tutionFeeStr != null && !tutionFeeStr.isEmpty()) {
        	    tutionFee = Integer.parseInt(tutionFeeStr);
        	}
        	pw.println(tutionFeeStr);

        	String messFeeStr = request.getParameter("mess-fee");
        	if (messFeeStr != null && !messFeeStr.isEmpty()) {
        	    messFee = Integer.parseInt(messFeeStr);
        	}
        	pw.println(messFeeStr);

        	String busFeeStr = request.getParameter("bus-fee");
        	if (busFeeStr != null && !busFeeStr.isEmpty()) {
        	    busFee = Integer.parseInt(busFeeStr);
        	}
        	pw.println(busFeeStr);
        	
        	
        	String labFeeStr = request.getParameter("lab-fee");
        	if (labFeeStr != null && !labFeeStr.isEmpty()) {
        	    labFee = Integer.parseInt(labFeeStr);
        	}
        	pw.println(labFeeStr);
        	
        	
        	String roomFeeStr = request.getParameter("room-fee");
        	if (roomFeeStr != null && !roomFeeStr.isEmpty()) {
        	    roomFee = Integer.parseInt(roomFeeStr);
        	}
        	pw.println(roomFeeStr);
        	
        	
        	
        } catch (NumberFormatException e) {
            pw.println("<script> alert('Invalid fee input. Please enter valid numbers.'); window.location.href='bill.html'; </script>");
            return;  // Stop further execution on invalid input
        }

             
        // Calculate total amount
   //     int totalAmount = tutionFee + messFee + busFee + temp;
                
        // Validate the phone number length (truncate to 12 characters if necessary)
        if (phone != null && phone.length() > 12) {
            phone = phone.substring(0, 12);  // Truncate to fit within 12 characters
        }
        
        
        

int totalAmount = tutionFee + messFee + busFee + temp + labFee + roomFee;
pw.println("Calculated Total Amount: " + totalAmount);
        
 // int dvalue=request.getAttribute("totalAmountStr");
        

        // Database operations
        try {
            Connection conn = DBConnection.getConnection();
            String query = "INSERT INTO feescomplete(rollno, name, phone, department_type, shift_type, tution_fee, mess_fee, bus_fee, total_amount, lab_fee, room_fee) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, rollno);            // Set roll number
            stmt.setString(2, name);              // Set name
            stmt.setString(3, phone);             // Set phone
            stmt.setString(4, departmentType);    // Set department type
            stmt.setString(5, shiftType);         // Set shift type
            stmt.setInt(6, tutionFee);            // Set tuition fee
            stmt.setInt(7, messFee);              // Set mess fee
            stmt.setInt(8, busFee);               // Set bus fee
            stmt.setInt(9, totalAmount);          // Set total amount
            stmt.setInt(10, labFee);
            stmt.setInt(11, roomFee);
            
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                pw.println("<script> alert('Student Details Added Successfully'); window.location.href='HomePage.jsp'; </script>");
            } else {
                pw.println("<script> alert('Student Details Details were not stored.'); window.location.href='form.jsp'; </script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            pw.println("<script> alert('Error occurred while storing data: " + e.getMessage() + "'); window.location.href='form.jsp'; </script>");
        }
    }
}
