<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- CSS -->
<title>신고관리</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
				<article class="admin-common-container">
					<div class="admin-common-upper">
						<p class="mainTitle fs-35 mainTitleMargin">상점관리</p>
						<div class="flex-grow"></div>
						<div class="admin-common-link">
							<a class="title" href="${path}/admin/reportManagement">신고관리</a>
							<a class="title" href="${path}/admin/memberManagement">회원관리</a>
						</div>
					</div>

					<!-- WRITE YOUR CODE HERE -->
				</article>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
</body>
</html>
