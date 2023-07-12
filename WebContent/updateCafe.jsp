<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<link rel="stylesheet" href="css/cafeDirectory.css">


<%

String no = request.getParameter("no");
Connection con = null;
Statement statement= null;
ResultSet resultSet = null;

try {

	Class.forName("com.mysql.jdbc.Driver"); //load driver
	con = DriverManager.getConnection("jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "199165");	//create connection
	statement =con.createStatement();
	String sql = "select * from cafedirectory where no =" + no ;
	resultSet = statement.executeQuery(sql);
	while (resultSet.next()) {
		%>
			<!DOCTYPE html>
			<html>
			<body>
			<h1>Update data from database in jsp</h1>
			<form method="post" action="updateCafeProcess.jsp">
				<br style="color:white;"> Cafe NO:</br> 
				<input type="hidden" name="savedno" value="<%=resultSet.getInt("no")%>">
				<input type="text" name="no" value=<%=resultSet.getInt("no")%>>
				<br style="color:white;"> Cafe Name: <br>
				<input type="text" name="name" value="<%=resultSet.getString("name")%>">
				<br style="color:white;"> Cafe Location: <br>
				<input type="text" name="location" value="<%=resultSet.getString("location")%>">
				<br style="color:white;"> Time: <br>
				<input type="text" name="time" value="<%=resultSet.getString("time")%>">
				
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