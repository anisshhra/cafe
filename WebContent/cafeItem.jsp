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
<title>Cafe Menu</title>
<style>
table {
	border-collapse: collapse;
	width: 70%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

tr:nth-child(odd) {
	background-color: white
}

th {
	background-color: darkorange;
	color: white;
}
</style>
<link rel="stylesheet" href="css/cafeDirectory.css">
</head>
<body>
	<%
		String no = request.getParameter("number");
	%>
	<%
		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		PreparedStatement stmt = con.prepareStatement("select * from cafeItem where no=? order by type");
		stmt.setString(1, no);
		ResultSet rs = stmt.executeQuery(); //execute query and store in resultset object rs.

		PreparedStatement stmt2 = con.prepareStatement("select * from cafeDirectory where no=?");
		stmt2.setString(1, no);
		ResultSet rs2 = stmt2.executeQuery(); //execute query and store in resultset object rs.

		while (rs2.next()) {
	%>
	<h1><%=rs2.getString("name")%></h1>
	<%
		}
	%>
	<form action="cafeItem.jsp" method="POST">
		<table>
			<tr>
				<th>Name</th>
				<th>Type</th>
				<th>Price(RM)</th>


			</tr>
			<%
				while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("type")%></td>
				<td><%=rs.getString("price")%></td>
				

			</tr>

			<%
				}
			%>

		</table>

	</form>
	<p>
		<form action="cafeDirectory.jsp">
		<button type="submit">Back</button>
		</form>
		</p>	<%
		con.close();
	%>
	
	</body>
</html>
