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
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Student
 */
public class Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student() {
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
		
		int i=Integer.parseInt(request.getParameter("ssid"));
        String n=request.getParameter("ssname");
        String em=request.getParameter("email");
        Long s=Long.parseLong(request.getParameter("sphone"));
        String add=request.getParameter("add");
		
        try {
			Connection conn=DBConnection.getConnection();
			String qquery="select * from student";
			PreparedStatement pst=conn.prepareStatement(qquery);
			ResultSet rs=pst.executeQuery();
			
			 while(rs.next()) {
			  if(i==rs.getInt(1) && n.equals(rs.getString(2)) && em.equals(rs.getString(3)) && s==(rs.getLong(4)) && add.equals(rs.getString(5)) ) {
				  pw.println("<script>  alert(' This data already inserted. Please give the correct details ');");
				  
				  pw.println("window.location.href='StudentDetails.html'; </script> ");
				  break;
			  }
				 
			 }
			
			
			
			PreparedStatement ps=conn.prepareStatement("insert into student(sid,sname,e_mail,phonenumber,address)values(?,?,?,?,?)");
			ps.setInt(1, i);
			ps.setString(2, n);
			ps.setString(3, em);
			ps.setLong(4, s);
			ps.setString(5, add);
			if(ps.executeUpdate()>0) {
				pw.println("<script>  alert('Student Details Added'); "
						+ "window.location.href='HomePage.html';  </script> ");
			}else {
				pw.println("<script>  alert('Details are not stored');  </script>");
			}
			
		} catch (SQLException e) {  
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
 