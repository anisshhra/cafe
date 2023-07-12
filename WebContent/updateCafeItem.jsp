<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<link rel="stylesheet" href="css/cafeDirectory.css">


<%

String id = request.getParameter("id");
Connection con = null;
Statement statement= null;
ResultSet resultSet = null;

try {

	Class.forName("com.mysql.jdbc.Driver"); //load driver
	con = DriverManager.getConnection("jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "199165");	//create connection
	statement =con.createStatement();
	String sql = "select * from cafeitem where id =" +id;
	resultSet = statement.executeQuery(sql);
	while (resultSet.next()) {
		%>
			<!DOCTYPE html>
			<html>
			<body>
			<h1>Update data from database in jsp</h1>
			<form method="post" action="updateCafeItemProcess.jsp">
				<br> Item ID: </br> 
				<input type="hidden" name="savedid" value="<%=resultSet.getInt("id")%>">
				<input type="text" name="id" value=<%=resultSet.getInt("id")%>">
				<br> Item Name: <br>
				<input type="text" name="name" value="<%=resultSet.getString("name")%>">
				<br> Type: <br>
				<input type="text" name="type" value="<%=resultSet.getString("type")%>">
				<br> Price (RM): <br>
				<input type="text" name="price" value="<%=resultSet.getString("price")%>">
				
				<br> <input type="submit" value="submit">
				</a>
			
			
			</form>
		<%
	}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

</body>
</html>