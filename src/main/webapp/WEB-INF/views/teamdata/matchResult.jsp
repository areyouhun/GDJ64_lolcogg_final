<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<spring:eval var="champImgPath" expression="@environment.getProperty('lolcogg.datadragon.image.champion')" />
<spring:eval var="champInfoPath" expression="@environment.getProperty('lolcogg.datadragon.info.champion')" />
<spring:eval var="spellImgPath" expression="@environment.getProperty('lolcogg.datadragon.image.spell')" />
<spring:eval var="spellInfoPath" expression="@environment.getProperty('lolcogg.datadragon.info.spell')" />
<spring:eval var="itemImgPath" expression="@environment.getProperty('lolcogg.datadragon.image.item')" />
<spring:eval var="itemInfoPath" expression="@environment.getProperty('lolcogg.datadragon.info.item')" />
<spring:eval var="runesImgPath" expression="@environment.getProperty('lolcogg.datadragon.image.rune')" />
<spring:eval var="runesInfoPath" expression="@environment.getProperty('lolcogg.datadragon.info.rune')" />
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="matchResultSummary" value="${requestScope.matchResultSummary}"/>
<c:set var="matchResultDetail" value="${requestScope.matchResultDetail}"/>
<c:set var="matchRuneDetail" value="${requestScope.matchRuneDetail}"/>
<c:set var="rune" value="${requestScope.rune}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/teamdata/style_matchResult.css">
<link rel="stylesheet" href="${path}/resources/css/teamdata/style_runes.css">
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
                                                                <img class="champion-layout" src="${champImgPath}${bannedChampion}.png">
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
                                                                <img class="champion-layout" src="${champImgPath}${bannedChampion}.png">
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

                                    <div class="bar-layout">
                                        <hr class="flex-grow">
                                        <p class="fw-bold">PLAYERS</p>
                                        <hr class="flex-grow">
                                    </div>
                                    <table class="set-table">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="blue-player-name fw-bold"><c:out value="${fn:toUpperCase(set.blueSideTopPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.blueSideTopChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.blueSideTopChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.blueSideTopSpellOne}.png" spell="${set.blueSideTopSpellOne}">
                                                                        <img src="${spellImgPath}${set.blueSideTopSpellTwo}.png" spell="${set.blueSideTopSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.blueSideTopItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.blueSideTopKdaOverall}"/><span><c:out value=" (${set.blueSideTopKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h2>
                                                                <h2><c:out value="${set.blueSideTopDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h2>
                                                                <h2><c:out value="${set.blueSideTopGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>CS</h3>
                                                                <h2><c:out value="${set.blueSideTopCs}"/><span> (<fmt:formatNumber value="${set.blueSideTopCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><p class="set-category set-position">TOP</p></td>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="red-player-name fw-bold"><c:out value="${fn:toUpperCase(set.redSideTopPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.redSideTopChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.redSideTopChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.redSideTopSpellOne}.png" spell="${set.redSideTopSpellOne}">
                                                                        <img src="${spellImgPath}${set.redSideTopSpellTwo}.png" spell="${set.redSideTopSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.redSideTopItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.redSideTopKdaOverall}"/><span><c:out value=" (${set.redSideTopKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.redSideTopDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.redSideTopGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>CS</h3>
                                                                <h2><c:out value="${set.redSideTopCs}"/><span> (<fmt:formatNumber value="${set.redSideTopCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="blue-player-name fw-bold"><c:out value="${fn:toUpperCase(set.blueSideJunglePlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.blueSideJungleChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.blueSideJungleChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.blueSideJungleSpellOne}.png" spell="${set.blueSideJungleSpellOne}">
                                                                        <img src="${spellImgPath}${set.blueSideJungleSpellTwo}.png" spell="${set.blueSideJungleSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.blueSideJungleItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.blueSideJungleKdaOverall}"/><span><c:out value=" (${set.blueSideJungleKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.blueSideJungleDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.blueSideJungleGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>CS</h3>
                                                                <h2><c:out value="${set.blueSideJungleCs}"/><span> (<fmt:formatNumber value="${set.blueSideJungleCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><p class="set-category set-position">JUNGLE</p></td>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="red-player-name fw-bold"><c:out value="${fn:toUpperCase(set.redSideJunglePlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.redSideJungleChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.redSideJungleChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.redSideJungleSpellOne}.png" spell="${set.redSideJungleSpellOne}">
                                                                        <img src="${spellImgPath}${set.redSideJungleSpellTwo}.png" spell="${set.redSideJungleSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.redSideJungleItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.redSideJungleKdaOverall}"/><span><c:out value=" (${set.redSideJungleKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.redSideJungleDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.redSideJungleGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>CS</h2>
                                                                <h2><c:out value="${set.redSideJungleCs}"/><span> (<fmt:formatNumber value="${set.redSideJungleCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="blue-player-name fw-bold"><c:out value="${fn:toUpperCase(set.blueSideMidPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.blueSideMidChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.blueSideMidChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.blueSideMidSpellOne}.png" spell="${set.blueSideMidSpellOne}">
                                                                        <img src="${spellImgPath}${set.blueSideMidSpellTwo}.png" spell="${set.blueSideMidSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.blueSideMidItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.blueSideMidKdaOverall}"/><span><c:out value=" (${set.blueSideMidKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.blueSideMidDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.blueSideMidGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h2>CS</h2>
                                                                <h2><c:out value="${set.blueSideMidCs}"/><span> (<fmt:formatNumber value="${set.blueSideMidCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><p class="set-category set-position">MID</p></td>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="red-player-name fw-bold"><c:out value="${fn:toUpperCase(set.redSideMidPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.redSideMidChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.redSideMidChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.redSideMidSpellOne}.png" spell="${set.redSideMidSpellOne}">
                                                                        <img src="${spellImgPath}${set.redSideMidSpellTwo}.png" spell="${set.redSideMidSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.redSideMidItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.redSideMidKdaOverall}"/><span><c:out value=" (${set.redSideMidKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.redSideMidDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h2>
                                                                <h2><c:out value="${set.redSideMidGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>CS</h3>
                                                                <h2><c:out value="${set.redSideMidCs}"/><span> (<fmt:formatNumber value="${set.redSideMidCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="blue-player-name fw-bold"><c:out value="${fn:toUpperCase(set.blueSideBotPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.blueSideBotChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.blueSideBotChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.blueSideBotSpellOne}.png" spell="${set.blueSideBotSpellOne}">
                                                                        <img src="${spellImgPath}${set.blueSideBotSpellTwo}.png" spell="${set.blueSideBotSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.blueSideBotItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.blueSideBotKdaOverall}"/><span><c:out value=" (${set.blueSideBotKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.blueSideBotDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.blueSideBotGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h2>CS</h2>
                                                                <h2><c:out value="${set.blueSideBotCs}"/><span> (<fmt:formatNumber value="${set.blueSideBotCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><p class="set-category set-position">BOT</p></td>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="red-player-name fw-bold"><c:out value="${fn:toUpperCase(set.redSideBotPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.redSideBotChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.redSideBotChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.redSideBotSpellOne}.png" spell="${set.redSideBotSpellOne}">
                                                                        <img src="${spellImgPath}${set.redSideBotSpellTwo}.png" spell="${set.redSideBotSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.redSideBotItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.redSideBotKdaOverall}"/><span><c:out value=" (${set.redSideBotKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.redSideBotDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.redSideBotGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h2>CS</h2>
                                                                <h2><c:out value="${set.redSideBotCs}"/><span> (<fmt:formatNumber value="${set.redSideBotCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="blue-player-name fw-bold"><c:out value="${fn:toUpperCase(set.blueSideSupportPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.blueSideSupportChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.blueSideSupportChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.blueSideSupportSpellOne}.png" spell="${set.blueSideSupportSpellOne}">
                                                                        <img src="${spellImgPath}${set.blueSideSupportSpellTwo}.png" spell="${set.blueSideSupportSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.blueSideSupportItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.blueSideSupportKdaOverall}"/><span><c:out value=" (${set.blueSideSupportKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.blueSideSupportDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.blueSideSupportGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h2>CS</h2>
                                                                <h2><c:out value="${set.blueSideSupportCs}"/><span> (<fmt:formatNumber value="${set.blueSideSupportCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><p class="set-category set-position">SUPPORT</p></td>
                                                <td>
                                                    <div class="set-player-content">
                                                        <h2 class="red-player-name fw-bold"><c:out value="${fn:toUpperCase(set.redSideSupportPlayer)}"/></h2>
                                                        <div class="set-champion-content">
                                                            <div class="set-champion-info">
                                                                <div class="player-champion-img">
                                                                    <img class="champion-layout" src="${champImgPath}${set.redSideSupportChamp}.png">
                                                                </div>
                                                                <div class="player-champ-sub">
                                                                    <h3><c:out value="${set.redSideSupportChamp}"/></h3>
                                                                    <div class="set-champion-spell">
                                                                        <div class="pos-absolute"></div>
                                                                        <img src="${spellImgPath}${set.redSideSupportSpellOne}.png" spell="${set.redSideSupportSpellOne}">
                                                                        <img src="${spellImgPath}${set.redSideSupportSpellTwo}.png" spell="${set.redSideSupportSpellTwo}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="set-champion-item">
                                                                <div class="pos-absolute"></div>
                                                                <c:forEach var="item" items="${set.redSideSupportItems}">
                                                                	<img class="${fn:contains(item, 'items') ? 'ornn-border' : ''}" src="${itemImgPath}${fn:replace(item, 'items/', '')}.png" itemNo="${fn:replace(item, 'items/', '')}">
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="set-champion-stats">
                                                            <div>
                                                                <h3>KDA</h3>
                                                                <h2><c:out value="${set.redSideSupportKdaOverall}"/><span><c:out value=" (${set.redSideSupportKdaTotal})"/></span></h2>
                                                            </div>
                                                            <div>
                                                                <h3>데미지</h3>
                                                                <h2><c:out value="${set.redSideSupportDamage}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h3>골드</h3>
                                                                <h2><c:out value="${set.redSideSupportGold}"/></h2>
                                                            </div>
                                                            <div>
                                                                <h2>CS</h2>
                                                                <h2><c:out value="${set.redSideSupportCs}"/><span> (<fmt:formatNumber value="${set.redSideSupportCsM}" pattern="##0.0"/>)</span></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <div class="bar-layout">
                                        <hr class="flex-grow">
                                        <p class="fw-bold">RUNES</p>
                                        <hr class="flex-grow">
                                    </div>
                                    <!-- WRITE YOUR CODE HERE -->
                                    <div class="rune-container">
                                        <div class="play-champion-group">
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.blueSideTopChamp}.png" alt="blueSideTop" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.blueSideJungleChamp}.png" alt="blueSideJungle" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.blueSideMidChamp}.png" alt="blueSideMid" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.blueSideBotChamp}.png" alt="blueSideBot" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.blueSideSupportChamp}.png" alt="blueSideSupport" />
                                            </span>
                                            <div class="division-team"></div>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.redSideSupportChamp}.png" alt="redSideSupport" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.redSideBotChamp}.png" alt="redSideBot" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.redSideMidChamp}.png" alt="redSideMid" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.redSideJungleChamp}.png" alt="redSideJungle" />
                                            </span>
                                            <span class="play-champion">
                                                <img class="champion-layout" src="${champImgPath}${set.redSideTopChamp}.png" alt="redSideTop" />
                                            </span>
                                        </div>

                                        <div class="rune-group">
                                            <div class="main">
                                                <div class="M8100 rune-category rune-domination hide">
                                                    <div class="rune-row">
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8112']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8124']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8128']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['9923']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8126']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8139']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8143']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8120']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8136']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8138']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8105']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8134']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8106']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8135']}" />
                                                    </div>
                                                </div>
                                                <div class="M8000 rune-category rune-precision">
                                                    <div class="rune-row">
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8005']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8008']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8010']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8021']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8009']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9101']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9111']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9103']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9104']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9105']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8014']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8017']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8299']}" />
                                                    </div>
                                                </div>
                                                <div class="M8200 rune-category rune-sorcery">
                                                    <div class="rune-row">
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8214']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8229']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8230']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8224']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8226']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8275']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8210']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8233']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8234']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8232']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8236']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8237']}" />
                                                    </div>
                                                </div>
                                                <div class="M8400 rune-category rune-resolve">
                                                    <div class="rune-row">
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8437']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8439']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8465']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8401']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8463']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8446']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8429']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8444']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8473']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8451']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8453']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8242']}" />
                                                    </div>
                                                </div>
                                                <div class="M8300 rune-category rune-inspiration">
                                                    <div class="rune-row">
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8351']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8360']}" />
                                                        <img class="main-rune-layout" src="${runesImgPath}${rune['8369']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8304']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8306']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8313']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8316']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8321']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8345']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8347']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8352']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8410']}" />
                                                    </div>
                                                </div>
                                            </div>
    
                                            <div class="sub">
                                                <div class="S8100 rune-category sub-rune-domination">
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8126']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8139']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8143']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8120']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8136']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8138']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8105']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8134']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8106']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8135']}" />
                                                    </div>
                                                </div>
                                                <div class="S8000 rune-category sub-rune-precision">
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8009']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9101']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9111']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9103']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9104']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['9105']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8014']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8017']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8299']}" />
                                                    </div>
                                                </div>
                                                <div class="S8200 rune-category sub-rune-sorcery">
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8224']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8226']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8275']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8210']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8233']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8234']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8232']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8236']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8237']}" />
                                                    </div>
                                                </div>
                                                <div class="S8400 rune-category sub-rune-resolve">
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8401']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8463']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8446']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8429']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8444']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8473']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8451']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8453']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8242']}" />
                                                    </div>
                                                </div>
                                                <div class="S8300 rune-category rune-inspiration">
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8304']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8306']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8313']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8316']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8321']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8345']}" />
                                                    </div>
                                                    <div class="rune-row">
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8347']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8352']}" />
                                                        <img class="sub-rune-layout" src="${runesImgPath}${rune['8410']}" />
                                                    </div>
                                                </div>
                                                <div class="attribute-category">
                                                    <div class="attribute-row first-attribute">
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5008.png" />
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5005.png" />
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5007.png" />
                                                    </div>
                                                    <div class="attribute-row second-attribute">
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5008.png" />
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5002.png" />
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5003.png" />
                                                    </div>
                                                    <div class="attribute-row third-attribute">
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5001.png" />
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5002.png" />
                                                        <img class="attribute-layout" src="https://opgg-static.akamaized.net/meta/images/lol/perkShard/5003.png" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End -->
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
        $(".bannedName").each((index, champName) => {
            $(champName).text(data.data[$(champName).text()].name);
            }
        );

        $(".player-champ-sub>h3").each((index, champName) => {
                $(champName).text(data.data[$(champName).text()].name);
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

        $('.rune-category').hide();
        $('.attribute-category').hide();
    }

    $(document).on("mouseenter", ".set-champion-spell img", event => {
        if ($(event.target).prop("tagName") === "IMG") {
            $.get("${spellInfoPath}")
            .then(data => {
                const spell = data.data["Summoner" + $(event.target).attr("spell")];

                $(event.target).siblings(".pos-absolute").html("")
                                .append($("<h4>").text(spell.name).addClass("fw-bold spell-title"))
                                .append($("<h5>").text(spell.description))
                                .addClass("show");

                $(event.target).siblings(".pos-absolute")
                                .css({
                                    "top": -($(event.target).siblings(".pos-absolute").height() + 50) + "px"
                                });
            });
        }
    });

    $(document).on("mouseleave", ".set-champion-spell img", event => {
        if ($(event.target).prop("tagName") === "IMG") {
            $(event.target).siblings(".pos-absolute")
                            .removeClass("show")
                            .html("");
        }
    });

    $(document).on("mouseenter", ".set-champion-item img", event => {
        if ($(event.target).prop("tagName") === "IMG") {
            $.get("${itemInfoPath}")
            .then(data => {
                const item = data.data[$(event.target).attr("itemNo").toString()];
                $(event.target).siblings(".pos-absolute").html("")
                                .append($("<h4>").text(item.name).addClass("fw-bold item-title"))
                                .append($("<h5>").html(item.description))
                                .append($("<h5>").text("가격: " + item.gold.total + " Gold").addClass("price"))
                                .addClass("show");

                $(event.target).siblings(".pos-absolute")
                                .css({
                                    "top": -($(event.target).siblings(".pos-absolute").height() + 50) + "px"
                                });
            });
        }
    });

    $(document).on("mouseleave", ".set-champion-item img", event => {
        if ($(event.target).prop("tagName") === "IMG") {
            $(event.target).siblings(".pos-absolute")
                            .removeClass("show")
                            .html("");
        }
    });
</script>
<script>
    $(function() {
        $('.rune-category').hide();
        $('.attribute-category').hide();
        
        $('.play-champion-group span img').on('click', (event) => {
            $('.play-champion-group span').removeClass('choice')
            $(event.target).parent('span').addClass('choice');

            championRuneInfo($(event.target).attr('alt'), event);
        });
    });

    function championRuneInfo(role, event) {
        $.ajax({
            url: getContextPath() + '/getMatchChampionRune',
            data: {
                role:role,
                matchDate: "${matchResultSummary.MS_DATE}".split(' ')[0],
                home: "${matchResultSummary.MS_HOME}",
                away: "${matchResultSummary.MS_AWAY}"
            },success: (data) => {
                const SET = $('.active').attr('data-id');
                const CHAMP_IMG_SRC = $(event.target).attr('src');
                const CHAMP_NAME = CHAMP_IMG_SRC.split('/').pop().replace('.png', '');

                if(data[SET].champion === CHAMP_NAME) {
                    $('.rune-category').hide();
                    $('.attribute-category').hide();
                    
                    $('.rune-category img').css('filter', 'grayscale(100%)');
                    $('.attribute-category img').css('filter', 'grayscale(100%)');

                    // 애니메이션
                    $('.M' + data[SET].runeCategory).css('opacity', 0).show();
                    $('.S' + data[SET].subCategory).css('opacity', 0).show();
                    $('.attribute-category').css('opacity', 0).show();

                    $('.rune-category').animate({
                        opacity: 1
                    }, 300);

                    $('.attribute-category').animate({
                        opacity: 1
                    }, 300);

                    const MAIN_RUNES = [
                        data[SET].mainRune,
                        data[SET].mainRuneFirstRow,
                        data[SET].mainRuneSecondRow,
                        data[SET].mainRuneLastRow
                    ];

                    const SUB_RUNES = [
                        data[SET].subRuneFirstRow,
                        data[SET].subRuneLastRow
                    ];

                    $('.rune-category img').each((index, element) => {
                        const SRC = $(element).attr('src');

                        if(MAIN_RUNES.some(rune => SRC.includes(rune)) || SUB_RUNES.some(rune => SRC.includes(rune))) {
                            $(element).css('filter', 'grayscale(0%)');
                        }
                    });

                    $('.first-attribute img').each((index, element) => {
                        const SRC = $(element).attr('src');

                        if(SRC.includes(data[SET].attributeFirstRow)) {
                            $(element).css('filter', 'grayscale(0%)');
                        }
                    });

                    $('.second-attribute img').each((index, element) => {
                        const SRC = $(element).attr('src');

                        if(SRC.includes(data[SET].attributeSecondRow)) {
                            $(element).css('filter', 'grayscale(0%)');
                        }
                    });

                    $('.third-attribute img').each((index, element) => {
                        const SRC = $(element).attr('src');

                        if(SRC.includes(data[SET].attributeLastRow)) {
                            $(element).css('filter', 'grayscale(0%)');
                        }
                    });
                }
            }
        });
    } 
</script>
</body>
</html>
