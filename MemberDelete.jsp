<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberDelete.jsp
	
	String sid = request.getParameter("sid");

	MemberDAO dao = new MemberDAO();
	
	String strPage = "MemberSelect.jsp";
	
	try
	{
		dao.connection();
		
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 sid를 참조하는 TBL_SCORE 테이블 내의 개수
		
		if(checkCount == 0 )
		{
			dao.delete(sid);
			strPage = "MemberSelect.jsp";
		}
		else
		{
			strPage = "Notice.jsp";
			//-- 제거 못하는 사유 안내 페이지 + 돌아가기 버튼
			//-- TBL_SCORE 테이블의 데이터가 TBL_MEMBER 테이블의 SID를 
			//   참조하고 있는 경우는 삭제 불가능~!!!
		}
		
		//dao.delete(sid);
		
		
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
	
	response.sendRedirect(strPage);
%>
