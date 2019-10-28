<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%
	// MemberInsert.jsp
	//-- 데이터 입력 처리 페이지
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		//MemberDTO 구성
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		// dao의 add() 메소드 호출 -> insert 쿼리문 수행
		dao.add(member);
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
	
	// 사용자의 손에 URL 주소가 기록되어 있는 쪽지 전달
	response.sendRedirect("MemberList.jsp");
	
%>
