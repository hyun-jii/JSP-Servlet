<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	request.setAttribute("message", "안녕하세요.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send14_for.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<p>포워딩</p>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<jsp:forward page="Receive14.jsp"></jsp:forward>
</div>


</body>
</html>