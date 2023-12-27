<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Join Ok</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	PreparedStatement pstmt = null;
	String sql = "insert into review values(?,?,?,?,?)";
	
	pstmt = con.prepareStatement(sql);
	String review_no = request.getParameter("review_no");
	String writer = request.getParameter("writer");
	String text = request.getParameter("text");
	String write_date = request.getParameter("write_date");
	String movie_no = request.getParameter("movie_no");
	
	pstmt.setString(1, review_no);
	pstmt.setString(2, writer);
	pstmt.setString(3, text);
	pstmt.setString(4, write_date);
	pstmt.setString(5, movie_no);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
%>
</body>
<script type="text/javascript">
	alert("리뷰 등록이 완료되었습니다.");
	window.location.href="list_review.jsp";
</script>
</html>