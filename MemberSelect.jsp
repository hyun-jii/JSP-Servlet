<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th style='width: 50px;'>번호</th>");
		str.append("<th style='width: 100px;'>이름</th>");
		str.append("<th style='width: 150px;'>전화번호</th>");
		str.append("<th style='width: 120px;'>회원관리</th>");
		str.append("</tr>");
		
		for(MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + member.getSid() + "</td>");
			str.append("<td>" + member.getName() + "</td>");
			str.append("<td>" + member.getTel() + "</td>");
			str.append("<td>");
			str.append("<a href='MemberUpdateForm.jsp?sid=" + member.getSid() + "'><button type='button' class='btn01'>수정</button></a>");
			
			/* 따옴표의 종류 : ① "" ② '' ③ \"\"*/
			// 일반적으로 따옴표가 2번 중첩되어 사용하게 되면 1번과 2번을 사용하면 된다.
			// 하지만, 따옴표가 3번 이상 중첩되어 사용될 경우 3번 Escape를 사용해야 한다.
			str.append("<a href= 'javascript:memberDelete(" + member.getSid() +", \"" + member.getName() + "\")'><button type='button' class='btn01'>삭제</button></a>");
			/* str.append("<a href= 'javascript:memberDelete(10, \"홍길동\")'><button type='button' class='btn01'>삭제</button></a>"); */
			str.append("</td>");
			str.append("</tr>");
		}
		str.append("</table>");
	}
	catch(Exception e)
	{
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberSelect.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function memberDelete(sid, name)
	{
		var res = confirm("번호 : " + sid + ", 이름 :" + name + "\n회원의 정보를 삭제하시겠습니까?");
		
		// confirm 창은 true(확인) or false(취소) 반환
		if(res)
		{
			window.location.href="MemberDelete.jsp?sid="+ sid;
		}
	}

</script>

</head>
<body>

<!-- http://localhost:8090/WebApp10/MemberSelect.jsp -->
<div>
	<h1>회원 <span style="color: red;">명단</span> 관리 및 출력 페이지</h1>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button type="button">신규 회원 등록</button></a>
</div>

<br>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
</div>

</body>
</html>