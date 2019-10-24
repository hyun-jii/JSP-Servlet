<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	String temp = request.getParameter("userInput");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive10.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>SendAndReceive10.jsp  -> SendAndReceive10.jsp </h2>
</div>

<div>
	<!-- 『action=""』 과 같이 구성하면 -->
	<!-- 페이지 요청 및 데이터 전송에 대한 수신처는 자기 자신~!!! -->
	<!-- <form action="" method="post">
		입력 : <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		<button type="submit" class="btn">테스트</button>
		<button type="reset" class="btn">취소</button>
	</form> -->
</div>

<div>
	<!-- 『action=""』 속성을 생략하는 경우도  -->
	<!-- 페이지 요청 및 데이터 전송에 대한 수신처는 자기 자신~!!! -->
	<form method="post">
		입력 : <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		<button type="submit" class="btn">테스트</button>
		<button type="reset" class="btn">취소</button>
	</form>
</div>

<div>
	<h3>입력값 : <%=temp %></h3>
</div>

</body>
</html>