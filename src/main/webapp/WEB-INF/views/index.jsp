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
<style>
	.bgImgMatch{
	    background-image: linear-gradient(rgba(15, 15, 15, 0.87),
	    rgba(15, 15, 15, 0.87)) ,url(${path}/resources/images/mainpage/main1.webp);
	}
	
	.bgImgRank{
	    background-image: linear-gradient(rgba(15, 15, 15, 0.85),
	    rgba(15, 15, 15, 0.87)) ,url(${path}/resources/images/mainpage/main2.jpg);
	}
</style>
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
                <div class="todayMatchAllDiv"></div>
            </div>
        </div>
        <div class="center-1280 background-img bgImgRank mainpage mainHeight centerSort">
            <div class="width-1280 mainMargin">
                <div>
                    <p class="subTitle fs-20 centerSort">TEAM STANDINGS</p>
                    <p class="mainTitle fs-55 centerSort" style="margin-bottom: 50px;">팀 순위</p>
                </div>
                <div class="rankAllDiv">
                    
                </div>
            </div>
        </div>

        <!-- 영상 -->

    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>

	/* <p class="content">${todayMs }</p>
	<p class="content">${teamRank }</p> */
	
	$.ajax({
		url: '${path}/mainPage',
		dataType: 'json',
		success: (data)=>{
			
			// 오늘의 경기
			const todayMatch = data[1];
			let html = '';
			const todayMatchAllDiv = $(".todayMatchAllDiv");
			
			console.log(todayMatch);
			
			if(todayMatch.length > 0){
				todayMatch.forEach((tm, i) => {
					const tmDate = tm.msDate;
					const date = new Date(tmDate);
					const tmdate =  new Intl.DateTimeFormat('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: false }).format(date);
					
						html += "<div class='totayMatchDiv'>";
						html += "<div class='totayMatch'>";
						html += "<div class='homeTeamDiv centerSort'>";
						html += "<div class='imgDiv'><img src='${path}/resources/images/logo/" + tm.msHome + "_big.png'></div>";
						html += "<p class='title fs-55'>" + tm.msHome + "</p>";
						html += "</div><div class='timeVsDiv'>";
						html += "<p class='time fs-20'>" + tmdate + "</p>";
						html += "<p class='content fs-70 fw-bold'>VS</p>";
						html += "</div><div class='awayTeamDiv centerSort'>";
						html += "<p class='title fs-55'>" + tm.msAway + "</p>";
						html += "<div class='imgDiv'><img src='${path}/resources/images/logo/" + tm.msAway + "_big.png'></div>";
						html += "</div></div></div>";
				});
			} else {
				html += "<div class='totayMatchDiv' style='height:300px'>";
				html += "<div class='totayMatch'>";
				html += "</div><div class='timeVsDiv'>";
				html += "<p class='content fs-25 fw-bold'>오늘의 경기가 없습니다.</p>";
				html += "</div></div></div>";
			}
			todayMatchAllDiv.append(html);
			
			
			const rankAllDiv = $('.rankAllDiv');
			// 팀 순위
			const teamRank = data[0];
			
			const rankDiv1 = $("<div>").addClass('rankDiv');
			// 1~5위
			for (let i = 0; i < 5; i++) {
			    const rankInfoDiv = $("<div>").addClass('rankInfoDiv');
			    const rankOneDiv = $("<div>").addClass('rankOneDiv');
			    const rank = $("<div>").addClass('rank centerSort');
			    const pRank = $("<p>").addClass('title fs-55').text(teamRank[i].teamRank);
			    rank.append(pRank);
			    const rankTeam = $("<div>").addClass('rankTeam centerSort');
			    const pTeam = $("<p>").addClass('title fs-55').text(teamRank[i].teamAbbr);
			    rankTeam.append(pTeam);
			    const rankLogo = $("<div>").addClass('rankLogo centerSort');
			    const logo = $("<img>").attr('src', '${path}/resources/images/logo/' + teamRank[i].teamAbbr + '_big.png');
			    rankLogo.append(logo);
			    rankOneDiv.append(rank);
			    rankOneDiv.append(rankTeam);
			    rankOneDiv.append(rankLogo);
			    rankInfoDiv.append(rankOneDiv);
			    rankDiv1.append(rankInfoDiv);
			}
			rankAllDiv.append(rankDiv1);
			
			const rankDiv2 = $("<div>").addClass('rankDiv');
			// 6~10위
			for (let i = 5; i < 10; i++) {
			    const rankInfoDiv = $("<div>").addClass('rankInfoDiv');
			    const rankOneDiv = $("<div>").addClass('rankOneDiv');
			    const rank = $("<div>").addClass('rank centerSort');
			    const pRank = $("<p>").addClass('title fs-55').text(teamRank[i].teamRank);
			    rank.append(pRank);
			    const rankTeam = $("<div>").addClass('rankTeam centerSort');
			    const pTeam = $("<p>").addClass('title fs-55').text(teamRank[i].teamAbbr);
			    rankTeam.append(pTeam);
			    const rankLogo = $("<div>").addClass('rankLogo centerSort');
			    const logo = $("<img>").attr('src', '${path}/resources/images/logo/' + teamRank[i].teamAbbr + '_big.png');
			    rankLogo.append(logo);
			    rankOneDiv.append(rank);
			    rankOneDiv.append(rankTeam);
			    rankOneDiv.append(rankLogo);
			    rankInfoDiv.append(rankOneDiv);
			    rankDiv2.append(rankInfoDiv);
			}
			rankAllDiv.append(rankDiv2);
		},
		error: (r, m)=>{
			console.log(r);
			console.log(m);
		}
		
	})


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
            $(".header_div").css("background-color", "var(--lol-black)");
            $(".header_div").animate({ scrollTop: 0 }, 10);
            $(".myProfileBox").mouseleave(e=>{
                $(".myProfileBox").css("display","none");
                $(".header_div").css("background-color","var(--lol-black)");
                }	
            )
            $("nav").mouseenter(e=>{
                $(".myProfileBox").css("display","none");
                $(".header_div").css("background-color","var(--lol-black)");
                }	
            )
        } else {
            $(".header_div").css("background-color", "transparent");
            $(".myProfileBox").mouseleave(e=>{
                $(".myProfileBox").css("display","none");
                $(".header_div").css("background-color","");
                }	
            )
            $("nav").mouseenter(e=>{
                $(".myProfileBox").css("display","none");
                $(".header_div").css("background-color","");
                }	
            )
            
            
        }

        var posTop = (page - 1) * $(window).height();

        $html.animate({ scrollTop: posTop });

    });
</script>
</body>
</html>