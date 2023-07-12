<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

    
<%

String id= request.getParameter("id");

try
{
	
	Class.forName("com.mysql.jdbc.Driver"); //load driver

	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root","199165"); //create connection
	Statement stmt = con.createStatement();
	String command = "delete from cafeitem where id=" + id;
	stmt.executeUpdate(command);
	out.println("Data Deleted Successfully!");
   
}
catch (Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
%>

<input type="button" value="Show Cafe Menu" onClick="window.location='cafeItemAdmin.jsp';">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Cafe Item Process</title>
</head>
<body>


</body>
</html>