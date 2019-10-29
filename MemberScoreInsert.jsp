<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreInsert.jsp
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String sid = request.getParameter("sid");
	int scoreKor = Integer.parseInt(request.getParameter("scoreKor"));
	int scoreEng = Integer.parseInt(request.getParameter("scoreEng"));
	int scoreMat = Integer.parseInt(request.getParameter("scoreMat"));
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		
		score.setSid(sid);
		score.setName(uName);
		score.setKor(scoreKor);
		score.setEng(scoreEng);
		score.setMat(scoreMat);
		
		dao.add(score);
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
	
	response.sendRedirect("MemberScoreSelect.jsp");
%>
