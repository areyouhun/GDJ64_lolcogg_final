<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="matchData" value="${requestScope.matchData}" />
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/champion_predict/style_champion_predict.css">
<style>
.background-img {
    width: 100%;
    height: 100%;
    background-image: linear-gradient(rgba(15, 15, 15, 0.6),
    rgba(15, 15, 15, 1)),url("${path}/resources/images/champion_predict//champion_predict_title_img.png");
    background-size: 100%;
    background-repeat: no-repeat;
    background-position: center top;
}
</style>
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
                        <p class="content fs-20">경기에서 밴픽될 챔피언을 예측해보세요!</p>
                        <p class="content fs-20">밴픽 시뮬레이션도 가능합니다.</p>
                    </div>
                </div>

				<!-- Content -->
				<div class="content-container">
                    <div class="match-date"><fmt:formatDate value="${matchData[0].msDate}" type="date" dateStyle="short" pattern="yy-MM-dd" /></div>
                    <c:if test="${not empty matchData}">
                        <c:forEach var="match" items="${matchData}" varStatus="status">
                            <div class="match">
                                <c:if test="${empty match.msHome}">
	           						<div class="match-team">
	                                    <span class="home-team">TBD</span>
	                                </div>
                                </c:if>
                                <c:if test="${not empty match.msHome}">
	                                <div class="match-team">
	                                    <img src="${path}/resources/images/logo/${match.msHome}_small.png" alt="홈팀">
	                                    <span class="home-team">${match.msHome}</span>
	                                </div>
	                            </c:if>
                                <span class="match-time">
                                    <div>
                                        <fmt:formatDate value="${match.msDate}" type="time" timeStyle="short" />
                                    </div>
                                    <span>VS</span>
                                </span>
                                <c:if test="${empty match.msAway}">
	           						<div class="match-team">
	                                    <span class="away-team">TBD</span>
	                                </div>
                                </c:if>
                                <c:if test="${not empty match.msAway}">
	                                <div class="match-team">
                                        <span class="away-team">${match.msAway}</span>
	                                    <img src="${path}/resources/images/logo/${match.msAway}_small.png" alt="어웨이팀">
	                                </div>
	                            </c:if>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty matchData}">
                        <div class="no-match">
                            <span id="noScheduleMsg">
                                예정된 경기가 없습니다... :(
                            </span>
                        </div>
                    </c:if>
                    <div class="experience">
                        <button class="experience-btn">체험하기</button>
                    </div>
				</div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
    $(function(){
        $('.match').click(function() {
            if('${loginMember}' === '') {
                alert('로그인 후 이용 가능합니다.');
                return;
            }

            const HOME_TEAM = $(this).find('.home-team').text();
            const AWAY_TEAM = $(this).find('.away-team').text();
            const MATCH_DATE = $('.match-date').text();
            location.href = '${path}/champion_predict/predict_play?homeTeam=' + HOME_TEAM + '&awayTeam=' + AWAY_TEAM + '&matchDate=' + MATCH_DATE;            
        });

        $('.experience-btn').click(function() {
            location.href = '${path}/champion_predict/predict_experience';
        });
    });
</script>
<!-------------------------------------------->
</body>
</html>
