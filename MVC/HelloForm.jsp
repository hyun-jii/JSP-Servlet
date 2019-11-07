<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloForm.jsp</title>
</head>
<body>

<div>
	<h1>결과 처리 페이지(HelloForm.jsp -> View)</h1>
</div>

<div>
	<ul>
		<li><b>FirstName : </b>${firstName }</li>
		<li><b>LastName : </b>${lastName }</li>
	</ul>
</div>

</body>
</html>