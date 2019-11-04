<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호 최대값에다 1을 더해서 set 하는 과정
	dto.setNum(maxNum+1);
	
	// 클라이언트 PC 의 ip address 를 얻어다 set 하는 과정
	dto.setIpAddr(request.getRemoteAddr());
	
	dao.insertData(dto);
	
	response.sendRedirect("List.jsp");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created_ok.jsp</title>
</head>
<body>

</body>
</html>