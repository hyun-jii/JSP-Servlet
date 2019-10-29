<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sid = request.getParameter("sid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function memberSubmit()
	{
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		var scoreKor = document.getElementById("scoreKor");
		var korMsg = document.getElementById("korMsg");
		
		var scoreEng = document.getElementById("scoreEng");
		var engMsg = document.getElementById("engMsg");
		
		var scoreMat = document.getElementById("scoreMat");
		var mathMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		
		if(uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus()
			return;
		}
		
		memberForm.submit();
	}
	
	function memberReset()
	{
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		
		memberForm.reset();
		nameMsg.style.display = "none";
		uName.focus();
	}
	
</script>

</head>
<body>

<!-- http://localhost:8090/WebApp10/MemberScoreInsertFrom.jsp -->
<div>
	<h1>회원 <span style="color: red;">성적</span> 관리 및 입력 페이지</h1>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<br><br>


<div>
	<!-- 회원 정보 입력 폼 구성 -->
	<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="uName" name="uName">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="scoreKor" name="scoreKor">
				</td>
				<td>
					<span class="errMsg" id="korMsg">0부터 100사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="scoreEng">
				</td>
				<td>
					<span class="errMsg" id="engMsg">0부터 100사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="scoreMat">
				</td>
				<td>
					<span class="errMsg" id="matMsg">0부터 100사이의 점수를 입력하세요.</span>
				</td>
			</tr>
		</table>
		
		<br>
		
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>


</body>
</html>