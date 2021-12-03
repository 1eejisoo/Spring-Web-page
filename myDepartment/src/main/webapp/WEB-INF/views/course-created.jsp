<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 완료</title>

<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}

h1 {
	margin-left: 20px;
	margin-top: 30px;
}

.link:hover {
	color: #00ff00;
}

.link {
	text-decoration: none;
	color: black;
}

.front {
	margin-top: 20px;
}

.home {
	text-align: right;
	margin-right: 50px;
	font-size: 20px;
}

.info {
	text-align: center;
	color: #000000;
	font-size: 30px;
	margin-top:20px;
	margin-bottom: 50px;
}

.create {
	font-size: 15px;
	text-align: center;
}

.create a {
	text-decoration : none;
	color: blue;
	text-decoration: none;
}

.button_div {
	width: 100%;
	text-align: center;
}

.button_div input {
	width: 200px;
	height: 48px;
	margin-top: 80px;
	border-radius: 3px;
	font-size: 16px;
	color: #fff;
	background-color: #000;
}
</style>
</head>
<body>
	<h1 class="front">
		<a class="link"
			href="${pageContext.request.contextPath}/bachelorAccess">학사정보시스템</a>
	</h1>
	<div class="home">
		<a class="link" href="${pageContext.request.contextPath}/"><strong>홈</strong></a>
	</div>
	<br>
	<hr>
	<div class="info">
		<strong>수강신청 완료!</strong>
	</div>
	<div class="create">
		<a
			href="${pageContext.request.contextPath}/bachelorAccess/viewRegistration">
			수강신청내역 확인하러가기 </a>
	</div>
	<div class="button_div">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<c:url var="logoutUrl" value="/logout" />
			<form action="${logoutUrl}" method="POST">
				<input type=submit class="button" value="Log out" /> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</c:if>
	</div>
</body>
</html>