<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<style>
	*{
		margin: 0;
	}
	.menu a:link{
		color: white;
		text-decoration: none;
	}
	.menu a:visited{
  		color: white;
	}
	.menu a:active{
  		color: white;
	}
	header{
		color: white;
		text-align: right;
		width: 100%;
		height: 60px;
		background-color: steelblue;
		padding: 0;
		text-align:center;
		display: flex;
  		justify-content: center;
  		align-items: center;
  	}
	nav{
		color: white;
		height: 35px;
		margin-bottom: 15px;
		text-align: right;
		background-color: powderblue;
	}
</style>
<body>
	<header>
		<h1>영화 리뷰 ʕتʔ</h1>
	</header>
	<nav>
		<div class="menu">
			&emsp;&emsp;<a href="main.jsp"><b>홈으로</b></a>
			&emsp;&emsp;<a href="movie_join.jsp"><b>영화등록</b></a>
			&emsp;&emsp;<a href="list_movie.jsp"><b>영화목록</b></a>
			&emsp;&emsp;<a href="review_join.jsp"><b>리뷰등록</b></a>
			&emsp;&emsp;<a href="list_review.jsp"><b>리뷰목록</b></a>
			&emsp;&emsp;<a href="info.jsp"><b>서비스설명</b></a>&emsp;&emsp;
		</div>
	</nav>
</body>
</html>