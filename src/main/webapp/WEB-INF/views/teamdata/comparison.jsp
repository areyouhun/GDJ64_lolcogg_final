<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="matchHistory" value="${requestScope.matchHistory}"/>
<c:set var="teamLeft" value="${requestScope.teamLeft}"/>
<c:set var="teamRight" value="${requestScope.teamRight}"/>
<c:set var="numOfMatches" value="${requestScope.numOfMatches}"/>
<c:set var="numOfTeamLeftWins" value="${requestScope.numOfTeamLeftWins}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/teamdata/style_comparison.css">
<title>전력 비교</title>
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
                    <div class="match-summary_content">
                        <div class="summary_content-team">
                            <div>
                                <img src="${path}/resources/images/logo/${teamLeft.TEAM_ABBR}_big.png">
                            </div>
                            <h2 class="title"><c:out value="${teamLeft.TEAM_ABBR}"/></h2>
                        </div>
                        <h2 class="title">VS</h2>
                        <div class="summary_content-team">
                            <div>
                                <img src="${path}/resources/images/logo/${teamRight.TEAM_ABBR}_big.png">
                            </div>
                            <h2 class="title"><c:out value="${teamRight.TEAM_ABBR}"/></h2>
                        </div>
                    </div>

                    <div class="set-container">
                        <div class="bar-layout">
                            <hr class="flex-grow">
                            <p class="fw-bold">SUMMARY</p>
                            <hr class="flex-grow">
                        </div>
                        <table class="set-table">
                            <tbody>
                                <tr>
                                    <td><h2 class="set-kills"><c:out value="${teamLeft.TEAM_RANK}위"/></h2></td>
                                    <td><p class="set-category">순위</p></td>
                                    <td><h2 class="set-kills"><c:out value="${teamRight.TEAM_RANK}위"/></h2></td>
                                </tr>
                                <tr>
                                    <td><h2 class="set-kills"><c:out value="${numOfMatches}전 ${numOfTeamLeftWins}승 ${numOfMatches - numOfTeamLeftWins}패"/></h2></td>
                                    <td><p class="set-category">전적</p></td>
                                    <td><h2 class="set-kills"><c:out value="${numOfMatches}전 ${numOfMatches - numOfTeamLeftWins}승 ${numOfTeamLeftWins}패"/></h2></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="player-stats-date">
                            <p class="fw-bold" style="color: #5F5F5F;">*본 전적은 2023 LCK SPRING과 SUMMER에 치뤄진 경기 데이터를 기반으로 도출한 결과입니다.</p>
                        </div>
                    </div>

                    <div class="team-players">
                        <div class="bar-layout">
                            <hr class="flex-grow">
                            <p class="fw-bold">PLAYERS</p>
                            <hr class="flex-grow">
                        </div>
                        <div class="team-players-info">
                            <div class="players-name">
                                <div>
                                    <p>TOP</p>
                                    <div class="top name-list left"></div>
                                </div>
                            </div>
                            <div class="player-symbol">
                                <img src="${path}/resources/images/position/circle_top.svg">
                            </div>
                            <div class="players-name">
                                <div>
                                    <p>TOP</p>
                                    <div class="top name-list right"></div>
                                </div>
                            </div>
                        </div>
                        <div class="team-players-info">
                            <div class="players-name">
                                <div>
                                    <p>JUNGLE</p>
                                    <div class="jungle name-list left"></div>
                                </div>
                            </div>
                            <div class="player-symbol">
                                <img src="${path}/resources/images/position/circle_jungle.svg">
                            </div>
                            <div class="players-name">
                                <div>
                                    <p>JUNGLE</p>
                                    <div class="jungle name-list right"></div>
                                </div>
                            </div>
                        </div>
                        <div class="team-players-info">
                            <div class="players-name">
                                <div>
                                    <p>MID</p>
                                    <div class="mid name-list left"></div>
                                </div>
                            </div>
                            <div class="player-symbol">
                                <img src="${path}/resources/images/position/circle_mid.svg">
                            </div>
                            <div class="players-name">
                                <div>
                                    <p>MID</p>
                                    <div class="mid name-list right"></div>
                                </div>
                            </div>
                        </div>
                        <div class="team-players-info">
                            <div class="players-name">
                                <div>
                                    <p>BOT</p>
                                    <div class="bot name-list left"></div>
                                </div>
                            </div>
                            <div class="player-symbol">
                                <img src="${path}/resources/images/position/circle_bot.svg">
                            </div>
                            <div class="players-name">
                                <div>
                                    <p>BOT</p>
                                    <div class="bot name-list right"></div>
                                </div>
                            </div>
                        </div>
                        <div class="team-players-info">
                            <div class="players-name">
                                <div>
                                    <p>SUPPORT</p>
                                    <div class="support name-list left"></div>
                                </div>
                            </div>
                            <div class="player-symbol">
                                <img src="${path}/resources/images/position/circle_support.svg">
                            </div>
                            <div class="players-name">
                                <div>
                                    <p>SUPPORT</p>
                                    <div class="support name-list right"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="team-match_history">
                        <div class="bar-layout">
                            <hr class="flex-grow">
                            <p class="fw-bold">MATCH HISTORY</p>
                            <hr class="flex-grow">
                        </div>
                        <table class="match-table">
                            <tbody>
                                <c:choose>
                                    <c:when test="${matchHistory ne null and not empty matchHistory}">
                                        <c:forEach var="match" items="${matchHistory}" varStatus="status">
                                        <tr>
                                            <td class="match_date"><h3><fmt:formatDate value="${match.MS_DATE}" type="both" pattern="MM.dd (E) HH:mm"/></h3></td>
                                            <td class="home">
                                                <h3 class="fw-bolder team_versus"><c:out value="${match.MS_HOME}"/></h3>
                                            </td>
                                            <td>
                                                <div>
                                                    <img src="${path}/resources/images/logo/${match.MS_HOME}_small.png">
                                                </div>
                                            </td>
                                            <td><h3 class="title"><c:out value="${match.MS_HOME_SCORE} : ${match.MS_AWAY_SCORE}"/></h3></td>
                                            <td class="away">
                                                <h3 class="fw-bolder team_versus"><c:out value="${match.MS_AWAY}"/></h3>
                                            </td>
                                            <td>
                                                <div>
                                                    <img src="${path}/resources/images/logo/${match.MS_AWAY}_small.png">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="match-table_option">
                                                    <input type="button" class="match-btn" value="상세 보기"/>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
	                                <tr>
	                                    <td colspan="7"><h3>조회된 경기가 없습니다.</h3></td>
	                                </tr>
	                            </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>
    $.get("${path}/resources/images/team_img.json")
        .then(data => {
            data.forEach((team, index) => {
                if (team.teamAbbr === "${teamLeft.TEAM_ABBR}") {
                    team.players.top.forEach((topPlayer, index) => {
                        index == 0 ? $(".top.name-list.left").append($("<input type='button'>").val(topPlayer.name.toUpperCase())) : $(".top.name-list.left").append($("<span>").text("|")).append($("<input type='button'>").val(topPlayer.name.toUpperCase()));
                    });

                    team.players.jungle.forEach((junglePlayer, index) => {
                        index == 0 ? $(".jungle.name-list.left").append($("<input type='button'>").val(junglePlayer.name.toUpperCase())) : $(".jungle.name-list.left").append($("<span>").text("|")).append($("<input type='button'>").val(junglePlayer.name.toUpperCase()));
                    });

                    team.players.mid.forEach((midPlayer, index) => {
                        index == 0 ? $(".mid.name-list.left").append($("<input type='button'>").val(midPlayer.name.toUpperCase())) : $(".mid.name-list.left").append($("<span>").text("|")).append($("<input type='button'>").val(midPlayer.name.toUpperCase()));
                    });

                    team.players.bot.forEach((botPlayer, index) => {
                        index == 0 ? $(".bot.name-list.left").append($("<input type='button'>").val(botPlayer.name.toUpperCase())) : $(".bot.name-list.left").append($("<span>").text("|")).append($("<input type='button'>").val(botPlayer.name.toUpperCase()));
                    });

                    team.players.support.forEach((supportPlayer, index) => {
                        index == 0 ? $(".support.name-list.left").append($("<input type='button'>").val(supportPlayer.name.toUpperCase())) : $(".support.name-list.left").append($("<span>").text("|")).append($("<input type='button'>").val(supportPlayer.name.toUpperCase()));
                    });
                }

                if (team.teamAbbr === "${teamRight.TEAM_ABBR}") {
                    team.players.top.forEach((topPlayer, index) => {
                        index == 0 ? $(".top.name-list.right").append($("<input type='button'>").val(topPlayer.name.toUpperCase())) : $(".top.name-list.right").append($("<span>").text("|")).append($("<input type='button'>").val(topPlayer.name.toUpperCase()));
                    });

                    team.players.jungle.forEach((junglePlayer, index) => {
                        index == 0 ? $(".jungle.name-list.right").append($("<input type='button'>").val(junglePlayer.name.toUpperCase())) : $(".jungle.name-list.right").append($("<span>").text("|")).append($("<input type='button'>").val(junglePlayer.name.toUpperCase()));
                    });

                    team.players.mid.forEach((midPlayer, index) => {
                        index == 0 ? $(".mid.name-list.right").append($("<input type='button'>").val(midPlayer.name.toUpperCase())) : $(".mid.name-list.right").append($("<span>").text("|")).append($("<input type='button'>").val(midPlayer.name.toUpperCase()));
                    });

                    team.players.bot.forEach((botPlayer, index) => {
                        index == 0 ? $(".bot.name-list.right").append($("<input type='button'>").val(botPlayer.name.toUpperCase())) : $(".bot.name-list.right").append($("<span>").text("|")).append($("<input type='button'>").val(botPlayer.name.toUpperCase()));
                    });

                    team.players.support.forEach((supportPlayer, index) => {
                        index == 0 ? $(".support.name-list.right").append($("<input type='button'>").val(supportPlayer.name.toUpperCase())) : $(".support.name-list.right").append($("<span>").text("|")).append($("<input type='button'>").val(supportPlayer.name.toUpperCase()));
                    });
                }
            })
        });

        $(document).on("click", ".name-list input[type=button]", event => {
            location.assign("${path}/teamdata/player?nickname=" + $(event.target).val());
        });

        $(document).on("mouseenter", ".name-list input[type='button']", event => {
            $(event.target).addClass("neon");
        });

        $(document).on("mouseleave", ".name-list input[type='button']", event => {
            $(event.target).removeClass("neon");
        });

        $(document).on("click", ".match-btn", event => {
            const matchDate = "23-" + $(event.target).parent().parent().siblings(".match_date").find("h3").text().split(" ")[0].replace(".", "-");
            const home = $(event.target).parent().parent().siblings(".home").find("h3").text();
            const away = $(event.target).parent().parent().siblings(".away").find("h3").text();

            location.assign("${path}/teamdata/matchResult?matchDate=" + matchDate + "&home=" + home + "&away=" + away);
        });
</script>
</body>
</html>
