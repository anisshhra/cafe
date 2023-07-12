<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
     <link rel="stylesheet" href="css/cafeDirectory.css">
    
<%
	String id= request.getParameter("id");
%>
<% 
	Statement stmt = null;
	ResultSet resultSet = null;
	
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root", "199165");
	
	stmt = con.createStatement();
	String command = "select * from cafeitem where id=" + id;
	resultSet = stmt.executeQuery(command);
	
	while (resultSet.next()) {  
		%>
		
		
		<!DOCTYPE html>
		<html>
		<body>
		
			<h1>Delete data from database in jsp</h1>
			<div>
				<br>
				<b> No : <%=resultSet.getInt("no")%></b><br>
				<b> ID : <%=resultSet.getInt("id")%></b><br>
				<b> Name : <%=resultSet.getString("name")%></b> <br>
				<b> Type : <%=resultSet.getString("type")%></b> <br>
				<b> Price : <%=resultSet.getDouble("price")%></b> <br>
				
				<b style="color:red">ARE YOU SURE YOU WANT TO DELETE THIS ITEM?</b>
				<a href="cafeItemAdmin.jsp">
				
					<button type="button" class="cancel"> No, Cancel</button></a>
					
				<a href="deleteCafeItemProcess.jsp?id=<%=resultSet.getInt("id")%>"> <button type="button" class="delete">Yes,Delete</button></a>
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
