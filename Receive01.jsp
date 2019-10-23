<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신  -> 스크립 릿 영역 -> 자바 문법 적용
	
	//한글 수신을 위한 인코딩 방식 지정
	// ※ 웹은 UTF-8 기본 인코딩 방식으로 삼고 있음.
	request.setCharacterEncoding("UTF-8");
	//-- 이 처리는 데이터 수신 처리보다 먼저 수행해야
	//   처리 과정에서 지정된 인코딩 방식이 달라도
	//   한글이 깨지지 않은 상태로 수신할 수 있음
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>

<style type="text/css">
	span
	{
		color: red;
		font-weight: bold;
	}
</style>

</head>
<body>

<div>
	<h1>가입 확인</h1>
	<hr>
</div>

<div>
	 <span><%=userName %></span>님, 회원 가입이 완료되었습니다.<br>
	 회원님께서 등록하신 전화번호는 <span><%=userTel %></span> 입니다.<br>
</div>

</body>
</html>