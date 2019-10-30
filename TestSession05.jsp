<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession04 에서 받은 아이디와 비밀번호 가져오기
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// TestSession03 에서 받은 이름과 생일 가져오기
	String userName = (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth");
	
	session.removeAttribute("userName");
	session.removeAttribute("userBirth");
	
	// 아이디 비밀번호
	String memberId = "superman";
	String memberPwd = "123456";
	
	if(userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// 아이디와 비밀번호 세션에 저장하기
		session.setAttribute("userId", userId);
		session.setAttribute("userPwd", userPwd);
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession05.jsp</title>
</head>
<body>

<div>
	<h1>TestSession05</h1>
	<hr>
</div>

<div>
	<h2>아이디 : <%=userId %></h2>
	<h2>비밀번호 : <%=userPwd %></h2>
	<h2>이름 : <%=userName %></h2>
	<h2>생일 : <%=userBirth %></h2>
</div>

</body>
</html>