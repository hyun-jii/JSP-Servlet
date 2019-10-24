<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	String gugudanStr = request.getParameter("gugudan");

	int gugudan = Integer.parseInt(gugudanStr);
	
	String result="";
	for(int i=1; i<=9; i++)
	{
		result += String.format("%d * %d = %d<br>", gugudan, i, gugudan*i);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive13.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>

<body>
 <div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>Send13.jsp  -> Receive13.jsp </h2>
</div>

<div>
	<p>수신 데이터 : <%=gugudanStr %></p>
	<%=result %>
</div>




</body>
</html>