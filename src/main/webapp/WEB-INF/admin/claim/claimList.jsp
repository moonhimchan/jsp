<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>claimList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 사용자 페이지 설정
    function pageSizeChange() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "ClaimList.ad?pageSize="+pageSize+"&pag=1";
    }
    
    function contentView(content) {
    	$("#myModal #modalContent").html(content);
    	/* 
    	$("#myModal").modal({
        fadeDuration: 1000,
        fadeDelay: 0.5,
      });
    	*/
    }
    
    function claimViewCheck(flag, partIdx) {
    	$.ajax({
    		type : "post",
    		url  : "ClaimViewCheck.ad",
    		data : {flag : flag,
    			idx : partIdx},
    		success:function(res) {
    			if(res != "0") {
    				if(flag=="NO") alert("게시글을 표시합니다.");
    				else alert("게시글을 감춤니다.");
    				location.reload();
    			}
    			else alert("작업 실패~~");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 신고글 삭제처리
    function claimDeleteOk(part, partIdx) {
    	let ans = confirm("현재 신고된 글을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "ClaimDeleteOk.ad",
    		data : {part : part,
    			idx : partIdx},
    		success:function(res) {
    			if(res != "0") {
    				alert("신고글이 삭제되었습니다.");
    				location.reload();
    			}
    			else alert('신고글 삭제 실패~~');
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">신 고 리 스 트</h2>
  <table class="table table-borderless mt-3 mb-0 p-0">
    <tr>
      <td class="text-right">한페이지 분량 :
        <select name="pageSize" id="pageSize" onchange="pageSizeChange()">
          <option value="3"  <c:if test="${pageSize == 3}"  >selected</c:if>>3건</option>
          <option value="5" <c:if test="${pageSize == 5}" >selected</c:if>>5건</option>
          <option value="10" <c:if test="${pageSize == 10}" >selected</c:if>>10건</option>
          <option value="15" <c:if test="${pageSize == 15}" >selected</c:if>>15건</option>
          <option value="20" <c:if test="${pageSize == 20}" >selected</c:if>>20건</option>
          <option value="25" <c:if test="${pageSize == 25}" >selected</c:if>>25건</option>
        </select>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-secondary">
      <th>번호</th>
      <th>분류</th>
      <th>글제목</th>
      <th>글쓴이</th>
      <th>신고자</th>
      <th>신고내역</th>
      <th>신고날짜</th>
      <th>처리결과</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${st.count}</td>
        <td>${vo.part}</td>
        <td>${vo.title}</td>
        <td>${vo.mid}</td>
        <td>${vo.claimMid}</td>
        <td>${vo.claimContent}</td>
        <td>${vo.claimDate}</td>
        <td>
          <a href="javascript:claimDeleteOk('${vo.part}','${vo.partIdx}')" class="badge badge-danger">삭제</a>
          <c:if test="${vo.claim == 'OK'}"><a href="javascript:claimViewCheck('NO','${vo.partIdx}')" class="badge badge-warning">표시하기</a></c:if>
          <c:if test="${vo.claim != 'OK'}"><a href="javascript:claimViewCheck('OK','${vo.partIdx}')" class="badge badge-warning">감추기</a></c:if>
        </td>
      </tr>
    </c:forEach>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>

<!-- 페이지 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?level=${level}&pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="ClaimList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
	  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?level=${level}&pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 페이지 처리 끝 -->

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">글내용</h3>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <span id="modalContent"></span>
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