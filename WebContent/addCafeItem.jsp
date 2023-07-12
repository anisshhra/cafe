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
		String id = request.getParameter("id");
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String price = request.getParameter("price");
	%>
	<%
		// This will load the MySQL driver, each DB has its own driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		// Setup the connection with the DB
		Connection connect = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165");
		
		PreparedStatement stmt = connect.prepareStatement("insert into cafeItem (no,name, type, price) values (?, ?, ?, ?)");
		//stmt.setString(1, id );
		stmt.setString(1, no);
		stmt.setString(2, name);
		stmt.setString(3, type);
		stmt.setString(4, price);
		stmt.executeUpdate();
		response.sendRedirect("cafeAdmin.jsp");
	%>
	<%
		stmt.close();
		connect.close();
			%>
</body></html>
