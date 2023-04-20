<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored = "false" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var = "contextPath" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>헤더</title>
</head>
<body>
<table border = 0 width = "100%">
	<tr>
		<td>
			<a href = "${contextPath}/member/listMembers.do">
				<img src="${contextPath}/resources/image/duck.webp" width = "300px" height = "200px" />
			</a>
		</td>
		<td>
			<h1><font size = 30>슬프링실습홈페이지!!</font></h1>
		</td>
		<td>
			<c:choose>
				<c:when test = "${isLogOn == true && member != null}">
					<h3>환영합니다. ${member.name}님!</h3>
					<a href = "${contextPath}/member/logout.do"><h3>로그아웃</h3></a>
				</c:when>
			<c:otherwise>
			<a href = "${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
</body>
</html>