<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : ";
	
	try
	{
		dao = new MemberDAO();
		
		memberCount += dao.count() + "</span>";
		
		str.append("<table class='tbl'>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
		
		// MembeDAO 객체의 lists() 메소드 호출
		//-- 반복문을 통해 <table> 및 하위 엘리먼트 생성
		for(MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + member.getSid() + "</td>");
			str.append("<td>" + member.getName() + "</td>");
			str.append("<td>" + member.getTel() + "</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

	.errMsg { font-size: small; color: red; display: none;}
</style>

<script type="text/javascript">

	function formCheck()
	{
		var userName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus()
			return false;
		}
		
		return true;
	}
	
</script>

</head>
<body>

<div>
	<h1>데이터베이스 연동 회원관리 실습</h1>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck();">
		<table class="tbl">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<!-- 인원 수 -->
		<!-- 번호 이름 전화번호 -->
		<%=memberCount %>
		<%=str %>
		
	</div>
</div>

</body>
</html>