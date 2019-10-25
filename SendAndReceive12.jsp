<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Calendar"%>
<%
    // a태그에서 입력받은 연도와 월 가져오기
    String year = request.getParameter("year");
    String month = request.getParameter("month");

    Calendar cal = Calendar.getInstance();

    // 현재 년도와 월 저장
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH) + 1;

    int selectYear = nowYear;
    int selectMonth = nowMonth;

    // 입력받은 년도와 월이 null이 아니라면 계산을 위해 정수형으로 변환
    if (year != null || month != null)
    {
        selectYear = Integer.parseInt(year);
        selectMonth = Integer.parseInt(month);
    }

    // ◀ 누르면 해당월에서 -1
    int preYear = selectYear;
    int preMonth = selectMonth - 1;

    // 해당년도에 1월일때 ◀ 누르면 (년도-1) 그리고 월을 12월로 초기화
    if (preMonth < 1)
    {
        preYear = selectYear - 1;
        preMonth = 12;
    }

    // ▶ 누르면 해당월에서 + 1
    int nextYear = selectYear;
    int nextMonth = selectMonth + 1;

    // 해당년도가 12월 일때 ▶ 누르면 (년도+1) 그리고 월을 1월로 초기화
    if (nextMonth > 12)
    {
        nextYear = selectYear + 1;
        nextMonth = 1;
    }

    // 바뀐 날짜로 세팅
    cal.set(selectYear, selectMonth - 1, 1);

    // 해당 월의 마지막 날
    int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

    // 요일 구하기
    int day = cal.get(Calendar.DAY_OF_WEEK)-1;

    String str="";
    String[] week = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};

    // 테이블 생성
    str += "<table border='1'>";
    str += "<tr>";

    // 요일 생성
    for(int i=0; i<7; i++)
    {
        str += "<th>" + week[i] + "</th>";
    }
    str+= "</tr>";

    str+="<tr>";

    // 공백 생성
    for (int i = 0; i < day; i++)
    {
        str += "<td> </td>";
    }

    // 날짜 생성
    for(int i=1; i<=lastDay; i++)
    {
        str += "<td>" + i + "</td>";

        day++;

        if(day%7 == 0)
        {
            str += "</tr><tr>";
        }
    }

    // 마지막 날짜 뒤 공백 생성
    for(int i=0; i<7-(day%7); i++)
    {
        str += "<td> </td>";
    }

    str += "</table>";

%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SendAndReceive12.jsp</title>

    <style type="text/css">
         * { text-align: center; font-weight: bold; font-family: "맑은 고딕";}
        th { background-color: coral;}
        td { text-align: center; background-color: bisque;}
        a  { text-decoration: none; color: crimson;}
    </style>

</head>
<body>

<!--
○ 데이터 송수신 실습
   - 달력을 출력하는 JSP 페이지를 구성한다.
   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
   - 단, submit 버튼 없이 이벤트 처리를 한다.
   - 전송한 내용을 자신 페이지에서 수신하여 출력하는 형태의 페이지로 구성한다.
   - 만년달력 구성이 아닌 Calendar 객체를 활용하여 처리한다.

   ◀ 2019 년 10 월 ▶

   -------------------
   -------------------

   -『◀』나 『▶』 클릭시
    해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
   - 사용자의 최초 요청 주소는
     『http://localhost:8090/WebApp05/SendAndReceive12.jsp』로 한다.
-->

<div>
    <h1>데이터 송수신 실습(달력)</h1>
    <hr>
</div>

<div>
    <a href="SendAndReceive12.jsp?year=<%=preYear%>&month=<%=preMonth%>">◀</a>
    <%=selectYear%>년 <%=selectMonth%>월
    <a href="SendAndReceive12.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">▶</a>
    <br><br>
    <%=str %>
</div>

</body>
</html>
