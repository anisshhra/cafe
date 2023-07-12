<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Form</title>
<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<%
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String time = request.getParameter("time");
	%>
	<%
		// This will load the MySQL driver, each DB has its own driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		// Setup the connection with the DB
		Connection connect = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165");

		PreparedStatement stmt = connect
				.prepareStatement("insert into cafeDirectory (name, location, time) values (?, ?, ?)");
		stmt.setString(1, name);
		stmt.setString(2, location);
		stmt.setString(3, time);
		stmt.executeUpdate();
		response.sendRedirect("cafeAdmin.jsp");
	%>
	<%
		stmt.close();
		connect.close();
	%>
</body>
</html>
