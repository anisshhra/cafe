<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Catering</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<%
		String no = request.getParameter("no");
		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		PreparedStatement stmt2 = con.prepareStatement("select * from cafeItem where no=? order by type");
		stmt2.setString(1, no);
		ResultSet rs2 = stmt2.executeQuery();

		int i = 0;

		Statement statement = con.createStatement();
		String command = "create table total(price float(3,2),quantity int(3));";
		statement.executeUpdate(command);

		while (rs2.next()) {
			i = i + 1;
			String q = request.getParameter("quantity" + i);
			String p = rs2.getString("price");

			PreparedStatement stmt = con.prepareStatement("insert into total (price, quantity) values (?, ?)");
			stmt.setString(1, p);
			stmt.setString(2, q);
			stmt.executeUpdate();
		}

		PreparedStatement stmt3 = con.prepareStatement("select sum(price*quantity) as total from total");
		ResultSet rs3 = stmt3.executeQuery();
		PreparedStatement stmt4 = con.prepareStatement("select name from cafeDirectory where no=?");
		stmt4.setString(1, no);
		ResultSet rs4 = stmt4.executeQuery();

		PreparedStatement stmt5 = con.prepareStatement("select username from login");
		ResultSet rs5 = stmt5.executeQuery();
		while (rs3.next()) {
			while (rs4.next()) {
				while (rs5.next()) {
					PreparedStatement stmt6 = con
							.prepareStatement("insert into orders (name, cafe, price) values (?, ?, ?)");
					stmt6.setString(1, rs5.getString("username"));
					stmt6.setString(2, rs4.getString("name"));
					stmt6.setString(3, rs3.getString("total"));
					stmt6.executeUpdate();
	%>

	<div class="box">
		<h1>Login</h1>

		<form action="paymentAction.jsp" method="POST">

			<p>
				Total Amount : RM
				<%=rs3.getString("total")%></p>
			<p>
				Credit Card Name : <input type="text" name="username" required>
			</p>
			<p>
				Credit Card Number : <input type="number" name="creditNo" required>
			</p>
			<p>
				Credit Card Exp : <input type="date" name="creditExp" required>
			</p>

			<p>
				<input type="submit" name="" value="Proceed">
			</p>

		</form>
	</div>
	<%
		}
			}
		}
	%>
	<%
		Statement statement2 = con.createStatement();
		String command2 = "drop table total";
		statement2.executeUpdate(command2);
		con.close();
	%>
</body>
</html>
