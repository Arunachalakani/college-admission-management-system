<%@ page import= "java.sql.* " %>
<%@ page import="examfees.DBConnection " %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<% 
try
{
	String dname=request.getParameter("dept");
	Long ddamount=Long.parseLong(request.getParameter("amount")); 
System.out.println(dname+"  "+ddamount);

Connection conn=DBConnection.getConnection();
PreparedStatement st=conn.prepareStatement("select * from feesupdate");
ResultSet rs=st.executeQuery();
while(rs.next()){
	
	if(dname.equals(rs.getString(1))){
		String query=String.format("update feesupdate  set  amount= ? where coursetype='"+dname+"'");
		PreparedStatement pstm=conn.prepareStatement(query);
	//	pstm.setString(1, dname);
		pstm.setLong(1, ddamount);
		int rowupdate=pstm.executeUpdate();

		if(rowupdate>0){
		out.println(" <script type='text/javascript' > ");
		out.println(" alert('department fees was updated'); ");
		out.println(" window.location.href='departmentfeesfixed.html';  ");
		out.println(" </script> ");
		}else{

		out.println("	alert('depaetment fees was not updated'); ");
		out.println("	window.location.href='departmentfeesfixed.html';  ");

		    }
	}
	


/*
String query=String.format("update feesupdate  set coursetype= ? where amount= ? ");
PreparedStatement pstm=conn.prepareStatement(query);
pstm.setString(1, dname);
pstm.setLong(2, ddamount);
int rowupdate=pstm.executeUpdate();

if(rowupdate>0){
out.println(" <script type='text/javascript' > ");
out.println(" alert('data was updated'); ");
out.println(" window.location.href='departmentfeesfixed.html';  ");
out.println(" </script> ");
}else{

out.println("   <script type='text/javascript' >  ");
out.println("	alert('data was not updated'); ");
out.println("	window.location.href='departmentfeesfixed.html';  ");
out.println("   </script>  ");
}     */


    }
} catch(Exception e) {
    e.printStackTrace();
/*    out.println("<script type='text/javascript'>");
    out.println("alert('An error occurred: " + e.getMessage() + "');");
    out.println("</script>");    */

}
%>

</body>
</html>