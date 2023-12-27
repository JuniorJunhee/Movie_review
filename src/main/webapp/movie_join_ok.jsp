<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Join Ok</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	PreparedStatement pstmt = null;
	String sql = "insert into movie values(?,?,?,?,?)";
	
	pstmt = con.prepareStatement(sql);
	String movie_no = request.getParameter("movie_no");
	String movie_name = request.getParameter("movie_name");
	String open = request.getParameter("open");
	String director = request.getParameter("director");
	String time = request.getParameter("time");
	
	pstmt.setString(1, movie_no);
	pstmt.setString(2, movie_name);
	pstmt.setString(3, open);
	pstmt.setString(4, director);
	pstmt.setString(5, time);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
%>
</body>
<script type="text/javascript">
	alert("영화 등록이 완료되었습니다.");
	window.location.href="list_movie.jsp";
</script>
</html>