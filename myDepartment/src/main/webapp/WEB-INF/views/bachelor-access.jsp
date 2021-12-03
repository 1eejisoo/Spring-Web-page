<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<title>학사정보 접근</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bachelor-access.css">
</head>
<body>
	<h1>학사정보시스템</h1>
	<div class="home">
		<a href="${pageContext.request.contextPath}/"><strong>홈</strong></a>
	</div>
	<hr>
	<br>
	<div class="menubar">
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/bachelorAccess/credit">학기별
					이수 학점 조회</a></li>
			<li><a
				href="${pageContext.request.contextPath}/bachelorAccess/registration">수강신청
					하러가기</a></li>
			<li><a
				href="${pageContext.request.contextPath}/bachelorAccess/viewRegistration">수강신청내역
					보러가기</a></li>
		</ul>
	</div>
	<div class="button_div">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<c:url var="logoutUrl" value="/logout" />
			<form class-"form-inline" action="${logoutUrl}" method="POST">
				<input type=submit class="button" value="Logout" /> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</c:if>
	</div>

</body>
</html>