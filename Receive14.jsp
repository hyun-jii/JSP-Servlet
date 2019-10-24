<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive14.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<p>최종 수신 페이지(Receive14.jsp)</p>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>

</body>
</html>