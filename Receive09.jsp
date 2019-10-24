<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	int dan = Integer.parseInt(request.getParameter("dan"));

	String str="";
	
	for(int i=1; i<10; i++)
	{
		str += String.format("%d * %d = %d", dan, i, (dan*i));
		str += "<br>";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>Send09.jsp ○ -> Receive09.jsp ●</h2>
</div>

<div>
	<h2><%=str %></h2>
</div>

</body>
</html>