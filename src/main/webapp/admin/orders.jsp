<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%
String oid=request.getParameter("orderid");

   try {
             Class.forName("oracle.jdbc.OracleDriver");
             System.out.println("Driver Loaded");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
             System.out.println("connected to database");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="table.css">
	<style type="text/css">
	
	.navbar {
  width: 100%;
  background-color: #EBF5FB;
  overflow: auto;
  margin-bottom: 5px; 
}

.navbar img,a {
  float: left;
  padding: 12px;
  color: black;
  text-decoration: none;
  font-size: 17px;
}
.navbar img {
  float: left;
  color: white;
  text-decoration: none;
  font-size: 17px;
}

.navbar a:hover {
  background-color: #FEF9E7;
}

.active {
  background-color: #4CAF50;
}

@media screen and (max-width: 500px) {
  .navbar a {
    float: none;
    display: block;
  }
   .i{
    color: black;
    float:right;
  }
	</style>
</head>
<body>
<div class="navbar">
  <img src="logo.png" style="height: 20px;width: auto;">
  <a href="ahome.html" style="float: right;"><i class="fa fa-fw fa-sign-in"></i>Back</a>
</div>
<table border="1">
	<thead>
<tr>
<td>USERID</td>
	<td>ORDERNO</td>
	<td>NAME</td>
<td>EMAIL</td>
<td>MOBILE</td>
<td>DATEPLACED</td>
<td>STATUS</td>

<
</tr>
</thead>
<%
Statement st=con.createStatement();
String sql ="select * from BOOKINGDETAILS ";
ResultSet rs = st.executeQuery(sql);
while(rs.next()){
%>
<tbody>
<tr>
<td><% out.println(rs.getString("userid")); %></td>
<td><% out.println(rs.getString("orderno")); %></td>
<td><% out.println(rs.getString("name")); %></td>
<td><% out.println(rs.getString("email")); %></td>
<td><% out.println(rs.getString("mobile")); %></td>
<td><% out.println(rs.getString("dateplaced")); %></td>
<td><% out.println(rs.getString("status")); %></td>
</tr>
</tbody>

<%

}
con.close();
} catch (Exception e) {
e.printStackTrace();

}
%>
</table>
</body>
</html>
