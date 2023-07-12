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
<title>cafeDirectory</title>
<link rel="stylesheet" href="css/cafeDirectory.css">
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding:15x;
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
</head>
<body>
	<h1>Cafe List</h1>

	<%
		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		PreparedStatement stmt = con.prepareStatement("select * from cafeDirectory order by no");
		ResultSet rs = stmt.executeQuery(); //execute query and store in resultset object rs.
	%>
	<form action="cafeItem.jsp" method="POST">
		<table>
			<tr>
				<th>Cafe Name</th>
				<th>Location</th>
				<th>Operation Hour</th>
				<th></th>
			</tr>
			<%
				while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("location")%></td>
				<td><%=rs.getString("time")%></td>
				
				<td><button type="submit" name="number" value="<%=rs.getInt("no")%>">Select</button></td>
			</tr>

			<%
				}
			%>

		</table>
	</form>
	<p>
		<form action="homepage.html">
		<button type="submit">Back</button>
		</form>
		</p>	<%
		con.close();
	%>
	
	</body>
</html>
