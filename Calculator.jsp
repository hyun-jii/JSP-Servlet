<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<!-- <!-- ① 첫 번째 방법 -->
	<!-- <form action="Calc_ok1.jsp" method="post" name="myForm"> -->
	
	<!-- ② 두 번째 방법 -->
	<!-- <form action="Calc_ok2.jsp" method="post" name="myForm"> -->
	
	<!-- ③ 세 번째 방법 -->
	<form action="Calc_ok2.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>첫 번째 정수</th>
				<td>
					<input type="text" name="su1" style="width: 100px; text-align: center;">
				</td>
			</tr>
			<tr>
				<th>연산자</th>
				<td>
					<select name="op">
						<option value="+">더하기</option>
						<option value="-">빼기</option>
						<option value="*">곱하기</option>
						<option value="/">나누기</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>두 번째 정수</th>
				<td>
					<input type="text" name="su2" style="width: 100px; text-align: right;">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" style="width: 100%;">=</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>