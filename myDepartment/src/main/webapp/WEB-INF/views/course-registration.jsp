<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/course-registration.css">
</head>
<body>
	<h1>
		<a class="front"
			href="${pageContext.request.contextPath}/bachelorAccess">학사정보시스템</a>
	</h1>
	<div class="home">
		<a class="front" href="${pageContext.request.contextPath}/"><strong>홈</strong></a>
	</div>
	<br>
	<hr>
	<div class="info">
		<h2>수강신청</h2>
	</div>
	<p style="text-align: center">2022년 1학기에 수강할 과목을 신청해주세요.</p>
	<c:if test="${duplicateCheck eq 1}">
		<p class="error">이미 신청하신 과목입니다!</p>
	</c:if>
	<br>
	<sf:form method="post"
		action="${pageContext.request.contextPath}/bachelorAccess/docreate"
		modelAttribute="bachelor">
		<table class="formtable">
			<thead>
				<tr>
					<th>년도</th>
					<th>학기</th>
					<th>교과목명</th>
					<th>교과구분</th>
					<th>담당교수</th>
					<th>학점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><sf:input class="control" type="text" path="year" /></td>
					<td><sf:input class="control" type="text" path="semester" /></td>
					<td><sf:input class="control" type="text" path="title" /></td>
					<td><sf:input class="control" type="text" path="division" /></td>
					<td><sf:input class="control" type="text"
							path="professor_name" /></td>
					<td><sf:input class="control" type="number" path="credit" /></td>
				</tr>
				<tr>
					<td><sf:errors class="error" path="year" /></td>
					<td><sf:errors class="error" path="semester" /></td>
					<td><sf:errors class="error" path="title" /></td>
					<td><sf:errors class="error" path="division" /></td>
					<td><sf:errors class="error" path="professor_name" /></td>
					<td><sf:errors class="error" path="credit" /></td>
				</tr>
			</tbody>
		</table>
		<div class="button_div">
			<input type="submit" value="신청하기">
		</div>
	</sf:form>
</body>
</html>