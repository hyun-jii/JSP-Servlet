<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 -> JSP 에서 JAVA 코드를 기술하는(사용하는) 영역
	
	int a=10, b=5, c;
	c=a+b;
	
	//-- 자바 코드의 실행 결과는
	//	 『표현식(%= %)』 에 의해 HTML 브라우저 영역에 출력된다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<!-- 표현식 -->
	<h2>합  : <%=a %> + <%=b %> = <%=c %></h2>
</div>

<%
	// 스크립트 릿 영역
	
	// ※ 『out』 : 내장 객체로서 출력 스트림이다.
	
	out.print("합 : " + a + "+" + b + "=" + c);
	out.print("합 : " + a + "+" + b + "=" + c);
	out.print("합 : " + a + "+" + b + "=" + c + "<br>");
	out.println("합 : " + a + "+" + b + "=" + c);
	out.println("합 : " + a + "+" + b + "=" + c + "<br>");
	
	/*
	String str = String.format("합 : %d + %d = %d",a, b, c);
	out.print(str);
	out.print(str);
	*/
	
	String str = String.format("합 : %d + %d = %d<br>",a, b, c);
	out.print(str);
	out.print(str);
	
	
%>

</body>
</html>