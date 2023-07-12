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
<link rel="stylesheet" href="css/popupform.css">
<style>
table {
	border-collapse: collapse;
	width: 100%;
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
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>

	<script>
		function openForm() {
			document.getElementById("myForm").style.display = "block";
		}

		function closeForm() {
			document.getElementById("myForm").style.display = "none";
		}
	</script>
	<h1>Cafe List</h1>

	<%
		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		PreparedStatement stmt = con.prepareStatement("select * from cafedirectory order by no");
		ResultSet rs = stmt.executeQuery(); //execute query and store in resultset object rs.
	%>
	<form action="cafeItemAdmin.jsp" method="POST">
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
				<td><a href="updateCafe.jsp?no=<%=rs.getInt("no")%>">Update</a></td>
				<td><a href="deleteCafe.jsp?no=<%=rs.getInt("no")%>">Delete</a></td>
				
			</tr>

			<%
				}
			%>

		</table>
	</form>
	<button class="open-button" onclick="openForm()">Add Cafe</button>
	<div class="form-popup" id="myForm">
		<form action="addCafe.jsp" class="form-container">
			<h1>Add Cafe</h1>

			<label for="name"><b>Cafe Name</b></label> <input type="text"
				placeholder="Enter Name" name="name" required> <label
				for="location"><b>Location</b></label> <input type="text"
				placeholder="Enter location" name="location" required> <label
				for="time"><b>Operation Hour</b></label> <input type="text"
				placeholder="Enter Operation Hour" name="time" required>

			<button type="submit" class="btn">Add</button>
			<button type="submit" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>
	
	
	<p></p>
	<a href="adminHomepage.html" class="btn btn-one">Back</a>
	<%
		con.close();
	%>
</body>
</html>