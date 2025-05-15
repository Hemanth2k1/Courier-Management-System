<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	String i=request.getParameter("hid");
	String c=request.getParameter("center");
	String p=request.getParameter("password");
    Class.forName("oracle.jdbc.OracleDriver");
    System.out.println("Driver Loaded");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
    System.out.println("connected to database");
    Statement st=con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM hubs where hubid='"+i+"'";
    ResultSet rs = st.executeQuery(strQuery);
    rs.next();
    String Countrow = rs.getString(1);
    System.out.println(Countrow);
    if(Countrow.equals("0")){
    int f=st.executeUpdate("insert into hubs(hubid,centre,password)values('"+i+"','"+c+"','"+p+"')");

    RequestDispatcher rd=request.getRequestDispatcher("ahome.html");
    System.out.println("Registered Sucessfully");
    rd.forward(request, response);
    }
    else{
    out.println("<h1>HubId and Centre already exists !</h1>");
    }
    
con.close();
}
catch(Exception e){
System.out.println(e);

}


%>
</body>
</html>