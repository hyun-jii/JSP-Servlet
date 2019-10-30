<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01_ok.jsp 페이지에서 되돌려보내면서
	// (이 페이지를 다시 요청할 수 있도록 처리하면서)
	// session 의 userId 에 superman 을 담고,
	// session의 userName 에 박혜민을 담아서 보낸 상황
	 
	
	String userId = (String)session.getAttribute("userId");
	//-- 『session.getAttribute("userId");』 는 Object 타입을 반환하므로
	//    String 타입으로 변환하는 과정이 필요하다.
	
	String userName = (String)session.getAttribute("userName");
	
	// 세션 시간 변경 ---------------------------------------------------
	// ※ 세션 기본 시간은 1800 초.
	
	session.setMaxInactiveInterval(10);
	//-- 세션이 유지되는 시간을 10초로 변경하여 설정한 상태. 
	//   즉, 이로 인해...
	//   로그인 후 10초 뒤에 새로고침하면 로그아웃 되어있음.
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<style type="text/css">

	.btn { font-size: 10px; width: 80px; height: 20px;}
</style>

<script type="text/javascript">

	function sendIt()
	{
		// 테스트
		//alert("함수호출 확인");
		
		var f = document.myForm;
		
		//테스트
		//alert(f);
		
		if(!f.userId.value)
		{
			alert("아이디 입력~!!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드 입력~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}

</script>

</head>
<body>

<div>
	<h1>세션 처리 - 로그인</h1>
	<hr>
</div>

<div>
	<table>
		<tr>
			<td><a><button type="button" class="btn btn01">게시판</button></a> | </td>
			
			<td>
				<%
				if(userId == null)
				{
				%>
					<a><button type="button" class="btn btn02">일정관리</button></a> | 
				<%
				}
				else
				{
				%>
					<a href=""><button type="button" class="btn btn01">일정관리</button></a> |	
				<%
				}
				%>
			</td>
			<td>
				<%
				if(userId == null)
				{
				%>
					<button type="button" class="btn btn02">친구관리</button> | 
				<%
				}
				else
				{
				%>
					<a><button type="button" class="btn btn01">친구관리</button></a> | 
				<%
				}
				%>
			</td>
		</tr>
	</table>
	
	<br>
	
	<table>
		<tr>
			<td>
				<%
				if(userId == null)
				{
				%>
				<form action="TestSession01_ok.jsp" method="post" name="myForm">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" name="userPwd" style="width: 200px;"> 
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="button" onclick="sendIt()" style="width: 100%;">로그인</button>
							</th>
						</tr>
					</table>
				</form>
				<%
				}
				else
				{
				%>
					<h2><%=userName %>님 환영합니다.</h2>
					<h2>이제 일정관리와 친구관리 서비스를 이용하실 수 있습니다.</h2>
					<p><a href="TestSession02.jsp">로그아웃</a></p>
				<%
				}
				%>
			</td>
		</tr>
	</table>
</div>

</body>
</html>