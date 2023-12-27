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
String sql = "select * from review where review_no='"+id+"'";
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	String review_no = rs.getString(1);
	String writer = rs.getString(2);
	String text = rs.getString(3);
	Date write_date = rs.getDate(4);
	String movie_no = rs.getString(5);
	
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(write_date);
%>
<style>
	.section{
        display: flex;
        justify-content: center;
    }
</style>
<body>
<%@ include file="header.jsp" %>
	<h2 align="center">리뷰 수정</h2><br>
	<div class="section">
	<form action="review_editing.jsp" name="frm" method="post">
	<table border="1">
	<tr>
		<td align="center">순번(자동발생)</td>
		<td><input type="text" name="review_no" value="<%=review_no %>"></td>
	</tr>
	<tr>
		<td align="center">작성자</td>
		<td><input type="text" name="writer" value="<%=writer %>"></td>
	</tr>
	<tr>
		<td align="center">짧은 리뷰</td>
		<td><input type="text" name="text" value="<%=text %>" style="height:25px; width:300px"></td>
	</tr>
	<tr>
		<td align="center">작성 날짜</td>
		<td><input type="text" name="write_date" value="<%=write_date %>"></td>
	</tr>
	<tr>
		<td align="center">영화</td>
		<td><input type="text" name="movie_no" value="<%=movie_no %>"></td>
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
		alert('수정되었습니다!')
	}
}
</script>
</html>