<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.*" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Edit</title>
</head>
<%
String id = request.getParameter("id");

request.setCharacterEncoding("utf-8");
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

Statement stmt = con.createStatement();
String sql = "select * from movie where movie_no='"+id+"'";
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	String movie_no = rs.getString(1);
	String movie_name = rs.getString(2);
	Date open = rs.getDate(3);
	String director = rs.getString(4);
	String time = rs.getString(5);
	
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(open);
%>
<style>
	.section{
        display: flex;
        justify-content: center;
    }
</style>
<body>
<%@ include file="header.jsp" %>
	<h2 align="center">영화 정보 수정</h2><br>
	<div class="section">
	<form action="movie_editing.jsp" name="frm" method="post">
	<table border="1">
	<tr>
		<td align="center">순번(자동발생)</td>
		<td><input type="text" name="movie_no" value="<%=movie_no %>"></td>
	</tr>
	<tr>
		<td align="center">영화명</td>
		<td><input type="text" name="movie_name" value="<%=movie_name %>"></td>
	</tr>
	<tr>
		<td align="center">개봉일</td>
		<td><input type="text" name="open" value="<%=open %>"></td>
	</tr>
	<tr>
		<td align="center">감독</td>
		<td><input type="text" name="director" value="<%=director %>"></td>
	</tr>
	<tr>
		<td align="center">상영시간</td>
		<td><input type="text" name="time" value="<%=time %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" onclick="valid_check()" value="수정"></td>
	</tr>
	</table>
	</form>
	</div>
	<%
	}
	stmt.close();
	con.close();
	%>
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function valid_check(){
		if(document.frm.movie_no.value==""){
			alert('영화 순번이 입력되지 않았습니다.');
			document.frm.movie_no.focus();
			return false;
		} else if(document.frm.movie_name.value==""){
			alert('영화명이 입력되지 않았습니다.');
			document.frm.movie_name.focus();
			return false;
		} else if(document.frm.open.value==""){
			alert('개봉일이 입력되지 않았습니다.');
			document.frm.open.focus();
			return false;
		} else if(document.frm.director.value==""){
			alert('감독을 입력해주세요.');
			document.frm.director.focus();
			return false;
		} else if(document.frm.time.value==""){
			alert('상영 소요시간을 입력해 주세요.');
			document.frm.time.focus();
			return false;
		} else{
			document.frm.submit();
			alert('수정되었습니다!')
		}
	}
</script>
</html>