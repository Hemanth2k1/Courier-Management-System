<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %><%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String uname=request.getParameter("hid");
String pass=request.getParameter("password");
System.out.println(uname);
System.out.println(pass);

 try {
           Class.forName("oracle.jdbc.OracleDriver");
           System.out.println("Driver Loaded");
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
           System.out.println("connected to database");
           String sql="select * from hubs where hubid=? and password=?";
           PreparedStatement pstmt=con.prepareStatement(sql);
           pstmt.setString(1,uname);
           pstmt.setString(2,pass);
           ResultSet rs=pstmt.executeQuery();
           
           if(rs.next()) {
            RequestDispatcher rd=request.getRequestDispatcher("shome.html");
            System.out.println("Login Succesfully");
            rd.forward(request, response);
           }
           else {
            RequestDispatcher rd=request.getRequestDispatcher("fail.html");
            System.out.println("Login Failed");
            rd.forward(request, response);
           }
           con.close();
       }
       catch(Exception e){
           System.out.println(e);
           
       }
%>
</body>
</html>