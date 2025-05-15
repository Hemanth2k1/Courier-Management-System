<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random"%>
<%!
    public int generateRandomNumber(int start, int end ){
        Random random = new Random();
        long fraction = (long) ((end - start + 1 ) * random.nextDouble());
        return ((int)(fraction + start));
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp</title>
</head>
<body>
<%
try
{
 Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
Statement st=con.createStatement();
String fname=request.getParameter("name");
String email=request.getParameter("email");
String mob=request.getParameter("mobile");
int userid=generateRandomNumber(1000,9999);
String password=request.getParameter("password");
String strQuery = "SELECT COUNT(*) FROM users where email='"+email+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
System.out.println(Countrow);
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into users(userid,name,email,phno,password)values('"+userid+"','"+fname+"','"+email+"','"+mob+"','"+password+"')");

RequestDispatcher rd=request.getRequestDispatcher("uhome1.html");
System.out.println("Registered Sucessfully");
rd.forward(request, response);
}
else{
out.println("<h1>User name or Email already exists !</h1>");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>
