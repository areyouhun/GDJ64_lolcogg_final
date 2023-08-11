<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/champion_predict/style_champion_predict.css">
<!------------------------------------>
<title>챔피언 예측</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <!-- Title -->
                <div class="title-margin"></div>
                <div class="title-container">
                    <p class="subTitle fs-20">CHAMPION PREDICT</p>
                    <p class="mainTitle fs-35">챔피언 예측</p>
                    <div>
                        <p class="content fs-20">LCK 경기일정을 확인 후 승부예측에 도전해보세요!</p>
                        <p class="content fs-20">종료된 경기 클릭시 경기결과 페이지로 이동합니다.</p>
                    </div>
                </div>

				<!-- Content -->
				
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->

<!-------------------------------------------->
</body>
</html>
