<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="ob" class="com.test.Calc" scope="page"/>
<jsp:setProperty property="*" name="ob"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<div>
	<h1>세 번째 방법</h1>
	<hr>
</div>

<div>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>