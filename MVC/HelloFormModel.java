/*=============================
 	HelloFormModel.java
 ==============================*/
package kr.co.logic;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloFormModel
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		
		String result = "WEB-INF/HelloForm.jsp";
		
		// 데이터 수신
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		// 추가적인 업무 처리 삽입 가능~!!!
		firstName = "[" + firstName + "]";
		lastName = "[" + lastName + "]";
		
		// 상황에 따른 뷰 선택(지정) 제안 가능~!!!
		
		
		// 데이터 전달
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		
		
		
		return result;
	}

}
