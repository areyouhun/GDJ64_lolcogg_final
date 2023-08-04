<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<spring:eval var="champImgPath" expression="@environment.getProperty('lolcogg.datadragon.image.champion')" />
<spring:eval var="champInfoPath" expression="@environment.getProperty('lolcogg.datadragon.info.champion')" />
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
                            <li class="set-tab_btn fw-bold ${status.index eq 0 ? 'active' : ''}" data-id="${status.index}"><c:out value="${status.count}세트"/></li>
                    	</c:forEach>
                    </ul>

                    <div class="set-container">
                        <c:forEach var="set" items="${matchResultDetail}" varStatus="status">
                            <div class="set-result ${status.count eq 1 ? 'show' : ''}">
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
                                    <table class="set-table">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="banned-blue">
                                                        <c:forEach var="bannedChampion" items="${set.blueSideBanned}">
                                                            <div>
                                                                <img src="${champImgPath}${bannedChampion}.png">
                                                                <p class="bannedName"><c:out value="${bannedChampion}"/></p>
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
                                                                <p class="bannedName"><c:out value="${bannedChampion}"/></p>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><h2 class="set-kills"><c:out value="${set.blueSideKills}"/></h2></td>
                                                <td><p class="set-category">Kills</p></td>
                                                <td><h2 class="set-kills"><c:out value="${set.redSideKills}"/></h2></td>
                                            </tr>
                                            <tr>
                                                <td class="set-objects">
                                                    <div class="set-objects-obj">
                                                        <p>포탑</p>
                                                        <h2><c:out value="${set.blueSideTowers}"/></h2>
                                                    </div>
                                                    <div class="set-objects-obj">
                                                        <p>전령</p>
                                                        <h2><c:out value="${set.blueSideRiftHeralds}"/></h2>
                                                    </div>
                                                    <div class="set-objects-obj">
                                                        <p>드래곤</p>
                                                        <h2><c:out value="${set.blueSideDragons}"/></h2>
                                                    </div>
                                                    <div class="set-objects-obj">
                                                        <p>바론</p>
                                                        <h2><c:out value="${set.blueSideBarons}"/></h2>
                                                    </div>
                                                </td>
                                                <td><p class="set-category">Objects</p></td>
                                                <td class="set-objects">
                                                    <div class="set-objects-obj">
                                                        <p>바론</p>
                                                        <h2><c:out value="${set.redSideBarons}"/></h2>
                                                    </div>
                                                    <div class="set-objects-obj">
                                                        <p>드래곤</p>
                                                        <h2><c:out value="${set.redSideDragons}"/></h2>
                                                    </div>
                                                    <div class="set-objects-obj">
                                                        <p>전령</p>
                                                        <h2><c:out value="${set.redSideRiftHeralds}"/></h2>
                                                    </div>
                                                    <div class="set-objects-obj">
                                                        <p>포탑</p>
                                                        <h2><c:out value="${set.redSideTowers}"/></h2>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="set-table">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div>
                                                        <h2 class="blue-player-name"><c:out value="${fn:toUpperCase(set.blueSideTopPlayer)}"/></h2>
                                                    </div>
                                                </td>
                                                <td><p class="set-category set-position">TOP</p></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><p class="set-category set-position">JUNGLE</p></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><p class="set-category set-position">MID</p></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><p class="set-category set-position">BOT</p></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><p class="set-category set-position">SUPPORT</p></td>
                                                <td></td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
    $.get("${champInfoPath}")
    .then(data => {
        $(".bannedName").each((index, pName) => {
            $(pName).text(data.data[$(pName).text()].name);
            }
        );
    });

    $(".top-victory_or_defeat>p").each((index, element) => {
        $(element).text() === "VICTORY" ? changeStyle(element, "var(--lol-white)", "#3D9B62") : changeStyle(element, "var(--lol-black)", "#929292");
    });

    function changeStyle(element, color, bgColor) {
        $(element).css({
            "color": color,
            "backgroundColor": bgColor
        });
    }

    $('.set-tab').click(event => {
        showSet(event.target.dataset.id);
    });

    function showSet(index) {
        $('.set-tab_btn').removeClass('active');
        $('.set-tab_btn').eq(index).addClass('active');

        $('.set-result').removeClass('show');
        $('.set-result').eq(index).addClass('show');
    }
</script>
</body>
</html>
