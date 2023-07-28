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
    <section >
        <div class="mainpage">
            <img class="banner-img" src="${path}/resources/images/mainpage/LeagueofLegends_LCK_Spring2023_Playoffs_Teams_Players.jpg">
        </div>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">TODAY'S MATCH</p>
                    <p class="mainTitle fs-35">오늘의 경기</p>
                </div>
                <div class="" style="height: 85%; background-color: blue;">
                    <div>
                        <p class="content">2023.07.23</p>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">TEAM STANDINGS</p>
                    <p class="mainTitle fs-35">팀 순위</p>
                </div>
                <div class="" style="height: 85%; background-color: blue;">
                    <div>
                        <p class="content">2023.07.23</p>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">TEAM STANDINGS</p>
                    <p class="mainTitle fs-35">영상</p>
                </div>
                <div class="" style="height: 85%; background-color: blue;">
                    <div>
                        <p class="content">2023.07.23</p>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
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