<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>학사정보</title>
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}

.bachelor {
	width: 100%;
	margin-bottom: 100px;
}

.bachelor .t {
	float: right;
	font-size: 20px;
	background-color: black;
	margin-right: 40px;
	padding: 20px;
	overflow: hidden;
}

.bachelor .t:hover {
	background-color: gray;
}

.bachelor a {
	text-decoration: none;
	color: white;
	display: block;
}

.bachelor:hover {
	background-color: gray;
}

img {
	padding: 20px;
}

.text {
	padding: 20px;
	margin-left: 20px;
	text-align: center;
	font-size: 18px;
}

.button_div {
	width: 100%;
	text-align: center;
}

.button_div .button {
	width: 200px;
	height: 48px;
	margin-top: 30px;
	border-radius: 3px;
	font-size: 16px;
	color: #fff;
	background-color: #000;
}
}
</style>
</head>
<body>
	<h1 style="text-align: center">학사정보시스템</h1>
	<br>
	<div class="bachelor">
		<div class="t">
			<strong><a
				href="${pageContext.request.contextPath}/bachelorAccess">학사정보
					보러가기</a></strong>
		</div>
	</div>
	<div style="display: inline-block">
		<img style="float: left"
			src="https://www.hansung.ac.kr/sites/hansung/images/sub/%EC%83%81%EC%83%81%EB%B6%80%EA%B8%B0%ED%94%84%EB%A0%8C%EC%A6%88.jpg"
			alt="This is Hansung Character" width="600">

		<div class="text" style="displat: inline-block">
			지식중심 사회의 발전에 따라 컴퓨터, 스마트폰, 네트워크 등 정보기술의 중요성이 갈수록 커지고 있다. 컴퓨터공학부에서는
			컴퓨터 시스템에 대한 기본 지식과 핵심 기술에 대한 충실한 학습과 이해를 바탕으로, 산업현장에서 필요로 하는 다양한 시스템
			소프트웨어 및 응용 소프트웨어를 설계, 구현, 활용할 수 있는 개발전문가를 양성하는 것을 목적으로 한다. <br>구체적으로
			컴퓨터공학부에서는 <br>
			<br>
			<strong>안드로이드</strong>와 같은 모바일 소프트웨어 개발자, <br>
			<strong>빅데이터</strong> 분석 및 코딩 전문가,<br> 스프링 등의 <strong>웹</strong>
			서비스 프로그래밍 개발 전문가,<br>
			<strong>디지털 콘텐츠ㆍ가상 현실</strong> 프로그래밍 전문가를<br>
			<br> 양성하는데 초점을 맞추고 교육한다. 이를 위해 컴퓨터 하드웨어 및 소프트웨어 기초 이론 교육, 고급
			프로그래밍 및 멀티미디어 개발 기술 교육, 오픈소스 소프트웨어 활용 교육, 프로젝트 및 현장 실습 교육을 실시한다. 학부
			고학년에서는 4개 트랙의 전공심화 교육을 실시한다.

		</div>
	</div> 
	<div class="button_div">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<c:url var="logoutUrl" value="/logout" />

			<form action="${logoutUrl}" method="POST">
				<input type=submit class="button" value="Logout" /> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</c:if>
	</div>
</body>
</html>
