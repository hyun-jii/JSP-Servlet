<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
</head>
<body>

<table style="width: 400px;"border="1">
	<tr>
		<td colspan="2">
			<jsp:include page="Top.jsp" flush="false"></jsp:include>
		</td>
	</tr>
	<tr style="height: 300px;">
		<td style="width: 100px;">
			<jsp:include page="Left.jsp" flush="false"></jsp:include>
		</td>
		<td>
			메인 화면
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="Bottom.jsp" flush="false"></jsp:include>
		</td>
	</tr>
</table>

</body>
</html>