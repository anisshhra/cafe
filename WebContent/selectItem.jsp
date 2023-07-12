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

<link rel="stylesheet" href="css/profile.css">
</head>
<body>
	<%
		String no = request.getParameter("cafe");
	%>
	<%
		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		PreparedStatement stmt = con.prepareStatement("select * from cafeItem where no=? order by type");
		stmt.setString(1, no);
		ResultSet rs = stmt.executeQuery(); //execute query and store in resultset object rs.
	%>
	<div class="box">
		<form action="payment.jsp" method="POST">
			<table>
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Price</th>
					<th>Quantity</th>
				</tr>
				<%
					int i = 0;
					while (rs.next()) {
						i = i + 1;
				%>
				<tr>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("type")%></td>
					<td><%=rs.getString("price")%></td>
					<td><input type="number" name="quantity<%=i%>" value="0"></td>
				</tr>
				<%
					}
				%>
			</table>
			<button type="submit" name="no" value="<%=no%>">Order</button>
		</form>
		<p>
		<form action="catering.jsp">
			<button type="submit">Back</button>
		</form>
		</p>
	</div>
	<%
		con.close();
	%>
</body>
</html>
