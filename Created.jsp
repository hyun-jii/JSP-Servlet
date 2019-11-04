<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">

<script type="text/javascript" src="<%=cp %>/js/util.js"></script>

<script type="text/javascript">

	function sendIt()
	{
		f = document.myForm;
		
		str = f.subject.value;
		str.trim();
		//-- javascript 에는 trim() 이 없음.
		//   외부에서 참조한 『util.js』 에 만들어 두었음.
		
		// 테스트
		//alert("■" + str + "■");
		
		if(!str)
		{
			alert("\n게시물 제목을 입력하세요~!!!");
			f.subject.focus();
			return;
		}
		
		str = f.name.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n이름을 입력하세요~!!!");
			f.name.focus();
			return;
		}
		
		// 이메일 검사
		if(f.email.value)
		{
			if(!isValidEmail(f.email.value))
			{
				alert("\n정상적인 이메일 형식을 입력하세요~!!!");
				f.email.focus();
				return;
			}
		}
		
		str = f.pwd.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n게시물 패스워드를 설정하세요~!!!");
			f.pwd.focus();
			return;
		}
		
		f.action = "<%=cp %>/Created_ok.jsp";
		
		f.submit();
	}

</script>

</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<form action="" method="post" name="myForm">
	
		<div id="bbsCreated">
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp; 목</dt>
					<dd>
						<input type="text" name="subject" class="boxTF" size="74" maxlength="100">
					</dd>
				</dl>
			</div> <!-- #bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작 성 자</dt>
					<dd>
						<input type="text" name="name" class="boxTF" size="35" maxlength="20">
					</dd>
				</dl>
			</div> <!-- #bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
						<input type="text" name="email" class="boxTF" size="35" maxlength="50">
					</dd>
				</dl>
			</div> <!-- #bbsCreated_bottomLine -->
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
					</dd>
				</dl>
			</div> <!-- #bbsCreated_content -->
			
			<div id="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="password" class="boxTF" name="pwd" size="35" maxlength="10">
						&nbsp;(게시물 수정 및 삭제 시 필요~!!!)
					</dd>
				</dl>
			</div> <!-- #bbsCreated_noLine -->
			
			<div id="bbsCreated_footer">
				<input type="button" value="등록하기" class="btn2" onclick="sendIt()">
				<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.subject.focus()">
				<input type="button" value="작성취소" class="btn2" onclick="javascript:location.href='<%=cp %>/List.jsp'">
			</div> <!-- bbsCreated_footer -->
			
			
			
		
		</div> <!-- #bbsCreated -->
	
	</form>
	
</div>	<!-- #bbs -->

</body>
</html>