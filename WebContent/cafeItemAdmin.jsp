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
<link rel="stylesheet" href="css/popupform.css">
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: center;
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
<link rel="stylesheet" href="css/cafeDirectory.css">
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
				<th>Price</th>


			</tr>
			<%
				while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("type")%></td>
				<td>RM<%=rs.getString("price")%></td>
				
				<td><a href="updateCafeItem.jsp?id=<%=rs.getInt("id")%>">Update</a></td>
				<td><a href="deleteCafeItem.jsp?id=<%=rs.getInt("id")%>">Delete</a></td>
				
			</tr>

			<%
				}
			%>

		</table>

	</form>

	<button class="open-button" onclick="openForm()">Add Menu</button>

	<div class="form-popup" id="myForm">
		<form action="addCafeItem.jsp" class="form-container">

		
			<label for="name"><b>Menu Name</b></label> <input type="text"
				placeholder="Enter Name" name="name" required> <label
				for="type"><b>Type</b></label> <input type="text"
				placeholder="Enter type" name="type" required> <label
				for="price"><b>Price (RM)</b></label> <input type="text"
				placeholder="Enter Price" name="price" required>
				

			<button type="submit" class="btn" name="no" value="<%=no%>">Add</button>
			<button type="submit" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>
	
	<p></p>

	<a href="cafeAdmin.jsp" class="btn btn-one">Back</a>
	
	<%
		con.close();
	%>




</body>
</html>