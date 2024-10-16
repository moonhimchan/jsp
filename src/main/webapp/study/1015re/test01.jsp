<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSP 학습</h2>
  <%
  	System.out.println("1.이곳은 test1.jsp");
	%>  
	<div>표현식</div>
	<div><%="test1.jsp"%>></div>
	<%
		int i=100;
		out.println("i = " + i);
	%>
	<div>선언문</div>
	<%!
	  int j = 200;
	%>
	<%
		int j = 200;
	  out.println("j = " + j);
	%>
<div><%="j = " + j %></div>
</div>
<p><br/></p>
</body>
</html>