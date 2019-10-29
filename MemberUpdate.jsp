<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		MemberDTO member = new MemberDTO();
		
		member.setSid(sid);
		member.setName(userName);
		member.setTel(userTel);
		
		dao.update(member);
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
	
	response.sendRedirect("MemberSelect.jsp");
	
	

%>

<%-- 
   ○ 이전 페이지(MemberSelect.jsp)로 부터 수신한 sid 를 넘기는 방법 ①
      <form action="MemberUpdate.jsp?sid=<%=sid%> method="post" id="memberForm">
      </form>
      로 추가하여 전송
      받는 곳에서는 request.getParameter("sid")로 받기
   
   ○ 이전 페이지(MemberSelect.jsp)로 부터 수신한 sid 를 넘기는 방법 ②
      <input type="hidden" value="<%=sid%>" name="sid">
      로 추가하여 전송
      받는 곳에서는 request.getParameter("sid")로 받기
      
   ○ 이전 페이지(MemberSelect.jsp)로 부터 수신한 sid 를 넘기는 방법 ③
      setAttribute("sid", temp) 와 같은 구문으로 구성하여 
      수신한 데이터를 추가하여 전송하고
      받는 곳에서는 request.getAttribute("sid")로 받기            
--%>
