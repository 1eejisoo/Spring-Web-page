<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 내역 조회</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view-credits.css">
</head>
<body>
<h1><a class="front" href="${pageContext.request.contextPath}/bachelorAccess">학사정보시스템</a></h1>
<div class="home"><a class="front" href="${pageContext.request.contextPath}/"><strong>홈</strong></a></div>
	<br><hr>
	<div class="info"><h2>2022년 1학기 수강신청 내역 조회</h2></div>
	<table class="table">
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
			<c:forEach var="courseRegistration" items="${courseRegistration}">
				<tr>
					<td><c:out value="${courseRegistration.getYear()}"></c:out></td>
					<td><c:out value="${courseRegistration.getSemester()}"></c:out></td>
					<td><c:out value="${courseRegistration.getTitle()}"></c:out></td>
					<td><c:out value="${courseRegistration.getDivision()}"></c:out></td>
					<td><c:out value="${courseRegistration.getProfessor_name()}"></c:out></td>
					<td><c:out value="${courseRegistration.getCredit()}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
			</tr>
		</tfoot>
	</table>
<div class="button_div">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
		<c:url var="logoutUrl" value="/logout"/>
		<form action="${logoutUrl}" method="POST">
			<input type=submit class="button" value="Log out"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</c:if>
	</div>
</body>
</html>