<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.*, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review List</title>
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
    <h2 align="center">리뷰 목록</h2><br>
    <div class="section">
    <table border="1">
        <tr>
            <td>순번</td>
            <td>작성자</td>
            <td>리뷰</td>
            <td>작성일</td>
            <td>영화이름</td>
        </tr>
        <%
        request.setCharacterEncoding("utf-8");
        Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
        Statement stmt = con.createStatement();
        String sql = "SELECT r.review_no, r.writer, r.text, r.write_date, m.movie_name " +
                     "FROM review r " +
                     "INNER JOIN movie m ON r.movie_no = m.movie_no";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()){
            String review_no = rs.getString(1);
            String writer = rs.getString(2);
            String text = rs.getString(3);
            Date write_date = rs.getDate(4);
            String movie_name = rs.getString(5);

            SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
            String strdate = simpleDate.format(write_date);
        %>
        <tr>
            <td><a href="review_edit.jsp?id=<%=review_no%>"><%=review_no %></a></td>
            <td><%=writer %></td>
            <td><%=text %></td>
            <td><%=strdate %></td>
            <td><%=movie_name %></td>
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
