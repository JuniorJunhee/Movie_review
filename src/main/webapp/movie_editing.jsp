<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.*" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Editing</title>
</head>
<body>
<%
	String movie_no = request.getParameter("movie_no");
	String movie_name = request.getParameter("movie_name");
	String open = request.getParameter("open");
	String director = request.getParameter("director");
	String time = request.getParameter("time");
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	Connection conn = 
DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	String sql = "update movie set movie_name=?, open=?, director=?, time=? where movie_no=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, movie_name);
	pstmt.setString(2, open);
	pstmt.setString(3, director);
	pstmt.setString(4, time);
	pstmt.setString(5, movie_no);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("list_movie.jsp");
	%>
</body>
</html>