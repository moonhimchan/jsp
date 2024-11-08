<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pdsList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">자 료 실 리 스 트</h2>
  <br/>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td><a href="PdsInput.pds" class="btn btn-success btn-sm">자료올리기</a></td>
      <td class="text-right">
        <form name="partForm">
          <select name="part" id="part" onchange="partCheck()">
            <option>전체</option>
            <option>학습</option>
            <option>여행</option>
            <option>음식</option>
            <option>기타</option>
          </select>
        </form>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-secondary">
      <th>번호</th>
      <th>자료제목</th>
      <th>올린이</th>
      <th>올린날짜</th>
      <th>분류</th>
      <th>파일명(크기)</th>
      <th>다운수</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${vo.idx}</td>
        <td>${vo.title}</td>
        <td>${vo.nickName}</td>
        <td>${vo.fDate}</td>
        <td>${vo.part}</td>
        <td>
          <c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
          <c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
          <c:forEach var="fName" items="${fNames}" varStatus="st">
	          <a href="${ctp}/images/pds/${fSName[st.index]}" download="${fName}">${fName}</a><br/>
          </c:forEach>          
          (${vo.fSize})
        </td>
        <td>${vo.downNum}</td>
        <td>다운로드</td>
      </tr>
    </c:forEach>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>