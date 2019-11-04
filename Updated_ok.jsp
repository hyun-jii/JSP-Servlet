<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>


<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.updateData(dto);
	
	// result 값에 따른 분기 가능
	
	DBConn.close();
	
	// 현재 페이지 세션에서 가져오기
	String pageNum = (String)session.getAttribute("pageNum");
	
	response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
%>