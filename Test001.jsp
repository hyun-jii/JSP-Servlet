<%@ page  contentType="text/html; charset=UTF-8" %>
<%
	// 스크립트 릿(Scriptlet) 영역
	String name ="이현지";
	name += "는 홍길동이 아니다.";
	
	int result = 0;
	result= 10+ 20;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<%-- 작업을 이렇게 이렇게 하고 저렇게 저렇게 해라~!!! --%>

<div>
	<h2><%=name %></h2>
	<h2><%=result %></h2>
</div>

<!-- 궁시렁 궁시렁 이러쿵 저러쿵 -->

</body>
</html>