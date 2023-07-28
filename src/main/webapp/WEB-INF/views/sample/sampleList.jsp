<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SAMPLE</title>
</head>
<body>
	<c:if test="${not empty sample}">
		<table>
			<tr>
				<td>닉네임</td>
				<td>이름</td>
				<td>팀</td>
			</tr>
			<c:forEach var="player" items="${sample}">
				<tr>
					<td><c:out value="${player['PLAYER_NICKNAME']}"/></td>
					<td><c:out value="${player['PLAYER_NAME']}"/></td>
					<td><c:out value="${player['TEAM_ABBR']}"/></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>