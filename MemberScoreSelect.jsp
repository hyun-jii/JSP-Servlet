<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th style='width:50px;'>번호</th>");
		str.append("<th style='width:100px;'>이름</th>");
		str.append("<th style='width:50px;'>국어</th>");
		str.append("<th style='width:50px;'>영어</th>");
		str.append("<th style='width:50px;'>수학</th>");
		str.append("<th style='width:100px;'>총점</th>");
		str.append("<th style='width:100px;'>평균</th>");
		str.append("<th style='width:50px;'>순위</th>");
		str.append("<th style='width:200px;'>성적관리</th>");
		str.append("</tr>");
		
		
		for(MemberScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSid() + "</td>");
			str.append("<td>" + score.getName() + "</td>");
			str.append("<td>" + score.getKor() + "</td>");
			str.append("<td>" + score.getEng() + "</td>");
			str.append("<td>" + score.getMat() + "</td>");
			str.append("<td>" + score.getTot() + "</td>");
			str.append("<td>" + score.getAvg() + "</td>");
			str.append("<td>" + score.getRank() + "</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/*
			str.append("<td><button type='button'>입력</button>");
			str.append("<button type='button'>수정</button>");
			str.append("<button type='button'>삭제</button></td>");
			*/
			
			if(score.getKor() == -1 && score.getEng() == -1 && score.getMat() == -1)
			{
				str.append("<td><a href='MemberScoreInsertForm.jsp?sid=" + score.getSid() + "'><button type='button' class='btn01'>입력</button></a>");
				str.append("<button type='button' class='btn02'>수정</button>");
				str.append("<button type='button' class='btn02'>삭제</button></td>");
			}
			else
			{
				str.append("<td><button type='button' class='btn02'>입력</button>");
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + score.getSid() + "'><button type='button' class='btn01'>수정</button></a>");
				str.append("<button type='button' class='btn01'>삭제</button></td>");
			}
			
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
<title>MemberScoreSelect.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

</head>
<body>

<!-- http://localhost:8090/WebApp10/MemberScoreSelect.jsp -->
<div>
	<h1>회원 <span style="color: red;">성적</span> 관리 및 출력 페이지</h1>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<br>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
</div>

</body>
</html>