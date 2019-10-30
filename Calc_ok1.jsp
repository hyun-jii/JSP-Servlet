<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Calculator.jsp 페이지로부터 데이터 수신
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int s1, s2;
	s1 = s2 = 0;
	String str = "";
	
	if(strSu1 == null || strSu2 == null)
	{
		response.sendRedirect("Calculator.jsp");
	}
	else
	{
		s1 = Integer.parseInt(strSu1);
		s2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해... 객체 생성
		Calc ob = new Calc();
		//-- 이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
		//   『@page import="com.test.Calc"』 이 구문도 함께 처리됨.
		
		ob.setSu1(s1);
		ob.setSu2(s2);
		ob.setOp(op);
		
		str = ob.result();
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok1.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<div>
	<h1>첫 번째 방법</h1>
	<hr>
</div>

<div>
	<h2><%=str %></h2>
</div>

</body>
</html>