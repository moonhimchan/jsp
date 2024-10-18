<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t03_FormResult2.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>기록한 내용들</h2>
  <hr/>
  <p>성명: ${name}</p>
  <p>나이: ${age}</p>
  <p>성별: ${gender}</p>
  <p>취미: ${hobby}</p>
  <p>직업: ${job}</p>
  <p>가본산: ${mountain}</p>
  <p>자기소개: ${content}</p>
  <p>첨부파일: ${fName}</p>
  <hr/> 
</div>
<p><br/></p>
</body>
</html>