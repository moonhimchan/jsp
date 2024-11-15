<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMessage.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function idSearchView() {
    	
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform">
    <h3 class="text-center">메세지 보내기</h3>
    <div class="input-group mb-2">
      <div class="input-group-prepend"><span class="input-group-text">보내는사람</span></div>
      <input type="text" name="senderId" id="senderId" value="${sMid}" class="form-control" readonly />
    </div>
    <div class="input-group mb-2">
      <div class="input-group-prepend"><span class="input-group-text">받는 사람</span></div>
      <input type="text" name="receiverId" id="receiverId" value="${param.receiverId}" class="form-control" readonly />
      <div class="input-group-append"><a href="#" id="jusorokBtn" data-toggle="modal" data-target="#myModal" class="btn btn-success">주소록</a></div>
    </div>
  </form>
</div>

<!-- 회원 주소록을 모달로 처리 -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="m-3">
        <div class="row">
          <div class="col"><h4>회원 주소록</h4></div>
          <div class="col text-right"><input type="button" value="아이디검색" onclick="idSearchView()" id="idSearchShowBtn" class="btn btn-success btn-sm text-right"/></div>
        </div>
        <div class="row" id="idSearch"></div>
      </div>
      <div class="modal-body">
        <table class="table table-hover">
          <tr class="table-dark text-dark">
            <th>번호</th>
            <th>아이디</th>
            <th>닉네임</th>
          </tr>
          <c:forEach var="vo" items="${vos}" varStatus="st">
            <tr>
              <td>${st.count}</td>
              <td><a href="MemberMessage.msg?receiveId=${vo.mid}">${vo.mid}</a></td>
              <td>${vo.nickName}</td>
            </tr>
          </c:forEach>
          <tr><td colspan="3" class="m-0 p-0"></td></tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>