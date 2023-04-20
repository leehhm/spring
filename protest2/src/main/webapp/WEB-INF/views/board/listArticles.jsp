<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@	taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<style>
		.cls1 {text-decoration : none;}
		.cls2 {text-align : center; font-size : 30px;}
	</style>
<meta charset="UTF-8">
<title>글목록창</title>
</head>
<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
		if (isLogOn != '' && isLogOn != 'false') {
			location.href = articleForm;
		} else {
			alert("로그인후 글쓰기 가능합니다.");
			location.href = loginForm + '?action=/board/articleForm.do'
		}
	}
</script>
<body>
	<body>
		<table align = "center" border ="1" width = "80%">
			<tr height = "10" align = "center" bgcolor = "lightgreen">
				<td>글번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성일</td>
			</tr>
		<c:choose>
			<c:when test= "${empty articlesList }">
				<tr height = "10">
					<td colspan = "4">
						<p align = "center">
							<b><span style = "font-size : 9pt">등록된글이없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test = "${articlesList != null }">
				<c:forEach var = "articlesList" items = "${articlesList }" varStatus = "articleNum">
					<tr align = "center">
						<td width = "5%">${articleNum.count }</td>
						<td width = "10">${articlesList.id }</td>
						<td align = "left" width = "35%">
						<span style = "padding-right : 30px"></span>
						<c:choose>
							<c:when test = "${articlesList.level > 1 }">
							<c:forEach begin = "1" end = "${articlesList.level }" step = "1"><!-- [답변] 위치 선정 level에 따라 칸 이동 -->
								<span style = "padding-left : 10px"></span>
							</c:forEach>
				<span style = "font-size : 12px">[답변]</span>
					<a class = "cls1" href = "${contextPath}/board/viewArticle.do?articleNO=${articlesList.articleNO}">
						${article.title}
					</a>
							</c:when>
							<c:otherwise>
								<a class = "cls1" href = "${contextPath}/board/viewArticle.do?articleNO=${articlesList.articleNO}"><!-- [답변] 이후에 들어갈 title -->
									${articlesList.title}
								</a>
							</c:otherwise>
						</c:choose>
						</td>
						<td width = "10%">${articlesList.writeDate }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
		</table>
		<%-- <a class = "cls1" href = "${contextPath}/board/articleForm.do"><p class = "cls2">글쓰기</p></a> --%>
		<a class = "cls1" href = "javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do','${contextPath}/member/loginForm.do')">
		<p class = "cls2">글쓰기</p>
		</a>
	</body>
</body>
</html>