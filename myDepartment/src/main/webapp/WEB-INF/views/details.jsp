<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/view-credits.css">
</head>
<body>
	<%
	String year = request.getParameter("year");
	String semester = request.getParameter("semester");
	%>
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
		<h2><%=year%>학년도
			<%=semester%>학기 학사정보 입니다.
		</h2>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>교과코드</th>
				<th>교과목명</th>
				<th>교과구분</th>
				<th>담당교수</th>
				<th>학점</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="detailsBachelor" items="${detailsBachelor}">
				<tr>
					<td><c:out value="${detailsBachelor.getYear()}"></c:out></td>
					<td><c:out value="${detailsBachelor.getSemester()}"></c:out></td>
					<td><c:out value="${detailsBachelor.getCourse_id()}"></c:out></td>
					<td><c:out value="${detailsBachelor.getTitle()}"></c:out></td>
					<td><c:out value="${detailsBachelor.getDivision()}"></c:out></td>
					<td><c:out value="${detailsBachelor.getProfessor_name()}"></c:out></td>
					<td><c:out value="${detailsBachelor.getCredit()}"></c:out></td>

				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
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