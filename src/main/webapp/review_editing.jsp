<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.*" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String review_no = request.getParameter("review_no");
	String writer = request.getParameter("writer");
	String text = request.getParameter("text");
	String write_date = request.getParameter("write_date");
	String movie_no = request.getParameter("movie_no");
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	Connection conn = 
DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	String sql = "update review set writer=?, text=?, write_date=?, movie_no=? where review_no=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, writer);
	pstmt.setString(2, text);
	pstmt.setString(3, write_date);
	pstmt.setString(4, movie_no);
	pstmt.setString(5, review_no);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("list_review.jsp");
	%>
</body>
</html>