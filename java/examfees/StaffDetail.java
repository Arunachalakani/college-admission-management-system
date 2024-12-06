package examfees;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class StaffDetail
 */
public class StaffDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffDetail() {
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
		
		String n=request.getParameter("name");
		String p=request.getParameter("position");
		String d=request.getParameter("department");
		String em=request.getParameter("email");
	    Long ph=Long.parseLong(request.getParameter("phno"));
	     try {
			Connection conn=DBConnection.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into staff(name,position,department,email,phoneno)values(?,?,?,?,?)");
			ps.setString(1, n);
			ps.setString(2, p);
			ps.setString(3, d);
			ps.setString(4, em);
			ps.setLong(5, ph);
			 
			if(ps.executeUpdate()>0) {
				pw.println("<script> alert('Data Was Added Successfully');"
						+ "window.location.href='HomePage.html'; </script> ");
			}
			else{
				pw.println("<script> alert('Data Was Not ADDED');   </script> ");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
