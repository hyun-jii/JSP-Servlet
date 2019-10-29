<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreUpdate.jsp
	
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String uName = request.getParameter("uName");
	int scoreKor = Integer.parseInt(request.getParameter("scoreKor"));
	int scoreEng = Integer.parseInt(request.getParameter("scoreEng"));
	int scoreMat = Integer.parseInt(request.getParameter("scoreMat"));
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO dto = new MemberScoreDTO();
		
		dto.setSid(sid);
		dto.setName(uName);
		dto.setKor(scoreKor);
		dto.setEng(scoreEng);
		dto.setMat(scoreMat);
		
		dao.update(sid);
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
