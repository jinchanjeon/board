<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String USERID = (String) session.getAttribute("SessionUserID");
%>

<table>
	<tr>
		<th width="25%">홈</th>
		<th width="25%"><a href="/myproject2/board/boardList.do">게시판</a></th>
		
		
<%
	if(USERID == null){
%>
	<th width="25%"><a href="/myproject2/member/memberWrite.jsp">회원가입</a></th>
	<th width="25%"><a href="/myproject2/member/loginWrite.jsp">로그인</a></th>
		
<%
	}
else{
	
%>
	<th width="25%"><a href="/myproject2/member/memberModify.jsp">회원정보수정</a></th>
	<th width="25%"><a href="/myproject2/member/logout.jsp">로그아웃</a></th>
<%
}
%>	

	</tr>
</table>
</body>
</html>