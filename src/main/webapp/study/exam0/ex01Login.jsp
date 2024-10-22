<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인창 or 로그아웃시 세션 삭제
  session.invalidate();
%>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Playwrite+GB+S:ital,wght@0,100..400;1,100..400&display=swap');
</style>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex01Login.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>로그인 창</h2>
	<hr/>
	<form name="myform" method="post" action="ex01MainOk.jsp">
	<div>아이디 입력
		<input type="text" name="mid" id="mid" value="${mid}" class="form-control mb-2" autofocus required/>
	</div>
	<div>비밀번호 입력
		<input type="password" name="pwd" id="pwd" value="${pwd}" class="form-control mb-2" required/>
	</div>
		<button type="submit" class="form-control btn-primary mb-2">로그인</button>
		<button type="reset" class="form-control btn-primary mb-2">다시입력</button>
	<div>
	</div>
	</form>
</div>
<p><br/></p>
</body>
</html>