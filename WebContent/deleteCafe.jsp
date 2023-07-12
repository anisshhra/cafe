<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
     <link rel="stylesheet" href="css/cafeDirectory.css">
    
<%
	String no = request.getParameter("no");
%>
<% 
	Statement stmt = null;
	ResultSet resultSet = null;
	
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root", "199165");
	
	stmt = con.createStatement();
	String command = "select * from cafedirectory where no=" + no;
	resultSet = stmt.executeQuery(command);
	
	while (resultSet.next()) {  
		%>
		
		
		<!DOCTYPE html>
		<html>
		<body>
		
			<h1>Delete data from database in jsp</h1>
			<div>
				<br>
				<b style="color:white;"> Cafe NO : <%=resultSet.getInt("no")%></b><br>
				<b style="color:white;"> Name : <%=resultSet.getString("name")%></b> <br>
				<b style="color:white;"> Location : <%=resultSet.getString("location")%></b> <br>
				<b style="color:white;"> Time: <%=resultSet.getString("time")%></b> <br>
				
				<b style="color:red">ARE YOU SURE YOU WANT TO DELETE THIS CAFE?</b>
				<a href="cafeAdmin.jsp">
				
					<button type="button" class="cancel"> No, Cancel</button></a>
					
				<a href="deleteCafeProcess.jsp?no=<%=resultSet.getInt("no")%>"> <button type="button" class="delete">Yes,Delete</button></a>
			</div>
		<%    
	}
	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
		%>
		

		</body>
		</html>
