<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberInsert.jsp
	//-- 데이터베이스의 테이블(TBL_MEMBER) 에
	//   회원 데이터 추가 액션처리 수행
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		//데이터 베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성 (add() 메소드 호출 위해 필요)
		MemberDTO member = new MemberDTO();
		
		member.setName(uName);
		member.setTel(uTel);
		
		// insert 쿼리문을 수행하는 메소드 호출 -> add()
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
			//데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// check~!!!
	response.sendRedirect("MemberSelect.jsp");
	//-- 클라이언트가 MemberSelect.jsp 를 다시 요청할 수 있도록 처리
		

%>
