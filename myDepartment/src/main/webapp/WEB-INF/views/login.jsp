<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}

h2 {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

.container {
	position: relative;
	width: 320px;
	margin: 0 auto;
}

.login_box {
	margin: 35px 0 0;
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #fff;
	box-sizing: border-box;
}

.msg {
	font-size: 13px;
}

.input {
	position: relative;
	width: 100%;
	margin: 0;
	padding: 18px 19px 19px;
	box-sizing: border-box;
}

.input_div {
	position: center;
	width: 100%;
	margin: 0;
	padding: 18px 19px 19px;
	box-sizing: border-box;
}

.input_div input {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 14px;
	color: #000;
	border: none;
	outline: 0;
	-webkit-appearance: none;
	background-color: transparent;
}

.label_box {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	line-height: 0;
	text-indent: -9999px;
}

.button {
	margin: 20px 0 0;
	width: 100%;
	height: 48px;
	border-radius: 3px;
	font-size: 16px;
	color: #fff;
	background-color: #000;
}
</style>
</head>
<body>
	<div class="container">
		<form method="post" action="<c:url value="/login"/>">
			<a href="${pageContext.request.contextPath}/"><h2>학사정보시스템</h2></a>

			<div class="login_box">
				<div class="input_div">
					<label class="label_box">Username</label> <input type="text"
						id="username" name="username" placeholder="Username" required
						autofocus>
				</div>
				<div class="input_div" style="border-top: 1px solid #ddd;">
					<label class="label_box">Password</label> <input type="password"
						id="password" name="password" placeholder="Password" style=""
						required>
				</div>
			</div>

			<c:if test="${not empty logoutMsg}">
				<div class="msg" style="color: #0000ff">
					<h4>${logoutMsg}</h4>
				</div>
			</c:if>

			<c:if test="${not empty errorMsg}">
				<div class="msg" style="color: #ff0000">
					<h4>${errorMsg}</h4>
				</div>
			</c:if>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<button class="button" type="submit">Sign in</button>
		</form>
	</div>
</body>
</html>