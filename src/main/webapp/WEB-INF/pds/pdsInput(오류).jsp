<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pdsInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	'use strict';
  	
  	function fileBoxAppend() {
  		cnt++;
    	let fileBox = '';
    	fileBox += '<div id="fBox'+cnt+'">';
    	fileBox += '<input type="file" name="fName'+cnt+'" id="file'+cnt+'" class="form-control-file border mb-2" style="float:left; width:85%" />';
    	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger mb-2 ml-2" style="width:10%;" />';
    	fileBox += '</div>';
    	$("#fileBox").append(fileBox);
		}
  	
  	function deleteBox(cnt) {
    	$("#fBox"+cnt).remove();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>자 료 올 리 기</h2>
  <form name="myform" method="post" action="PdsInputOk.pds" enctype="multipart/form-data">
    <table class="table table-bordered">
      <tr>
        <th>분류</th>
        <td>
          <select name="part" id="part" class="form-control">
            <option>학습</option>
            <option>여행</option>
            <option>음식</option>
            <option>기타</option>
          </select>
        </td>
      </tr>
      <tr>
        <th>자료파일</th>
        <td>
          <div>
	          <input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-success"/>
	          <input type="file" name="fname" id="file" class="form-control-file border">
          </div>
          <div id="fileBox"></div>
        </td>
      </tr>
      <tr>
        <th>올린이</th>
        <td>${sNickName}</td>
      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="title" id="title" placeholder="제목을 입력하세요" class="form-control"/></td>
      </tr>
      <tr>
        <th>상세내역</th>
        <td><textarea rows="4" name="content" id="content" placeholder="상세내역을 입력하세요" class="form-control"></textarea></td>
      </tr>
      <tr>
        <th>공개여부</th>
        <td>
          <input type="radio" name="openSw" id="openSw1" value="공개" class="mr-1" checked /><label for="openSw1">공개</label> &nbsp;&nbsp;
          <input type="radio" name="openSw" id="openSw2" value="비공개" class="mr-1" /><label for="openSw2">비공개</label>
        </td>
      </tr>
    </table>
    <input type="hidden" name="mid" value="${sMid}"/>
    <input type="hidden" name="nickName" value="${sNickName}"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>