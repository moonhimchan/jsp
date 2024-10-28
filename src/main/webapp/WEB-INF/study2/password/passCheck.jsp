<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		
		function fCheck(flag) {
			let pwd = myform.pwd.value;
			if(pwd.trim()=="") {
				alert("비밀번호를 입력하세요");
				myform.pwd.focus();
			}
			else {
				myform.flag.value = flag;
				myform.action = "PassCheckOk.st";
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
  <h2>비밀번호 암호화 연습</h2>
  <pre>
  	salt는 암호학에서는 데이터, 비밀번호을 통과시킬때 통과번호를 해시하는 단방향 함수의 추가 입력 램덤 데이터이다.
  	솔트는 레인보우 테이블(rainbow table : 해시테이블)과 같이 머리 계산된 테이블을 사용하는 공격을 방어한다.
  </pre>
  <p>(비밀번호를 10자 이내로 입력하세요.)</p>
  <form name="myform" method="post">
  	<table class="table table-bordered text-cener">
  		<tr>
  			<td colspan="2"><font size="5">로 그 인</font></td>
  		</tr>
  		<tr>
  			<th>아이디</th>
  			<td><input type="text" name="mid" value="${sMid}" class="form-control" autofocus required /></td>
  		</tr>
  		<tr>
  			<th>비밀번호</th>
  			<td><input type="password" name="pwd" class="form-control" required /></td>
  		</tr>
  		<tr>
  			<td colspan="2">
  				<input type="button" value="숫자비밀번호" onclick="fCheck(1)" class="btn btn-success mr-2"/>
  				<input type="button" value="문자비밀번호" onclick="fCheck(2)" class="btn btn-success mr-2"/>
  				<input type="button" value="조합비밀번호" onclick="fCheck(3)" class="btn btn-success"/>
  			</td>
  		</tr>
  	</table>
  	<input type="hidden" name="flag"/>
  </form>  
  <hr/>
  <h5>암호화된 비밀번호</h5>
  <div id="demo">${pwd}</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>