<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 검색 추가 -----------------------------------------------------------------
	
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if(searchKey != null)
	{
		searchValue = URLDecoder.decode(searchValue, "UTF-8");
	}
	else
	{
		searchKey = "subject";
		searchValue = "";
	}
	
	// 현재 페이지 세션 저장
	session.setAttribute("pageNum", pageNum);
	
	// 조회수 증가
	dao.updateHitCount(num);
	
	// 해당 게시물 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 이전, 다음 게시물 번호 확인
	int nextNum = dao.getNextNum(num);
	int beforeNum = dao.getBeforeNum(num);
	
	//BoardDTO prev = dao.getReadData(beforeNum);
	//BoardDTO next = dao.getReadData(nextNum); 
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
	{
		dtoBefore = dao.getReadData(beforeNum);
	}
	if(nextNum != -1)
	{
		dtoNext = dao.getReadData(nextNum);
	}
	
	if(dto==null)
	{
		response.sendRedirect("List.jsp");
	}
	
	// 게시물의 라인 수 처리
	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물 내용의 엔터를 <br> 로 변경
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
	// 검색 추가 ------------------------------------------------------------------------
	String param = "";
	
	// 검색 데이터가 있으면...
	if(searchValue != null && !searchValue.equals(""))
	{
		param = "&searchKey=" + searchKey;
		param = "&searchValue=" + URLDecoder.decode(searchValue, "UTF-8");
	}
	
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">

</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div> <!-- #bbs_title -->
	
	<div id="bbsArticle">
		
		<div id="bbsArticle_header">
			<%=dto.getSubject() %>
		</div> <!-- #bbsArticle_header -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>
				<dt>라인수</td>
				<dd><%=lineSu %></dd>
			</dl>
		</div> <!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div> <!-- .bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;">
						<%=dto.getContent() %>
					</td>
				</tr>	
			</table>
		</div> <!-- #bbsArticle_content -->
		
		<div class="bbsArticle_bottomLine">
			
			<%
			if(beforeNum != -1)
			{
			%>
				<a href="<%=cp %>/Article.jsp?num=<%=beforeNum %>&pageNum=<%=pageNum %>">이전글 : <%=dtoBefore.getSubject() %> </a>
			<%
			}
			else
			{
			%>
				이전글 : 없음
			<%
			}
			%>
			
		</div> <!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">
			<%
			if(nextNum != -1)
			{
			%>
				<a href="<%=cp %>/Article.jsp?num=<%=nextNum %>&pageNum=<%=pageNum %>">다음글 :<%=dtoNext.getSubject() %></a>
			<%
			}
			else
			{
			%>
				다음글 : 없음
			<%
			}
			%> 
			
			
		</div> <!-- .bbsArticle_noLine -->

	</div> <!-- bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		From : <%=dto.getIpAddr() %>
	</div> <!-- .bbsArticle_noLine -->
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2" onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>'">
			<input type="button" value="삭제" class="btn2" onclick="javascript:location.href='<%=cp%>/Delete.jsp?num=<%=dto.getNum()%>'">
		</div> <!-- #leftFooter -->
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2" onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum %>'">
		</div> <!-- #rightFooter -->
	</div> <!-- #bbsArticle_footer -->

</div> <!-- #bbs -->

</body>
</html>