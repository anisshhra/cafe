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
		String name = request.getParameter("full_name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
	%>

	<%
		// This will load the MySQL driver, each DB has its own driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		// Setup the connection with the DB
		Connection connect = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165");
		PreparedStatement stmt = connect.prepareStatement(
				"insert into user (name, phone, email, gender, username, password,address) values (?, ?, ?, ?,?,?,?)");
		stmt.setString(1, name);
		stmt.setString(2, phone);
		stmt.setString(3, email);
		stmt.setString(4, gender);
		stmt.setString(5, username);
		stmt.setString(6, password);
		stmt.setString(7, address);

		stmt.executeUpdate();
	%>

	<%
		stmt.close();
		connect.close();
	%>

	<div class="box2">
		<h1>Succesfully Registered</h1>
		<form action="login.html">
			<button type="submit">Confirm</button>
		</form>
	</div>

</body>
</html>
