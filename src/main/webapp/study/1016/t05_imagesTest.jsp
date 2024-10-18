<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t05_imagesTest.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<script>
	'use strict';
	
	function fCheck() {
		let picsu = $('#picture').val();  		
		let imgSrc = "";  	
		if (picsu == 11) {
			imgSrc = "../../images/11.jpg";
		}
		else if (picsu == 12) {
			imgSrc = "../../images/12.jpg";
		}
		else if (picsu == 13) {
			imgSrc = "../../images/13.jpg";
		}
		else if (picsu == 14) {
			imgSrc = "../../images/14.jpg";
		}
		else if (picsu == 15) {
			imgSrc = "../../images/15.jpg";
		}
		else if (picsu == 16) {
			imgSrc = "../../images/16.jpg";
		}	
			document.getElementById("demo").innerHTML = '<img src="' + imgSrc + '">';
	}
</script>
<body>
<p><br/></p>
<div class="container">
  <pre>
  	콤보상자에 출력할 그림파일명을 보여주고, 그 그림파일명을 선택하면
  	demo레이어에 선택된 그림파일을 출력해 주시오.
  </pre>
  <h2>이미지 전달</h2>
  <form name="myform">
  <hr/>
  	<select name="picture" id="picture" size="5" class="form-control">
  		<option value="11">11.jpg</option>
  		<option value="12">12.jpg</option>
  		<option value="13">13.jpg</option>
  		<option value="14">14.jpg</option>
  		<option value="15">15.jpg</option>
  		<option value="16">16.jpg</option>
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