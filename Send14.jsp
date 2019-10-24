<%@ page  contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send14.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>Send14.jsp ● -> Send14_for.jsp ○ -> Receive14.jsp</h2>
	<h2>Send14.jsp ● -> Send14_re.jsp ○ -> Receive14.jsp</h2>
</div>
<br>

<div>
	<form action="" method="post">
		이름 : <input type="text" name="userName"><br><br>
		
		<button type="submit" class="btn" onclick="this.form.action='Send14_re.jsp'">리다이렉트</button>
		<button type="submit" class="btn" onclick="this.form.action='Send14_for.jsp'">포워드</button>
	</form>
</div>

<!-- 페이지 실행 흐름 -->
<!-- 
	① 리다이렉트(Send14.jsp - > Send14_re.jsp -> Receive14.jsp)
	
	   - 리다이렉트는 지정한 주소 『response.sendRedirect("Receive14.jsp")』를
	     클라이언트가 서버에게 재 요청하는 것.
	   - 처음 요청한 request 객체는 리다이렉트로 넘어가는 과정에서 사라진다.
	     (소멸된다.)
	   - 요청이 클라이언트 단위에서 새로 요청하는 것이기 때문에
	     속도가 늦어질 수 있다.
	   - DB에서 insert, update, delete 하고 나면
	     리다이렉트를 지정하여 처리해야 수정된 내용을 적용하여 확인할 수 있다.
	   - 브라우저의 주소를 확인해 보면...
	     최종 도착 페이지에 해당하는 Receive14.jsp 인 것을 확인할 수 있다.
	     
	② 포워드(Send14.jsp - > Send14_for.jsp -> Receive14.jsp)
	
	   - 포워드는 서버 내에 수신된 데이터를 포워딩한 주소로 넘겨주는 것
	   - 이 상황에서는 처음 요청한 request 객체가 유지된다.
	   - 서버 내부에서 주소가 변경된 것이기 때문에
	     클라이언트 입장에서는 이 사실을 알지 못한다.
	     그렇기 때문에 클라이언트에게 보이는 주소는
	     포워딩 되기 이전의 주소만 노출된다.
	   - 보안 측면에서 유리할 수 있다.
	   - 포워딩 시 재전송하는 데이터를 가감할 수 있다.
	      (setAttribute(), getAttribute() 메소드 사용)
	      ※ setAttribute(), getAttribute() 는 문자열 뿐 아니라
	         객체를 넘기고 받을 수 있다.
	         
	   - 서블릿에서 작업한 결과를
	     클라이어트 출력 화면을 구성하는 JSP로 넘길 때
	     포워딩을 많이 사용하게 된다.
	   - 브라우저의 주소를 확인해 보면...
	     최종 도착 페이지가 아닌 Send14_for.jsp 인 것을 확인할 수 있다.  
	   
 -->






</body>
</html>