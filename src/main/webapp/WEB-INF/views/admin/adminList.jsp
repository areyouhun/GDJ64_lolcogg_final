<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/admin/style_adminList.css">
<title>관리자 페이지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin admin-container">
                <h3 class="mainTitle fs-35 mainTitleMargin">HELLO, ADMIN!</h3>
				<div class="admin-btn-lineup">
					<a class="title" href="${path}/admin/memberManagement">회원관리</a>
					<a class="title" href="${path}/admin/reportManagement">신고관리</a>
					<a class="title" href="${path}/admin/storeManagement">상점관리</a>
				</div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
</body>
</html>
