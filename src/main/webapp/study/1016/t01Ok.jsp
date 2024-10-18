<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 //String mid = request.getParameter("mid") ==null ? "" : request.getParameter("mid");
 //	String pwd = request.getParameter("pwd") ==null ? "": request.getParameter("pwd");  
%>
<!-- t01Ok.jsp -->
 
<%-- <jsp:forward page="t01Res.jsp"></jsp:forward> --%>
<!-- 아이디와 비밀버호의 값도 같이 밀려온다 -->

<!--
 <script>
	location.href = "t01Res.jsp"; 
 </script> 
-->
<!-- 비밀번호 아이디 값이 안나옴 -->

<jsp:forward page="t01Res.jsp">
	<jsp:param name="member"  value="정희원" />
</jsp:forward>


