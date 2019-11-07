/*=============================
 	HelloFormController.java
 ==============================*/

package kr.co.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.logic.HelloFormModel;

public class HelloFormController extends HttpServlet
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
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		// Model 객체 연결 -> 업무 로직 수행. View 정보 얻어내기
		HelloFormModel model = new HelloFormModel();
		String view = model.process(request, response);
		
		// View 객체에 대한 연결
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
