<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String mail=request.getParameter("email");
String password=request.getParameter("password");
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 System.out.println("Connected to driver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
    System.out.println("Connected to Database");
    Statement st= con.createStatement();
    String sql="select * from users where email=? and password=?";
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setString(1,mail);
    pstmt.setString(2,password);
    ResultSet rs=pstmt.executeQuery();
    
    if(rs.next()) {
     RequestDispatcher rd=request.getRequestDispatcher("uhome1.html");
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
catch (Exception e) {
e.printStackTrace();
}
%>