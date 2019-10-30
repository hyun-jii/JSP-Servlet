<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/* String su1= request.getParameter("su1"); */
%>
<!-- Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정하는 코드 -->
<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<!-- 이 구문은 스크립릿 영역에서 『com.test.Calc ob = new com.test.Calc();』 
	 를 작성하여 import 구문을 자동으로 처리한 것과 마찬가지의 효과를 갖는다. -->
	 
<!-- request.getParameter() 메소드를 통해 넘겨받은(전달받은) 데이터를
     『Calc』 객체에 넘겨주기 위해 속성 지정 -->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/> --%>
<!-- 이 구문은 Calc_ok1.jsp 의 『ob.setSu1()』 과 같은 구문 -->

<!-- check~!!! -->
<!-- 속성 이름과 동일한 파라미터명인 경우 getParameter() 메소드 없이
     바로 받아 사용할 수 있다. -->
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<div>
	<h1>두 번째 방법</h1>
	<hr>
</div>

<div>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>