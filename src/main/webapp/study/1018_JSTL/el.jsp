<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>el.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>EL(Expression Language)</h2>
  <p>저장소(서버 저장소 : ServletContext컨테이너)에 기록되어 있는 자료에 대한 처리를 담당</p>
  <hr/>
  <pre>
  	용도 : 사용자가 '변수/값/수식/객체' 등을 서버에 전송받은후에 저장(request/session/application), 또는 처리한후 Client로 전송된 자료를 화면에 표시한다.
  	표기법 : $ {변수/값/객체/수식}
  </pre>
  <hr/>
<%
	String atom = "Seoul";
	String name = "홍길동";
%>
	<h2>스크립틀릿을 이용한 출력</h2>
	<div>
		atom = <%=atom %><br/>
		name = <%=name %><br/>		
	</div>
</div>
<p><br/></p>
</body>
</html>