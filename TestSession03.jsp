<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function inputForm()
	{
		var f = document.myForm;
		
		if(!f.userName.value)
		{
			alert("이름을 입력하세요.");
			f.userName.focus();
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<!-- 
	○ TestSession03 에서 TestSession04 로
	    이름과 생일 입력받아 전송
	    TestSession04 에서 TestSession05 로
	    아이디와 패스워드 입력받고 앞에서 전달받은 이름과 생일을 함께 전송
	    TestSession05에서 전달받은 이름, 생일, 아이디, 패스워드 출력
	    
	    03 --------------------------→ 04 ---------------------------→ 05
	    이름, 생일						아이디, 패스워드				 이름, 생일, 아이디, 패스워드
	    입력							입력							 출력
	    
	    		- getParameter					- getAttribute	

 -->
 
 <div>
 	<h1>TestSession03</h1>
 	<hr>
 </div>
 
 <div>
 	<form action="TestSession04.jsp" method="post" name="myForm">
 		<table>
 			<tr>
 				<th>이름</th>
 				<td>
 					<input type="text" id="userName" name="userName">
 				</td>
 			</tr>
 			<tr>
 				<th>생일</th>
 				<td>
 					<input type="text" id="userBirth" name="userBirth">
 				</td>
 			</tr>
 			<tr>
 				<td colspan="2">
 					<button type="button" onclick="inputForm()">입력하기</button>
 				</td>
 			</tr>
 		</table>
 	</form>
 </div>

</body>
</html>