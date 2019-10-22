/*=============================
 		Test005.java
 		- Servlet 실습
===============================*/

// HttpServlet 을 상속받는 클래스로 전환 -> Servlet 생성

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	//get 방식의 요청이든....post 방식의 요청이든...
	//둘 다 처리할 수 있는 사용자 정의 메소드 구성
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지로부터 데이터 수신
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디 : " + userId + ", 패스워드 :" + userPwd;
		
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("Test005.java");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<div>");
		out.print("<h1>");
		out.print("서블릿 관련 실습");
		out.print("</h1>");
		out.print("<hr>");
		out.print("</div>");
		out.print("<div>");
		out.print("<h2>HttpServlet 클래스를 활용한 서블릿 테스트</h2>");
		out.print("<p>" + str + "</p>");
		out.print("<p>" + "method :" + request.getMethod() + "</p>");
		out.print("<p>" + "클라이언트 IP Address :" + request.getRemoteAddr() + "</p>");
		out.print("<p>" + "URI :" + request.getRequestURI() + "</p>");
		out.print("</div>");
		out.print("</body>");
		out.print("</html>");
	}
	
	
}
