<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 후 처리하는 부분
	//-- 현재... 자기 자신 페이지로 부터...
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 수신 -> 현재의 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2019
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 10
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 24
	
	// 표시할 달력의 년, 월
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	String yOptions = "";
	for(int year=(selectYear -10); year<=(selectYear+10); year++)
	{
		// 상황1. 페이지 최초 요청 → sYear 는 null, 현재 년도와 옵션값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때 
		// 상황3. 나머지
		
		if(sYear==null && year==nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else if(sYear != null && Integer.parseInt(sYear)==year)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
	}
	
	String mOptions = "";
	for(int month=1; month<=12; month++)
	{
		// 상황1. 페이지 최초 요청 → sMonth 는 null, 현재 월과 옵션값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때 
		// 상황3. 나머지
		
		if(sMonth==null && month==nowMonth)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else if(sMonth != null && Integer.parseInt(sMonth)==month)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else
		{
			mOptions += "<option value='" + month + "'>" + month + "</option>";
		}
	}
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	// (만년 달력) --------------------------------------------------------
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if(selectYear%4 == 0 && selectYear%100 !=0 || selectYear%400 == 0)
	{
		months[1] = 29;
	}
	
	// 총 날 수 누적
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일","목요일","금요일","토요일"};
	
	// 현재 년도 -> 입력받은 년도의 이전 년도 까지의 날 수 연산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 -> 입력받은 월의 이전 월 까지의 날 수 추가 연산
	for(int i=0; i<selectMonth-1; i++)
	{
		nalsu+=months[i];
	}
	nalsu++;
	
	int week = nalsu%7;						//-- 요일변수
	int lastDay = months[selectMonth-1];	//-- 마지막 날짜 변수
	
	String calStr = "";
	calStr += "<table border=1>";
	calStr += "<tr>";
	for(int i=0; i<weekName.length; i++)
	{
		if(i==0)
		{
			calStr += "<th style='color : red;'>" + weekName[i] + "</th>";
		}
		else if(i==6)
		{
			calStr += "<th style='color : blue;'>" + weekName[i] + "</th>";
		}
		else
		{
			calStr += "<th>" + weekName[i] + "</th>";
		}
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	// 빈 칸 공백 td 발생
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
	}
	
	// 날짜 td 발생
	for(int i=1; i<= lastDay; i++)
	{
		week++;
		
		if(selectYear == nowYear && selectMonth == nowMonth && i == nowDay && week %7 == 0)
		{
			calStr += "<td class='nowSat'>" + i + "</td>";
		}
		else if(selectYear == nowYear && selectMonth == nowMonth && i == nowDay && week %7 == 1)
		{
			calStr += "<td class='nowSun'>" + i + "</td>";
		}
		else if(selectYear == nowYear && selectMonth == nowMonth && i == nowDay)
		{
			calStr += "<td class='now'>" + i + "</td>";
		}
		else if(week%7==0)
		{
			calStr += "<td class='sat'>" + i + "</td>";
		}
		else if(week%7==1)
		{
			calStr += "<td class='sun'>" + i + "</td>";
		}
		else
		{
			calStr += "<td>" + i + "</td>";
		}
		
		
		if(week%7 == 0)
		{
			calStr += "</tr><tr>";
		}
	}
	
	// 빈칸 공백 td 발생
	for(int i=1; i<=week; i++, week++)
	{
		if(week%7 == 0)
		{
			break;
		}
		
		calStr += "<td></td>";
		
	}
	
	calStr += "</table>";
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive11_1.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

	td { text-align: center;}
	td.now { background-color: aqua; font-weight: bold;}
	td.nowSun { background-color: aqua; font-weight: bold; color: red;}
	td.nowSat { background-color: aqua; font-weight: bold; color: blue;}
	td.sun { color: red;}
	td.sat { color: blue;}
</style>

<script type="text/javascript">

	function formCalendar(obj)
	{
		obj.submit();
	}

</script>

</head>
<body>

	<!-- 
	○ 데이터 송수신 실습
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트를 처리한다.
	   - 전송한 내용을 자기 자신이 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 년도 구성은 현재 년도 기준으로 이전 10년, 이후 10년으로 구성한다.
	   - 월은 1월부터 12월 까지로 구성한다.
	   
	   [ 2019 ▼ ] 년  [ 10 ▼] 월
	   
	   -------------------------------
	   -------------------------------
	   -------------------------------
	   
	   - 년도의 select box 나 월의 select box 의 내용 변화 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp05/SendAndReceive11.jsp 로 한다.
 -->

	<div>
		<h1>JSP를 이용한 데이터 송수신 실습</h1>
		<hr>
	</div>

	<div>
		<h2>SendAndReceive11.jsp -> SendAndReceive11.jsp</h2>
	</div>

	<div>
		<form action="" method="post">
			<select id="year" name="year" onchange="formCalendar(this.form)">
				<%=yOptions %>
			</select>년 
			
			<select id="month" name="month" onchange="formCalendar(this.form)">
				<%=mOptions %>
			</select>월
		</form>
	</div>
	<br><br>
	
	<div>
		<%-- <h2><%=selectYear %></h2>  --%>
		<%-- <h2><%=selectMonth %></h2> --%>
		<%=calStr %>
	</div>
	

</body>
</html>