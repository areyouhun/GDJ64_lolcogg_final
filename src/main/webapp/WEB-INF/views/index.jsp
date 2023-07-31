<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/main_page.css">
<title>lolco.gg</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value=""/>
</jsp:include>
    <section>
        <div class="mainpage">
            <img class="banner-img" src="${path}/resources/images/mainpage/LeagueofLegends_LCK_Spring2023_Playoffs_Teams_Players.jpg">
        </div>
        <div class="center-1280 background-img bgImgMatch mainpage mainHeight centerSort">
            <div class="width-1280 mainMargin">
                <div>
                    <p class="subTitle fs-20 centerSort">TODAY'S MATCH UP</p>
                    <p class="mainTitle fs-55 centerSort" style="margin-bottom: 50px;">오늘의 경기</p>
                </div>
                <div class="todayMatchAllDiv">
                    <div class="totayMatchDiv">
                        <div class="totayMatch">
                            <div class="homeTeamDiv centerSort">
                                <img src="${path}/resources/images/logo/brion_logo_big2.png">
                                <p class="title fs-55">BRO</p>
                            </div>
                            <div class="timeVsDiv">
                                <p class="time fs-20">15:00</p>
                                <p class="content fs-70 fw-bold">VS</p>
                            </div>
                            <div class="awayTeamDiv centerSort">
                                <p class="title fs-55">BRO</p>
                                <img src="${path}/resources/images/logo/dplus_logo_white.png">
                            </div>
                        </div>
                    </div>
                    <div class="totayMatchDiv">
                        <div class="totayMatch">
                            <div class="homeTeamDiv centerSort">
                                <img src="${path}/resources/images/logo/freecs_logo_big.png">
                                <p class="title fs-55">BRO</p>
                            </div>
                            <div class="timeVsDiv">
                                <p class="time fs-20">15:00</p>
                                <p class="content fs-70 fw-bold">VS</p>
                            </div>
                            <div class="awayTeamDiv centerSort">
                                <p class="title fs-55">BRO</p>
                                <img src="${path}/resources/images/logo/t1_logo_big.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="center-1280 background-img bgImgRank mainpage mainHeight centerSort">
            <div class="width-1280 mainMargin">
                <div>
                    <p class="subTitle fs-20 centerSort">TEAM STANDINGS</p>
                    <p class="mainTitle fs-55 centerSort" style="margin-bottom: 50px;">팀 순위</p>
                </div>
                <div class="rankAllDiv">
                    <!-- 1~5등 팀 -->
                    <div class="rankDiv">
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/t1_logo_big.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/drx_logo_big2.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/freecs_logo_big.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/geng_logo_big2.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/hanwha_logo_big2.png"></div>
                            </div>
                        </div>
                    </div>
                    <!-- 6~10등 팀 -->
                    <div class="rankDiv">
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/kt_logo_big2.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/redforce_logo_big.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/sandbox_logo_big.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/brion_logo_big2.png"></div>
                            </div>
                        </div>
                        <div class="rankInfoDiv">
                            <div class="rankOneDiv">
                                <div class="rank centerSort">
                                    <p class="title fs-55">1</p>
                                </div>
                                <div class="rankTeam centerSort">
                                    <p class="title fs-55">T1</p>
                                </div>
                                <div class="rankLogo centerSort"><img src="${path}/resources/images/logo/dplus_logo_white.png"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 영상 -->

    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>
    // 스크롤 이벤트 삭제
    window.addEventListener("wheel", function (e) {
        e.preventDefault();
    }, { passive: false });

    // 스크롤 페이지 설정
    const $html = $("html");
    const lastPage = $(".mainpage").length;
    let page = 1;

    $html.animate({ scrollTop: 0 }, 10);

    // 스크롤 이벤트
    $(window).on("wheel", function (e) {

        if ($html.is(":animated")) return;

        if (e.originalEvent.deltaY > 0) { // 스크롤 내릴 때
            if (page == lastPage) return;
            page++;

        } else if (e.originalEvent.deltaY < 0) { // 스크롤 올릴 때
            if (page == 1) return;
            page--;
        }

        if (page != 1) {
            $("header").css("background-color", "var(--lol-black)");
            $("header").animate({ scrollTop: 0 }, 10);
        } else {
            $("header").css("background-color", "transparent");
        }

        var posTop = (page - 1) * $(window).height();

        $html.animate({ scrollTop: posTop });

    });
</script>
</body>
</html>