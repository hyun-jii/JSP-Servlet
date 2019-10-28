<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%
	String str ="";
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	if(conn != null)
	{
		// 쿼리문 준비 -> select
		String sql ="SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, TRUNC((KOR+ENG+MAT)/3, 1) AS AVG FROM TBL_SCORE ORDER BY SID ASC";
		
		// 쿼리문 실행
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		str += "<table class='tbl'>";
		str += "<tr>";
		str += "<th>번호</th>";
		str += "<th>이름</th>";
		str += "<th>국어점수</th>";
		str += "<th>영어점수</th>";
		str += "<th>수학점수</th>";
		str += "<th>총점</th>";
		str += "<th>평균</th>";
		str += "</tr>";
		
		while(rs.next())
		{
			str += "<tr>";
			str += "<td class='listTd'>" + rs.getInt("SID") + "</td>";
			str += "<td class='listTd'>" + rs.getString("NAME") + "</td>";
			str += "<td class='listTd'>" + rs.getInt("KOR") + "</td>";
			str += "<td class='listTd'>" + rs.getInt("ENG") + "</td>";
			str += "<td class='listTd'>" + rs.getInt("MAT") + "</td>";
			str += "<td class='listTd'>" + rs.getInt("TOT") + "</td>";
			str += "<td class='listTd'>" + rs.getDouble("AVG") + "</td>";
			str += "</tr>";
		}
		
		str += "</table>";
		
		rs.close();
		stmt.close();
		DBConn.close();
	}
	else
	{
		str += "DB 연결 실패";
	}



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.listTd { text-align: center;}
	.errMsg { font-weight: small; color: red; display: none;}
</style>

<script type="text/javascript">

	function formCheck()
	{
		
		var name = document.getElementById("userName");
		var nameErr = document.getElementById("nameMsg");
		
		var kor = document.getElementById("scoreKor");
		var korErr = document.getElementById("korMsg");
		
		var eng = document.getElementById("scoreEng");
		var engErr = document.getElementById("engMsg");
		
		var mat = document.getElementById("scoreMat");
		var matErr = document.getElementById("matMsg");
		
		nameErr.style.display = "none";
		korErr.style.display = "none";
		engErr.style.display = "none";
		matErr.style.display = "none";
		
		
		if(name.value == "")
		{
			nameErr.style.display = "inline";
			name.focus();
			return false;
		}
		
		if(Number(kor.value) > 100 || Number(kor.value) < 0 || isNaN(kor.value) || kor.value == "")
		{
			korErr.style.display = "inline";
			return false;
		}
		
		if(Number(eng.value) > 100 || Number(eng.value) < 0 || isNaN(eng.value) || eng.value == "")
		{
			engErr.style.display = "inline";
			return false;
		}
		
		if(Number(mat.value) > 100 || Number(mat.value) < 0 || isNaN(mat.value) || mat.value == "")
		{
			matErr.style.display = "inline";
			return false;
		}
		
		return true;
		
	}

</script>

</head>
<body>

<div>
	<h1>성적 정보 리스트</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck();">
		<table class='tbl'>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="scoreKor" name="scoreKor">
					<span class="errMsg" id="korMsg">0 에서 100 사이의 점수 입력</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="scoreEng">
					<span class="errMsg" id="engMsg">0 에서 100 사이의 점수 입력</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="scoreMat">
					<span class="errMsg" id="matMsg">0 에서 100 사이의 점수 입력</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="submit" value="등록" class="btn" style="width: 280px; height: 50px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<%=str %>
	</div>
	<!-- 
	<div class="div01">
		<table class='tbl'>
			<tr>
				<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th>
				<th>총점</th><th>평균</th>
			</tr>
			<tr>
				<td class="listTd">1</td><td class="listTd">이성조</td>
				<td class="listTd">90</td><td class="listTd">80</td><td class="listTd">70</td>
				<td class="listTd">240</td><td class="listTd">80.0</td>
			</tr>
		</table>
	</div> -->
</div>

</body>
</html>