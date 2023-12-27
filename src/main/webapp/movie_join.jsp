<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.*, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Join</title>
</head>
<%
request.setCharacterEncoding("utf-8");
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
String sql = "select * from movie";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

int last = 0;

while (rs.next()) {
	int movie_no = rs.getInt(1);

	if (last < movie_no) {
		last = movie_no;
	}
}
%>
<style>
	.h2{
		text-align: center;
	}
	.section{
		display: flex;
      	justify-content: center;
	}
</style>
<body>
	<%@include file="header.jsp" %>
	<h2 align="center">영화 등록⛧</h2><br>
	<div class="section">		
		<form action="movie_join_ok.jsp" method="post" name="frm">
		<table border="1">
			<tr>
				<td align="center">순번(자동발생)</td>
				<td><input type="text" name="movie_no" value="<%=last + 1%>"></td>
			</tr>
			<tr>
				<td align="center">영화명</td>
				<td><input type="text" name="movie_name"></td>
			</tr>
			<tr>
				<td align="center">개봉일</td>
				<td><input type="date" name="open"></td>
			</tr>
			<tr>
				<td align="center">감독</td>
				<td><input type="text" name="director"></td>
			</tr>
			<tr>
				<td align="center">상영시간</td>
				<td><input type="text" name="time"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" onclick="valid_check()" value="등록"></td>
			</tr>
		</table>
	</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function valid_check(){
		if(document.frm.movie_no.value==""){
			alert("순번을 입력하여 주시기 바랍니다.");
			document.frm.movie_no.focus();
			return false;
		} else if(document.frm.movie_name.value==""){
			alert("영화명을 입력하여 주시기 바랍니다.");
			document.frm.movie_name.focus();
			return false;
		}else if(document.frm.open.value==""){
			alert("개봉일을 입력하여 주시기 바랍니다.");
			document.frm.open.focus();
			return false;
		} else if(document.frm.director.value==""){
			alert("감독을 입력하여 주시기 바랍니다.");
			document.frm.director.focus();
			return false;
		} else if(document.frm.time.value==""){
			alert("상영시간을 입력하여 주시기 바랍니다.");
			document.frm.time.focus();
			return false;
		} else{
			document.frm.submit();
		}
	}
</script>
</html>