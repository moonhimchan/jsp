<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>doDelete.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
  <h2>삭제하기</h2>
  <hr/>
  <div><img src="${ctp}/study/images/13.jpg" width="500px"/></div>
  <hr/>
   <div class="row">
    <div class="col"><a href="deleteOk.do" class="btn btn-success" width="500px">탈퇴하기</a></div>
    <div class="col"><a href="${ctp}/study2/mapping/Test2" class="btn btn-success mr-3">돌아가기</a></div>
   </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>