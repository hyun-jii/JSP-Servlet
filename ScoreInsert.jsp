<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String kor = request.getParameter("scoreKor");
	String eng = request.getParameter("scoreEng");
	String mat = request.getParameter("scoreMat");
	
	Connection conn = DBConn.getConnection();
	
	try
	{
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %s, %s, %s)", name, kor, eng, mat);
		
		Statement stmt = conn.createStatement();
		
		int n = stmt.executeUpdate(sql);
		
		
		stmt.close();
	}
	catch(Exception e)
	{
		// 서버측 콘솔에서 확인
		System.out.println(e.toString());
	}
	finally
	{
		DBConn.close();
	}
	
	// 클라이언트가 다시 요청해야 할 url 건네주기(sendRedirect() 메소드 활용)
	response.sendRedirect("ScoreList.jsp");

%>
