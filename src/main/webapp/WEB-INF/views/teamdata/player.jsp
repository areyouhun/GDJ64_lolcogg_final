<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="player" value="${requestScope.player}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/teamdata/style_player.css">
<title>선수 - <c:out value="${player.PLAYER_NICKNAME}"/></title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section class="player">
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">TEAM DATA</p>
                    <p class="mainTitle fs-35 mainTitleMargin">팀 데이터</p>
                </div>
                <div class="team-title">
                    <div class="team-title_upper">
                        <h2 class="title">${player.TEAM_ABBR}</h2>
                        <div>
                            <img src="">
                        </div>
                    </div>
                    <div class="team-title_lower">
                        <p class="title">${player.TEAM_NAME}</p>
                    </div>
                </div>

                <div class="player-profile">
                    <div class="team-players-info">
                        <div class="players-name">
                            <div>
                                <p>${player.PLAYER_POSITION}</p>
                                <div class="name-list"></div>
                            </div>
                        </div>
                        <div class="player-symbol">
                            <img src="${path}/resources/images/position/circle_top.svg">
                        </div>
                        <div class="players-img">
                            <img src="">
                        </div>
                    </div>
                </div>

                <div class="team-stats">
                    <div class="team-stats-element">
                        <p>킬</p>
                        <h3>0</h3>
                    </div>
                    <div class="team-stats-element">
                        <p>데스</p>
                        <h3>0</h3>
                    </div>
                    <div class="team-stats-element">
                        <p>어시스트</p>
                        <h3>0</h3>
                    </div>
                    <div class="team-stats-element">
                        <p>KDA</p>
                        <h3>0</h3>
                    </div>
                    <div class="team-stats-element">
                        <p>킬 관여율</p>
                        <h3>0</h3>
                    </div>
                    <div class="team-stats-element">
                        <p>분당 데미지</p>
                        <h3>0</h3>
                    </div>
                    <div class="team-stats-element">
                        <p>분당 골드 획득</p>
                        <h3>0</h3>
                    </div>
                    <div class="team-stats-element">
                        <p>승률</p>
                        <div class="stats-element_sb">
                            <h3>0</h3>
                            <span class="fw-bold" style="color: #5F5F5F;"></span>
                        </div>
                    </div>
                    <div class="team-stats-element">
                        <p>경기 횟수</p>
                        <h3>0</h3>
                    </div>
                </div>

                <div class="champions">
                    <div class="bar-layout">
                        <hr class="flex-grow">
                        <p class="fw-bold">챔피언</p>
                        <hr class="flex-grow">
                    </div>
                    <table class="champions-table">
                        <thead>
                            <tr>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>
    const columns = ["이름", "플레이 수", "승/패", "킬", "데스", "어시스트", "KDA", "분당 CS", "분당 골드", "분당 데미지"];

    columns.forEach((column, index) => {
        const $th = $("<th>");
        const $h3 = $("<h3>").text(column).addClass("champions-table-column");

        $(".champions-table>thead>tr").append($th.append($h3));
    });

    $.get("${path}/resources/images/team_img.json")
    .then(data => {
        data.forEach((team, index) => {
            if (team.teamAbbr === "${player.TEAM_ABBR}") {
                $(".team-title_upper img").attr("src", "${path}/resources/images/logo/" + team.logo.big);

                $(".team-title_lower").css("backgroundColor", team.color);

                team.players["${player.PLAYER_POSITION}".toLowerCase()].forEach((person, index) => {
                    if ("${player.PLAYER_NICKNAME}".toLowerCase() === person.name) {
                        $(".name-list").append($("<input type='button'>").val(person.name.toUpperCase()))

                        $(".players-img>img").width("50%").attr("src", "${path}/resources/images/player/" + person.image[1]);

                        $.ajax({
                            url: "${path}/resources/csv/matchLCK_Player_${player.PLAYER_NICKNAME}"+ ".csv" ,
                            dataType: "text",
                            success: data => {
                                const rows = data.split(/\r?\n|\r/);

                                rows.forEach((stats, index) => {
                                    const row = stats.split(",");

                                    if (index == 0) {
                                        $(".team-stats-element").eq(0).children("h3").text(row[8]);
                                        $(".team-stats-element").eq(1).children("h3").text(row[9]);
                                        $(".team-stats-element").eq(2).children("h3").text(row[10]);
                                        $(".team-stats-element").eq(3).children("h3").text(row[0]);
                                        $(".team-stats-element").eq(4).children("h3").text(row[3]);
                                        $(".team-stats-element").eq(5).children("h3").text(row[2]);
                                        $(".team-stats-element").eq(6).children("h3").text(row[1]);
                                        $(".team-stats-element").eq(7).children(".stats-element_sb").children("h3").text(row[7]);
                                        $(".team-stats-element").eq(7).children(".stats-element_sb").children("span").text(row[5] + "승 " + row[6] + "패");
                                        $(".team-stats-element").eq(8).children("h3").text(row[4]);
                                    } else {
                                        const $tr = $("<tr>");

                                        $tr.append($("<td>").append(generateChamp(row[0].replace("'", ""))))
                                            .append($("<td>").append($("<h2>").text(row[1]).addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[2] + "승 " + row[3] + "패").addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[5]).addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[6]).addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[7]).addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[8]).addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[9]).addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[10]).addClass("fw-bold")))
                                            .append($("<td>").append($("<h2>").text(row[11]).addClass("fw-bold")));
                                            

                                        $(".champions-table>tbody").append($tr);
                                    }
                                });
                            }
                        });
                    }
                })

            }
        });
    });

    function generateChamp(name) {
        const $style = {
            "display": "flex",
            "flexDirection": "column",
            "justifyContents": "center",
            "alignItems": "center"
        };
        const $divOuter = $("<div>").css($style);
        const $divInner = $("<div>").css({
            "width": "50%",
            "marginBottom": "5px"    
        });
        const $img = $("<img>").attr("src", "https://ddragon.leagueoflegends.com/cdn/13.14.1/img/champion/" + name + ".png").css({
            "border": "2px solid var(--lol-white)",
            "borderRadius": "50%"
        });
        const $p = $("<p>").text(name);

        $.get("https://ddragon.leagueoflegends.com/cdn/13.14.1/data/ko_KR/champion.json")
        .then(data => {
            for (const champ in data.data) {
                if (champ === name) {
                    $p.text(data.data[champ].name);
                }
            }
            
        });

        return $divOuter.append($divInner.append($img))
                        .append($p);
    } 

</script>
</body>
</html>
