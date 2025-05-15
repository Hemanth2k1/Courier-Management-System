<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %><%@ page import="java.util.*"%>

<% 
String hid=request.getParameter("hubid");
String nam=request.getParameter("name");
String mob=request.getParameter("mobile");
String pass=request.getParameter("password");


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("connected to driver class");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
	System.out.println(" driver class Loaded");
	PreparedStatement stmt=con.prepareStatement("insert into servicepartners values(?,?,?,?)");
	stmt.setString(1,hid);
	stmt.setString(2,nam); 
	stmt.setString(3,mob); 
	stmt.setString(4,pass);  
	int i=stmt.executeUpdate();
	System.out.println(i+"record inserted");

RequestDispatcher rd=request.getRequestDispatcher("shome.html");
System.out.println("Created Sucessfully");
rd.forward(request, response);
	con.close();
}catch(Exception e){
	System.out.println(e);
}

%>