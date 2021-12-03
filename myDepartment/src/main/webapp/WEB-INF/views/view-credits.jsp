<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학기별 이수학점</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view-credits.css">
</head>
<body>
<h1><a class="front" href="${pageContext.request.contextPath}/bachelorAccess">학사정보시스템</a></h1>
<div class="home"><a class="front" href="${pageContext.request.contextPath}/"><strong>홈</strong></a></div>
	<br><hr>
	<div class="info"><h2>학기별 이수학점 조회</h2></div>
	<table class="table">
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>취득 학점</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bachelorSimple" items="${bachelorSimple}">
				<tr>
					<td><c:out value="${bachelorSimple.getYear()}"></c:out></td>
					<td><c:out value="${bachelorSimple.getSemester()}"></c:out></td>
					<td><c:out value="${bachelorSimple.getCredit()}"></c:out></td>
					<td><a href="${pageContext.request.contextPath}/bachelorAccess/credit/details?year=${bachelorSimple.getYear()}
					&semester=${bachelorSimple.getSemester()}"><c:out value="링크"></c:out></a></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr style="background:yellow">
				<td><bold>총계</bold></td>
				<td></td>
				<td><strong>${creditSum}</strong></td>
				<td></td>
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