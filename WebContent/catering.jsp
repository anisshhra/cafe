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
		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		PreparedStatement stmt = con.prepareStatement("select * from cafeDirectory");
		ResultSet rs = stmt.executeQuery(); //execute query and store in resultset object rs.
	%>
	<div class="box">
		<h1>Catering</h1>
		<p>Please select your cafe</p>
		<form action="selectItem.jsp" method="POST">
			<select name="cafe">
				<%
					while (rs.next()) {
				%>
				<option value="<%=rs.getString("no")%>"><%=rs.getString("name")%></option>
				<%
					}
				%>
			</select>
			<p>
				<button type="submit">Select</button>
			</p>
		</form>

		<form action="homepage.html">
			<button type="submit">Back</button>
		</form>
	</div>
	<%
		con.close();
	%>

</body>
</html>