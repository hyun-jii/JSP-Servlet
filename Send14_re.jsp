<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	request.setAttribute("message", "만나서 반갑습니다.");
	//-- request 객체의 key(message) 의 값 안에 "만나서 반갑습니다."를
	//   value 로 넣는다.
	
	// 리다이렉트
	response.sendRedirect("Receive14.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send14_re.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<p>리다이렉트</p>
</div>

<div>
	<p>이름 : <%=userName %></p>
</div>

</body>
</html>