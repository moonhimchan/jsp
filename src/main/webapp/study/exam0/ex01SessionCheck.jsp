<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String) session.getAttribute("sMid");
	String pwd = (String) session.getAttribute("sPwd");

	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);

	// 저장된 세션값들 확인하기
	Enumeration enumCK = session.getAttributeNames();
	String sessionName = "";
	String sessionName_ = "";
	String sessionValue = "";
	
	while(enumCK.hasMoreElements()) {
		sessionName_ = enumCK.nextElement().toString();
		sessionName += sessionName_ + "/";
		sessionValue += session.getAttribute(sessionName_) + "/";
	}
	System.out.println(sessionName + "\n" + sessionValue);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex01SessionCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>세션값 출력</h2>
  <p>아이디 : ${mid}</p>
  <p>비밀번호 : ${pwd}</p>
  <hr/>
  <p>세션 아이디 : <%=session.getId() %></p>
 	<p><a href="ex01CookiesAllDelete.jsp" class="btn btn-info">로그아웃</a></p>
</div>
<p><br/></p>
</body>
</html>