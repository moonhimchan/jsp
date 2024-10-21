<%@ page import="java.util.ArrayList"%>
<%@ page import="study.j1018.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String str = "Welcome to My Homepage!!!";
	pageContext.setAttribute("str", str);
	
  String[] cards = {"국민","BC","LG","현대","삼성","농협","신한"};
  pageContext.setAttribute("cards", cards);
  
	MemberVO vo = null;
  ArrayList<MemberVO> vos = new ArrayList<>();
	
	vo = new MemberVO();
	vo.setName("홍길동");
	vo.setAge(25);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("서울");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("김말숙");
	vo.setAge(33);
	vo.setGender("여자");
	vo.setJob("의사");
	vo.setAddress("청주");
	vos.add(vo);
	
	pageContext.setAttribute("vos", vos);
	
	String tel = "010-1234-5678";
	pageContext.setAttribute("tel", tel);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl4_function.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSTL Function 라이브러리</h2>
  <pre>
    taglib에 등록후 사용한다 : taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
  </pre>
  <hr/>
  <div>
    str변수의 값? ${str}<br/>
    1-1.str변수의 길이(length)? <%=str.length() %> / ${fn:length(str)}<br/>
    1-2.cards배열의 길이(length)? <%=cards.length %> / ${fn:length(cards)}<br/>
    1-3.vos객체 길이(length)? <%=vos.size() %> / ${fn:length(vos)}<br/>
    <hr/>
    
    2-1.대문자변환(toUpperCase()) : <%=str.toUpperCase() %> / ${fn:toUpperCase(str)}<br/>
    2-2.소문자변환(toLowerCase()) : <%=str.toLowerCase() %> / ${fn:toLowerCase(str)}<br/>
    <hr/>
    
    3-1.문자열추출(substring()) : <%=str.substring(0, 5) %> / ${fn:substring(str, 0, 5)}<br/>
    3-2.문자열추출(substring()) : <%=str.substring(5) %> / ${fn:substring(str, 5, -1)}<br/>
    <hr/>
    
    4-1.특정문자의 위치값(indexOf) : <%=str.indexOf("o") %> / ${fn:indexOf(str, 'o')}<br/>
    <hr/>
    
    5-1.뒤에서부터검색(lastIndexOf) : <%=str.lastIndexOf("o") %> / <%-- ${fn:lastIndexOf("o")} --%> (X)<br/>
    5-2.특정위치의 문자열 모두 검색 :<br/>
    <c:set var="cnt" value="0"/>
    <c:forEach var="i" begin="0" end="${fn:length(str)-1}">
    	<c:if test="${fn:substring(str, i , i+1 )=='o'}">
    		<c:set var="cnt" value="${cnt +1}"/>
    		'o'문자의 위치값은? ${i} /
    	</c:if>
    </c:forEach>
    <br/>str변수의 'o'문자의 개수는 ${cnt} 개 있습니다.
    <hr/>
    
    6-1.substringAfter() / substringBefore()
    ${fn:substringAfter(str, 'o')} / ${fn:substringBefore(str, 'o')} <br/> <!-- 첫번째 o를 짤라버리고 출력 -->
    6-2.str변수의 2번째 'o'문자의 위치만 구하시오.___________________________
    <c:set var="cnt" value="0"/> 
    <c:forEach var="i" begin="0" end="${fn:length(str)-1}">
    	<c:if test="${fn:substring(str, i , i+1 )=='o'}">
    		<c:set var="cnt" value="${cnt +1}"/> <!-- fn:substring(str, i , i+1 )=='o'일때 마다 cnt의 값이 1씩 증가 그러므로 o의 두번째 값을 구하기 위해서 cnt=2이어야한다.-->
    		<c:if test="${cnt==2}">
    		'o'문자의 위치값은? ${i} /
    		</c:if>
    	</c:if>	
    </c:forEach>
    <hr/>
    
    7-1.split함수<br/>
<%
		String[] tels = tel.split("-");
		for(String t : tels) {
			out.println(t + "/");
		}
%>
		<br/>
		7-2.fn:split(변수명,"분리자") ==> 반환값은 배열로 저장된다.<br/>
		<c:set var="tels" value="${fn:split(tel, '-')}"/>
		<c:forEach var="tel" items="${tels}" varStatus="st">
			${st.count} : ${tel}<br/>
		</c:forEach>
		<hr/>
		
		8. 치환(replace)<br/>
		str변수의 'o'를 'O'로 치환
		<%=str.replace("o", "O") %> / ${fn:replace(str, 'o', 'O')}
		<br/>
		
		9.문자의 포함유무? contains()<br/>
		str변수에 'My'의 포함유무? ${fn:contains(str, "My")}<br/>
		str변수에 'my'의 포함유무? ${fn:contains(str, "my")}<br/>
  </div>
</div>
<p><br/></p>
</body>
</html>