package examfees;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

/**
 * Servlet implementation class Valid
 */
public class Valid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Valid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		int id=Integer.parseInt(request.getParameter("sid"));
		String name=request.getParameter("sname");
		String department=request.getParameter("dept");
		String detype=request.getParameter("dtment");
		int amou=Integer.parseInt(request.getParameter("amount"));
		String dep=request.getParameter("dtype");
        String shifttype=request.getParameter("stype");
        String dateString = request.getParameter("date");
        
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");  
        java.util.Date utilDate = null;
        java.sql.Date sqlDate = null;
        try {
            if (dateString != null && !dateString.isEmpty()) {
                utilDate = inputFormat.parse(dateString);
                sqlDate = new java.sql.Date(utilDate.getTime());
            } else {
                // Handle the case where date is not provided or is empty
                pw.println("<script>alert('Date is required'); window.history.back();</script>");
                return; // Stop further processing
            }
        } catch (Exception e) {
            e.printStackTrace();
            pw.println("<script>alert('Invalid date format'); window.history.back();</script>");
            return; // Stop further processing
        }
        
//        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		
        request.setAttribute("name", name);
        request.setAttribute("dateString", sqlDate);
        request.setAttribute("dept", department);
        request.setAttribute("dtype", dep);
        request.setAttribute("stype", shifttype);
        

       

        
		try {
			Connection conn=DBConnection.getConnection();                                                                                                                                                                    
			PreparedStatement ps=conn.prepareStatement("insert into fees(Student_Id,Student_Name,Department,Amount,Department_Type,shift_type,date_of_payment)values(?,?,?,?,?,?,?)");
			ps.setInt (1,id);
			ps.setString(2, name);
			ps.setString(3, dep);
			ps.setInt(4, amou);
			ps.setString(5, detype);
			ps.setString(6, shifttype);
			ps.setDate(7,sqlDate );
			
			if(ps.executeUpdate()>0) {
				pw.println("<script> alert('Data was inserted');"
						+"window.location.href='HomePage.html';</script>");
			}else {
				pw.println("<script><h1> alert('Data was not inserted') </h1></script>");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	   request.getRequestDispatcher("billreceipt.jsp").forward(request, response);
		
		
	}

}
