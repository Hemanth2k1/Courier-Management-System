<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String mail=request.getParameter("email");
String password=request.getParameter("password");
Class.forName("oracle.jdbc.OracleDriver");
System.out.println("Driver Loaded");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
System.out.println("connected to database");
    Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where email='"+mail+"' and password='"+password+"'");
try{
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("email").equals(mail))
{
out.println("Welcome " +mail);
}
else{
out.println("Invalid password or username.");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>