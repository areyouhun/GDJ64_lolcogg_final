<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:eval var="champImgPath" expression="@environment.getProperty('lolcogg.datadragon.image.champion')" />
${oingDaddy}
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="matchResultSummary" value="${requestScope.matchResultSummary}"/>
<c:set var="matchResultDetail" value="${requestScope.matchResultDetail}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/teamdata/style_matchResult.css">
<title>경기 결과</title>
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

                <div class="match-summary">
                    <p class="match-summary_date fw-bold"><fmt:formatDate value="${matchResultSummary.MS_DATE}" type="both" pattern="yyyy년 MM월 dd일 HH:mm"/></p>
                    <div class="match-summary_content">
                        <div class="summary_content-team">
                            <div>
                                <img src="${path}/resources/images/logo/${matchResultSummary.MS_HOME}_big.png">
                            </div>
                            <h2 class="title"><c:out value="${matchResultSummary.MS_HOME}"/></h2>
                        </div>
                        <h2 class="title"><c:out value="${matchResultSummary.MS_HOME_SCORE} : ${matchResultSummary.MS_AWAY_SCORE}"/></h2>
                        <div class="summary_content-team">
                            <div>
                                <img src="${path}/resources/images/logo/${matchResultSummary.MS_AWAY}_big.png">
                            </div>
                            <h2 class="title"><c:out value="${matchResultSummary.MS_AWAY}"/></h2>
                        </div>
                    </div>

                    <ul class="set-tab">
                    	<c:forEach var="set" items="${matchResultDetail}" varStatus="status">
                            <c:choose>
                                <c:when test="${status.count eq 1}">
                                    <li class="set-tab_btn active fw-bold"><c:out value="${status.count}세트"/></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="set-tab_btn fw-bold"><c:out value="${status.count}세트"/></li>
                                </c:otherwise>
                            </c:choose>
                    	</c:forEach>
                    </ul>

                    <div class="set-container">
                        <c:forEach var="set" items="${matchResultDetail}" varStatus="status">
                            <c:choose>
                                <c:when test="${status.count eq 1}">
                                    <div class="set-result show">
                                        <div class="set-result-top">
                                            <div class="top-victory_or_defeat">
                                                <p><c:out value="${set.blueSideResult}"/></p>
                                                <p><c:out value="${set.redSideResult}"/></p>
                                            </div>
                                            <div class="side_and_team">
                                                <div class="side">
                                                    <div>
                                                        <img src="${path}/resources/images/side/side_blue.svg">
                                                    </div>
                                                    <p>BLUE SIDE</p>
                                                </div>
                                                <div class="team">
                                                    <div class="team-blue">
                                                        <div>
                                                            <img src="${path}/resources/images/logo/${set.blueSide}_small.png">
                                                        </div>
                                                        <h2><c:out value="${set.blueSide}"/></h2>
                                                    </div>
                                                    <div class="vertical_line"></div>
                                                    <div class="team-red">
                                                        <h2><c:out value="${set.redSide}"/></h2>
                                                        <div>
                                                            <img src="${path}/resources/images/logo/${set.redSide}_small.png">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="side">
                                                    <p>RED SIDE</p>
                                                    <div>
                                                        <img src="${path}/resources/images/side/side_red.svg">
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="set-top-table">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="banned-blue">
                                                                <c:forEach var="bannedChampion" items="${set.blueSideBanned}">
                                                                    <div>
                                                                        <img src="${champImgPath}${bannedChampion}.png">
                                                                        <p><c:out value="${bannedChampion}"/></p>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </td>
                                                        <td><p class="set-category">Banned</p></td>
                                                        <td>
                                                            <div class="banned-red">
                                                                <c:forEach var="bannedChampion" items="${set.redSideBanned}">
                                                                    <div>
                                                                        <img src="${champImgPath}${bannedChampion}.png">
                                                                        <p><c:out value="${bannedChampion}"/></p>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><h2 class="kills"><c:out value="${set.blueSideKills}"/></h2></td>
                                                        <td><p class="set-category">Kills</p></td>
                                                        <td><h2 class="kills"><c:out value="${set.redSideKills}"/></h2></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>
    $(".top-victory_or_defeat>p").each((index, element) => {
        $(element).text() === "VICTORY" ? changeStyle(element, "var(--lol-white)", "#3D9B62") : changeStyle(element, "var(--lol-black)", "#929292");
    });

    function changeStyle(element, color, bgColor) {
        $(element).css({
            "color": color,
            "backgroundColor": bgColor
        });
    }
</script>
</body>
</html>
