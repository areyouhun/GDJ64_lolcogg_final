<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/teamdata/teamdata_page.css">
<!------------------------------------>
<title>SAMPLE</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">TEAM DATA</p>
                    <p class="mainTitle fs-35 mainTitleMargin">팀 데이터</p>
                </div>
                <!--------------------------------- Code below --------------------------------->
                <div class="teams">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                    <input type="button" class="btn-img fw-bolder" value="T1">
                </div>

                <div class="match">
                    <div class="match-banner">
                        <h3 class="fw-bold">MATCH RECORDS</h3>
                        <p>두 팀의 전력을 비교해보세요!</p>
                    </div>
                    <div class="match-content">
                        <div>
                            <input type="button" class="team-btn team-btn_up" value="">
                            <div class="reservation-calendar-wrapper">
                                <div class="reservation-calendar-lineup animated-smooth">
                                    <div class="match-content_team">
                                        <img src="${path}/resources/images/logo/brion_logo_white.png">
                                    </div>
                                    <p class="title">BRO</p>
                                </div>
                            </div>
                            <input type="button" class="team-btn team-btn_down" value="">
                        </div>
                        <div class="match-content-btn">
                            <p class="title">VS</p>
                            <input type="button" class="title" value="전력 비교">
                        </div>
                        <div>
                            <input type="button" class="team-btn team-btn_up">
                            <div class="reservation-calendar-wrapper">
                                <div class="reservation-calendar-lineup animated-smooth">
                                    <div class="match-content_team">
                                        <img src="${path}/resources/images/logo/t1_logo_white.png">
                                    </div>
                                    <p class="title">T1</p>
                                </div>
                            </div>
                            <input type="button" class="team-btn team-btn_down" value="">
                        </div>
                    </div>
                </div>
        		<!------------------------------------------------------------------------------>
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
