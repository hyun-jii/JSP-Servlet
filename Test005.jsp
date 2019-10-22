<%@ page  contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test005.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>HttpServlet 관련 실습</h2>
	
	<!-- ※ form 태그의 action 속성은 데이터 전송 및 페이지 요청을 해야하는 페이지 등록 -->
	<!-- ※ form 태그의 method 속성에는 get 또는 post 를 등록 (생략 시 get) -->
	<!--    이는 데이터 전송 및 페이지 요청 방식에 해당한다.(post는 편지, get은 엽서의 개념) -->
	<form action="/WebApp04/login" method="get">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" class="txt" size="10" maxlength="10">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="userPwd" class="txt" size="10">
				</td>
			</tr>
			<tr style="height: 50px;">
				<td colspan ="2">
					<input type="submit" value="로그인" class="btn" style="width: 90px">
					<input type="reset" value="다시 입력" class="btn" style="width: 90px">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>