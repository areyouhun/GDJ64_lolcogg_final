<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/teamdata/style_teamlist.css">
<title>팀 데이터</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section class="teamlist">
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">TEAM DATA</p>
                    <p class="mainTitle fs-35 mainTitleMargin">팀 데이터</p>
                </div>
                <article class="teams">
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                    <button class="btn-img fw-bolder slide-btn"></button>
                </article>

                <article class="match">
                    <div class="match-banner">
                        <h3 class="fw-bold">MATCH RECORDS</h3>
                        <p>두 팀의 전력을 비교해보세요!</p>
                    </div>
                    <div class="match-container">
                        <div class="match-content">
                            <input type="button" class="team-btn team-btn_up_left">
                            <div class="match-content_wrapper">
                                <div class="match-team-container">
                                    <div class="match-content_lineup animated-smooth">
                                        <div class="match-content_team">
                                            <img src="">
                                        </div>
                                        <p class="title"></p>
                                    </div>
                                </div>
                            </div>
                            <input type="button" class="team-btn team-btn_down_left">
                            <input type="hidden" value="">
                        </div>
                        <div class="match-btn">
                            <p class="title">VS</p>
                            <input type="button" class="title" value="전력 비교" onclick="compareTeams(this);">
                            <input type="button" class="title chatBtn" value="실시간 채팅">
                        </div>
                        <div class="match-content">
                            <input type="button" class="team-btn team-btn_up_right">
                            <div class="match-content_wrapper">
                                <div class="match-team-container">
                                    <div class="match-content_lineup animated-smooth">
                                        <div class="match-content_team">
                                            <img src="">
                                        </div>
                                        <p class="title"></p>
                                    </div>
                                </div>
                            </div>
                            <input type="button" class="team-btn team-btn_down_right">
                            <input type="hidden" value="">
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script src="${path}/resources/js/teamdata/script_teamlist.js"></script>
<script>
$(".chatBtn").click(event => {
	openPage("${path}/chat/chatroom", 1200, 550);
});
</script>
</body>
</html>
