<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Join</title>
<%
request.setCharacterEncoding("utf-8");
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
String sql = "select * from review";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

int last = 0;

while (rs.next()) {
	int review_no = rs.getInt(1);

	if (last < review_no) {
		last = review_no;
	}
}
%>
</head>
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
	<h2 align="center">리뷰 등록⛧⛧</h2><br>
	<div class="section">		
		<form action="review_join_ok.jsp" method="post" name="frm">
		<table border="1">
			<tr>
				<td align="center">순번(자동발생)</td>
				<td><input type="text" name="review_no" value="<%=last + 1%>"></td>
			</tr>
			<tr>
				<td align="center">작성자</td>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td align="center">짧은 리뷰</td>
				<td><textarea name="text" cols=40 rows=2></textarea></td>
			</tr>
			<tr>
				<td align="center">작성일</td>
				<td><input type="date" name="write_date"></td>
			</tr>
			<tr>
				<td align="center">영화 선택</td>
				<td><select name="movie_no">
				<option selected>영화를 선택해 주세요.</option>
				<%
					sql = "select movie_no, movie_name from movie";
					rs = stmt.executeQuery(sql);
					while(rs.next()){
						String movie_no = rs.getString(1);
						String movie_name = rs.getString(2);
				%>
				<option value="<%= movie_no%>"><%=movie_no %> <%=movie_name %></option>				
				<%
					}
					rs.close();
					stmt.close();
					conn.close();
				%>
				</select></td>
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
		if(document.frm.review_no.value==""){
			alert("순번을 입력하여 주시기 바랍니다.");
			document.frm.review_no.focus();
			return false;
		} else if(document.frm.writer.value==""){
			alert("작성자를 입력하여 주시기 바랍니다.");
			document.frm.writer.focus();
			return false;
		}else if(document.frm.text.value==""){
			alert("리뷰 내용을 입력하여 주시기 바랍니다.");
			document.frm.text.focus();
			return false;
		} else if(document.frm.write_date.value==""){
			alert("작성일을 선택하여 주시기 바랍니다.");
			document.frm.write_date.focus();
			return false;
		} else if(document.frm.movie_no.value==""){
			alert("영화를 선택하여 주시기 바랍니다.");
			document.frm.movie_no.focus();
			return false;
		} else{
			document.frm.submit();
		}
	}
</script>
</html>