<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<style>
	h2{
		margin-bottom: 20px;
	}
	.section{
		display: flex;
      	justify-content: center;
	}
	p{
		color: steelblue;
		font-weight: bold;
	}
</style>
<body>
<%@include file="header.jsp" %>
<h2 align="center">ෆ∿ 서비스 설명 ∿ෆ</h2>
	<div class="section">
		<table>
		<tr><td>
		<ul>
			<h3><li>영화등록</li></h3>
			<h3><li>영화목록</li></h3>
			<h3><li>리뷰등록</li></h3>
			<h3><li>리뷰목록</li></h3>
		</ul>
		</td></tr>
		</table>
	</div>
	<p align="center">*목록 페이지에서 순번을 클릭하면 입력되어있는 데이터를 수정할 수 있습니다.</p>
<%@include file="footer.jsp" %>
</body>
</html>