<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send02.html)로 부터 데이터 수신
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String kor = request.getParameter("userKor");
	String eng = request.getParameter("userEng");
	String mat = request.getParameter("userMat");
	
	int tot = Integer.parseInt(kor) + Integer.parseInt(eng) + Integer.parseInt(mat);
	double avg = tot/3.0;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>

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
	<h1>성적 처리</h1>
	<hr>
</div>

<div>
	<span><%=userName %></span>님 성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어 : <span><%=kor %></span>점 영어 : <span><%=eng %></span>점 수학 : <span><%=mat %></span>점 입니다.<br>
	총점은<span><%=tot %></span>점, 평균은<span><%=String.format("%.1f",avg) %></span>점 입니다.<br>
	
</div>

</body>
</html>