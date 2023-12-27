<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.*" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie List</title>
</head>
<style>
	.section{
		display: flex;
      	justify-content: center;
	}
	.section a:link{
		color: black;
		text-decoration: none;
	}
	.section a:visited{
  		color: black;
	}
	.section a:active{
  		color: black;
	}
	.section a{
		font-weight: bold;
	}
</style>
<body>
	<%@include file="header.jsp" %>
	<h2 align="center">영화 목록</h2><br>
	<div class="section">
	<table border="1">
	<tr>
		<td>순번</td>
		<td>영화명</td>
		<td>개봉일</td>
		<td>감독</td>
		<td>상영시간</td>
	</tr>
	<%
	request.setCharacterEncoding("utf-8");
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	Statement stmt = con.createStatement();
	String sql = "select * from movie";
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		String movie_no = rs.getString(1);
		String movie_name = rs.getString(2);
		Date open = rs.getDate(3);
		String director= rs.getString(4);
		String time = rs.getString(5);
	
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(open);
	%>
	<tr>
		<td><a href="movie_edit.jsp?id=<%=movie_no%>"><%=movie_no %></a></td>
		<td><%=movie_name %></td>
		<td><%=open %></td>
		<td><%=director %></td>
		<td><%=time %></td>
	</tr>
	<%
	}
	stmt.close();
	con.close();
	%>
	</table>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>