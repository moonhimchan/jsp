<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");

	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex01SMain.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<%@ include file="testHeader.jsp" %>
<p><br/></p>
<div class="container">
  <h2>생산과 방</h2>
  <hr/>
  <h2>회원정보</h2>
  <p>아이디 : <%=mid%>mid</p>
  <p>비밀번호 : <%=pwd%>${pwd}</p>
  <hr/>
</div>
<p><br/></p>
<%@ include file="testFooter.jsp" %>
</body>
</html>