<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %><%@ page import="java.util.*"%>

<% 
String id=request.getParameter("oid");
String stat=request.getParameter("st");


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("connected to driver class");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
	System.out.println(" driver class Loaded");
	PreparedStatement stmt=con.prepareStatement("update bookingdetails set status=? where orderno=?");
	stmt.setString(1,stat);
	stmt.setString(2,id);  
	int i=stmt.executeUpdate();
	System.out.println(i+"record updated");
	con.close();
RequestDispatcher rd=request.getRequestDispatcher("sucess.html");
rd.forward(request, response);

}catch(Exception e){
	System.out.println(e);
}

%>