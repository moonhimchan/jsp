<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ex01MainOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	// 아이디 비밀번호 세션 저장
	session.setAttribute("sMid", request.getParameter("mid"));
	session.setAttribute("sPwd", request.getParameter("pwd"));
	// id 쿠키생성
	Cookie cookieMid = new Cookie("cMid", mid);
  cookieMid.setMaxAge(60);
  response.addCookie(cookieMid);

	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);
%>
<h2>회원정보</h2>
<p>아이디 : ${mid}</p>
<p>비밀번호 : ${pwd}</p>
<%if(mid.equals("hkd1234S") && pwd.equals("1234")) {%>
	<jsp:forward page="ex01SMain.jsp">
		<jsp:param name="mid" value="${mid}"/>
		<jsp:param name="pwd" value="${pwd}"/>
	</jsp:forward>
<%} else if((mid.equals("ctom1234C") || mid.equals("kms1234C")) && pwd.equals("1234")) {%>
	<jsp:forward page="ex01CMain.jsp">
		<jsp:param name="mid" value="${mid}"/>
		<jsp:param name="pwd" value="${pwd}"/>
	</jsp:forward>
<%} else if((mid.equals("lkj1234J") || mid.equals("btom1234J")) && pwd.equals("1234")) {%>
	<jsp:forward page="ex01JMain.jsp">
		<jsp:param name="mid" value="${mid}"/>
		<jsp:param name="pwd" value="${pwd}"/>
	</jsp:forward>
<%} else if((mid.equals("adminI") || mid.equals("atom1234I")) && pwd.equals("1234")) {%>
	<jsp:forward page="ex01IMain.jsp">
		<jsp:param name="mid" value="${mid}"/>
		<jsp:param name="pwd" value="${pwd}"/>
	</jsp:forward>
<%} %>
	