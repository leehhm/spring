<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
<%@	taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<c:set var = "contextPath" value = "${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보출력창</title>
</head>
<body>
	<table align = "center" width = "100%" border = "1">
		<tr align = "center" bgcolor = "lightgreen">
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="7%">이름</td>
			<td width="7%">이메일</td>
			<td width="7%">가입일</td>
			<td width="7%">삭제</td>
			<td width="7%">수정</td>
		</tr>
		
		<c:forEach var="mem" items="${membersList}">
			<tr align = "center">
				<td width = "7%">${membersList.id}</td>
				<td width = "7%">${membersList.pwd}</td>
				<td width = "7%">${membersList.name}</td>
				<td width = "7%">${membersList.email}</td>
				<td width = "7%">${membersList.joinDate}</td>
				<td><a href = "${contextPath}/member/removeMember.do?id=${membersList.id}">삭제하기</a></td>
				<td><a href = "${contextPath}/member/modMember.do?id=${membersList.id}">수정하기</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href = "${contextPath}/member/memberForm.do">
		<h1 style = "text-align : center">회원가입</h1>
	</a>
</body>
</html>