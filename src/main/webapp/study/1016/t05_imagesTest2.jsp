<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t05_imagesTest.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
  <pre>
  	콤보상자에 출력할 그림파일명을 보여주고, 그 그림파일명을 선택하면
  	demo레이어에 선택된 그림파일을 출력해 주시오.
  </pre>
  <h2>이미지 전달</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T05Ok">
  <hr/>
  	<select name="picture" id="picture" size="5" class="form-control">
  		<option>"<%=request.getContextPath()%>/images/11.jpg"</option>
  		<option>"<%=request.getContextPath()%>/images/12.jpg"</option>
  		<option>"<%=request.getContextPath()%>/images/13.jpg"</option>
  		<option>"<%=request.getContextPath()%>/images/14.jpg"</option>
  		<option>"<%=request.getContextPath()%>/images/15.jpg"</option>
  		<option>"<%=request.getContextPath()%>/images/16.jpg"</option>
  	</select>
  	<div class="container">
  		<input type="button" value="전송" onclick="fCheck()" class="form-control btn-primary"/>
  	</div>
  	<div id="demo"></div>
  </form>
</div>
<p><br/></p>
</body>
</html>