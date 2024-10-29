<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberNameCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	$(function(){
  	let name = '${vo.tempName}';
  	let str = "";
  	if(name == "") {
  		str = "${vo.name}는 사용 가능 합니다.";
  	}
  	else {
  		str =  name+"는 이미 사용중입니다.";
  		str += '<form name="childForm" method="post" action="MemberNameCheck.mem">';
  		str += '이름 :';
  	  str += '<input type="text" name="name" autofocus required />';
  	  str += '<input type="submit" value="이름검색" class="btn btn-secondary" />'
  	  str += '</form>';
  	}
  	
  	demo.innerHTML = str;
  });
  	
  	function winClose() {
			//alert("mid : ${vo.mid}");
  		opener.window.myform.mid.value = "${vo.mid}";
  		opener.window.myform.pwd.focus();
  		window.close();
	  }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>이름 검색결과</h3>
  <hr/>
  <div id="demo"></div>
	<hr/>
	<p class="text-center"><input type="button" value="창닫기" onclick="winClose()"/></p>
</div>
<p><br/></p>
</body>
</html>