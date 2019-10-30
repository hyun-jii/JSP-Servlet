<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Cookie c = new Cookie("cookie_test", "studyCookie");

	c.setMaxAge(3600);
	
	response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr>
</div>

<div>
	<a href="TestGetCookie.jsp"><button>쿠키 정보 확인</button></a>
	<a href="TestRemoveCookie.jsp"><button>쿠키 정보 삭제</button></a>
</div>

</body>
</html>