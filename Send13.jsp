<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	
	String dan = "";
	String gugudan = "";
	
	for(int i=1; i<10; i++)
	{
		dan += "<a href='http://localhost:8090/WebApp05/Send13.jsp'>" + i + "단</a>";
		dan += "<br>";
		
		for(int j=1; j<10; j++)
		{
			gugudan += String.format("%d * %d = %d", dan, j, (i*j));
			gugudan += "<br>";
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send13.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function gugudan(obj)
	{
		obj.submit();
	}
</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습
		- a 태그에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
		- 구구단 리스트를 동적으로 구성하여
		  선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다.
		- submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
		페이지 레이아웃
		----------------------------------------------------------------
		
		구구단 선택
		
		1단
		2단
		3단
		4단
		 :
		9단
		
		-----------------------------------------------------------------
		
		- 단 클릭 시
		  해당 구구단을 출력해주는 형대의 페이지로 구성한다.
		- 사용자 최초 요청 주소는
		  http://localhost:8090/WebApp05/Send13.jsp 로 한다.
		  
	○ Send13.jsp
	   Receive13.jsp
	   
	   
 -->
 
 <div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>Send13.jsp  -> Send13.jsp </h2>
</div>

<div>
	<form method="get" onchange="gugudan(this.form)">
		구구단 선택<br><br>
		<%=dan %>
	</form>
</div>

</body>
</html>