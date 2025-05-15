<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %><%@ page import="java.util.*"%>
<%!
public int generateRandomNumber(int start, int end ){
    Random random = new Random();
    long fraction = (long) ((end - start + 1 ) * random.nextDouble());
    return ((int)(fraction + start));
}
long millis=System.currentTimeMillis();  
java.util.Date date=new java.util.Date(millis);  
%>
<% 

String nam=request.getParameter("name");
String mail=request.getParameter("email");
String mob=request.getParameter("mobile");
int orderid=generateRandomNumber(100000000,999999999);
String sourcec=request.getParameter("scode");
String source=request.getParameter("saddress");
String destinationc=request.getParameter("dcode");
String destination=request.getParameter("daddress");
String d=date.toString();
String stat="placed";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("connected to driver class");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
	System.out.println(" driver class Loaded");
	PreparedStatement st=con.prepareStatement("select * from users where email='"+mail+"'");
	ResultSet rs=st.executeQuery();rs.next();
	String user=rs.getString("userid");
	rs.close();
	PreparedStatement stmt=con.prepareStatement("insert into bookingdetails values(?,?,?,?,?,?,?,?,?,?,?)");
	stmt.setString(1,user);
	stmt.setString(2,nam); 
	stmt.setString(3,mail); 
	stmt.setString(4,mob); 
	stmt.setString(5,sourcec); 
	stmt.setString(6,source); 
	stmt.setString(7,destinationc); 
	stmt.setString(8,destination); 
	stmt.setInt(9,orderid); 
	stmt.setString(10,d);
	stmt.setString(11,stat); 
	int i=stmt.executeUpdate();
	System.out.println(i+"record inserted");

RequestDispatcher rd=request.getRequestDispatcher("uhome1.html");
System.out.println("Booked Sucessfully");
rd.forward(request, response);
	con.close();
}catch(Exception e){
	System.out.println(e);
}

%>