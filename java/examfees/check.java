package examfees;

import jakarta.servlet.RequestDispatcher;
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
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Servlet implementation class check
 */
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public check() {
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
        
		
String sample=request.getParameter("dtype");
int aa=0;
//int test=Integer.parseInt(request.getParameter("totalamount"));
try{
Connection conn=DBConnection.getConnection();
String query="select amount from feesupdate where coursetype= ?";           
PreparedStatement st=conn.prepareStatement(query);
st.setString(1, sample);
ResultSet rs=st.executeQuery();
while(rs.next()){
    aa= rs.getInt(1); 
   pw.println("<h2> Amount was "+aa +"</h2>");
   System.out.println(aa);
 }
request.setAttribute("feesamount",aa);
request.setAttribute("sam", sample);
//request.setAttribute("small", test); 
RequestDispatcher dp=request.getRequestDispatcher("billpage.jsp");
dp.forward(request, response);
}
catch(Exception e){
   e.printStackTrace();
}
	
	
	
	}

}
