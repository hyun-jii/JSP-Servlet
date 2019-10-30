<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01_ok.jsp
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// dao 활용 -> 로그인에 관여하는 관련 테이블의 데이터와 비교
	//			-> 로그인 액션 처리
	
	String memberId = "superman";
	String memberPwd = "123456";
	String memberName = "박혜민";
	
	if(userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// session 에 키, 값, 저장
		session.setAttribute("userId", userId);
		session.setAttribute("userName", memberName);
		
		// 클라이언트가 다시 페이지를 요청할 수 있도록 처리
		response.sendRedirect("TestSession01.jsp");
	}

%>