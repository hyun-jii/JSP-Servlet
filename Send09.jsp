<%@ page  contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function formChange(obj)
	{
		//alert("함수호출확인");
		
		// ※ obj 변수에는 form 객체가 저장되어 있다.
		//    필요에 따라 전송하기 전에 검증 절차를 추가하는 것이 가능하다.
		
		obj.submit();
		//-- 『폼객체.submit();』 함수의 호출을 통해
		//    form 객체의 데이터를 서버로 전송하는 것이 가능하다.
	}

</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습
	   - 구구단 결과를 출력하는 JSP 페이지를 구성한다.
	   - 원하는 단수를 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트를 처리한다.
	   - select box 선택 시
	     해당 단의 구구단 내용을 출력하는 JSP 페이지로 데이터를 전달하여
	     내용을 구성할 수 있도록 한다.
	     사용자의 최초 요청 주소는
	     http://localhost:8090/WebApp05/Send09.jsp 로 한다.
	     
	○ Send09.jsp
	   Receive09.jsp
 -->

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>Send09.jsp ● -> Receive09.jsp ○</h2>
</div>

<div>
	<h3>구구단 입력</h3>
	<div>
		<form action="Receive09.jsp" method="get">
			단 수 선택
			<select id="dan" name="dan" onchange="formChange(this.form)">
				<option>== 단 선택 ==</option>
				<option value="1">1단</option>
				<option value="2">2단</option>
				<option value="3">3단</option>
				<option value="4">4단</option>
				<option value="5">5단</option>
				<option value="6">6단</option>
				<option value="7">7단</option>
				<option value="8">8단</option>
				<option value="9">9단</option>
			</select>
		</form>
	
	</div>
</div>

</body>
</html>