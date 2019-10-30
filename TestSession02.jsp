<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession02.jsp
	
	//session.removeAttribute("userId");
	//-- 세션의 사용자 아이디 삭제
	
	//session.removeAttribute("userName");
	//-- 세션의 사용자 이름 삭제
	
	session.invalidate();
	//-- 기존 세션에 저장되어 있는 모든 것을 지우고 세션을 초기화 한다.
	
	response.sendRedirect("TestSession01.jsp");
	//-- 사용자가 로그인 페이지를 다시 요청할 수 있도록 안내 처리
%>
