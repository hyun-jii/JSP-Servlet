<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");	

	// TestSession03 에서 받아온 데이터 가져오기
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	session.setAttribute("userName", userName);
	session.setAttribute("userBirth", userBirth);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession04.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function loginForm()
	{
		var f = document.myForm;
		
		if(!f.userId.value)
		{
			alert("아이디를 입력하세요");
			f.userId.focus()
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("비밀번호를 입력하세요");
			f.userPwd.focus()
			return;
		}
		
		f.submit();
	}

</script>


</head>
<body>

<div>
 	<h1>TestSession04</h1>
 	<hr>
 </div>
 
 <div>
 	<form action="TestSession05.jsp" method="post" name="myForm">
 		<table>
 			<tr>
 				<th>아이디</th>
 				<td>
 					<input type="text" id="userId" name="userId">
 				</td>
 			</tr>
 			<tr>
 				<th>패스워드</th>
 				<td>
 					<input type="password" id="userPwd" name="userPwd">
 				</td>
 			</tr>
 			<tr>
 				<td colspan="2">
 					<button type="button" onclick="loginForm()">로그인</button>
 				</td>
 			</tr>
 		</table>
 	</form>
 </div>


</body>
</html>