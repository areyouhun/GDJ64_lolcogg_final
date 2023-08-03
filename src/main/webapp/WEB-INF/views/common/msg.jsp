<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
</head>
<body>
	<script>
		alert("${msg}");
		${script}
		window.location.replace("${pageContext.request.contextPath}${loc}");
	</script>
</body>
</html>