<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>회 원 전 용 방</h2>
  <hr/>
  <div>현재 <font color="blue"><b>${sNickName}(<font color="red">${strLevel}</font>)</b></font>님 로그인 중입니다.</div>
  <hr/>
  <div>총 방문횟수 : ${mVo.visitCnt}</div>
  <div>오늘 방문횟수 : ${mVo.todayCnt}</div>
  <div>최종방문일 : ${fn:substring(sLastDate,0,19)}</div> 
  <!-- <div>최종방문일 : ${mVo.lastDate}</div> -->
  <div>총 포인트 : ${mVo.point}</div>
  <hr/>
  <div>방명록에 작성한글 수 : <font color="blue">총 <b>__</b>건</font></div>
	<hr/>
	<div>회원 사진 : <img src="${ctp}/images/member/${mVo.photo}" width="300px"/></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>