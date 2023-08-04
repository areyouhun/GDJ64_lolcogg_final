<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="today" value="<%=new java.util.Date()%>" />
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/matchprediction/matchprediction.css">
<!------------------------------------>
<title>승부예측</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight bgImgDiv">
            <div class="width-1280 page-margin">
                <div class="mpTitleMargin"></div>
                <div class="mpTitle">
                    <p class="subTitle fs-20">MATCH PREDICTION</p>
                    <p class="mainTitle fs-35 mainTitleMargin mp">승부예측</p>
                    <div class="mpInfo">
                        <p class="content fs-20">LCK 10팀의 승패예측, 지금 바로 참여하세요!</p>
                        <p class="content fs-20">예측성공 수에 따라 포인트가 지급됩니다.</p>
                    </div>
                    <p class="title fs-25">현재 <span class="title mpCountSpan"><fmt:formatNumber value="${playerCount }" pattern="#,###" />명</span> 참여중!</p>
                </div>

                <div class="weekChoiceDiv">
                	<c:if test="${not empty week }">
	                	<c:forEach var="w" items="${week }">
	                		<c:if test="${nowWeek == w.msWeek}">
		                    	<button id="${w.msWeek }" class="weekDiv weekChoice" onclick="weekChoice('${w.msWeek}');">
		                    </c:if>
		                    <c:if test="${nowWeek != w.msWeek}">
		                    	<button id="${w.msWeek }" class="weekDiv" onclick="weekChoice('${w.msWeek}');">
		                    </c:if>
		                        <div class="weekDivInfo">
		                            <p class="title fs-26 week">${w.msWeek }</p>
		                            <p class="content fs-16 weekSpan">주차</p>
		                        </div>
		                        <c:if test="${nowWeek == w.msWeek}">
		                        	<p class="content fs-12 weekStatus weekChoiceP">진행중</p>
		                        </c:if>
		                        <c:if test="${nowWeek < w.msWeek}">
		                        	<p class="content fs-12 weekStatus">예정</p>
		                        </c:if>
		                        <c:if test="${nowWeek > w.msWeek}">
		                        	<p class="content fs-12 weekStatus">종료</p>
		                        </c:if>
		                    </button>
	                    </c:forEach>
                    </c:if>
                </div>
				
                <!-- 승부예측, 적중률 랭킹, 실시간 채팅 -->
                <div class="mpPageDiv">
                    <div class="mpAllDiv">
                        <div class="mpDiv">
                <c:if test="${not empty ms}">
					<c:forEach var="m" items="${ms }">
						<%-- ${ms[1] } --%>
						<c:if test="${nowWeek == m.msWeek }">
						
						<fmt:formatDate value="${today}" pattern="yyyy.MM.dd(E)" var="todayDate" />
						<fmt:formatDate value="${m.msDate}" pattern="yyyy.MM.dd(E)" var="matchDate"/>
						
                            <div class="mpDateDiv">
                            	<c:if test="true">
                                	<span class="content fs-20">${matchDate }</span>
                                </c:if>
                                <hr class="dateHr">
                            </div>
						
                            <div class="statusTimeDiv">
                                <div class="statusDiv">
                                    <p class="content fs-16">미참여</p>
                                </div>
                                <p class="content fs-20"><fmt:formatDate value="${m.msDate}" pattern="HH:mm"/></p>
                            </div>
                            <!-- 한 경기 시작 -->
                            <div id="${m.msNo }" class="mpMatchDiv">
                                <div class="homeDiv">
                                    <div class="logoDiv">
                                        <div class="logoImgDiv">
                                            <img src="">
                                        </div>
                                    </div>
                                    <div class="homeStatusDiv">
                                        <c:if test="${m.msHome != null }">
                                        	<p class="content">${m.msHome } ${m.team.homeRank }위</p>
                                        </c:if>
                                        <c:if test="${m.msHome == null }">
                                        	<p class="content">TBD</p>
                                        </c:if>
                                        <p class="content fs-40 fw-bold">100%</p>
                                    </div>
                                    <div class="homeScoreDiv">
                                        <p class="title fs-45">${m.msHomeScore }</p>
                                    </div>
                                </div>
                                <div class="awayDiv">
                                    <div class="awayScoreDiv">
                                        <p class="title fs-45">${m.msAwayScore }</p>
                                    </div>
                                    <div class="awayStatusDiv">
                                    	<c:if test="${m.msAway != null }">
                                        	<p class="content awaySort">${m.msAway } ${m.team.awayRank }위</p>
                                        </c:if>
                                        <c:if test="${m.msAway == null }">
                                        	<p class="content awaySort">TBD</p>
                                        </c:if>
                                        <p class="content fs-40 fw-bold awaySort">100%</p>
                                    </div>
                                    <div class="awayLogoDiv">
                                        <div class="logoImgDiv">
                                            <img src="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 한 경기 끝 -->
                        </c:if>
					</c:forEach>
				</c:if>
                        </div>
                    </div>

                    <div class="rankDiv" style="width: 25%;">
                        <div class="choiceRankDiv">
                            <div class="choiceTitle">
                                <p class="title fs-18">적중률 랭킹</p>
                                <img src="${path }/resources/images/matchprediction/rank.png" width="25px">
                            </div>
                            <div class="rankContentDiv">
                                <div class="rankTrDiv">
                                    <div class="centerSort" style="width: 15%;">
                                        <p class="content">순위</p>
                                    </div>
                                    <div class="leftSort" style="width: 50%;">
                                        <p class="content">닉네임</p>
                                    </div>
                                    <div class="centerSort" style="width: 20%;">
                                        <P class="content">적중 수</P>
                                    </div>
                                    <div class="centerSort" style="width: 20%; margin-left: 10px;">
                                        <p class="content">적중률</p>
                                    </div>
                                </div>
                                <!-- 랭킹 한명 -->
                                <c:forEach items="${ms }" var="test" varStatus="status" end="9">
                                <!-- 랭킹 수정 필요 -->
	                                <div class="rankInfoDiv">
	                                    <div class="centerSort" style="width: 15%;">
	                                        <p class="title">${status.count }</p>
	                                    </div>
	                                    <div class="leftSort" style="width: 51%;">
	                                        <p class="content">닉네임여덟글자야</p>
	                                    </div>
	                                    <div class="centerSort" style="width: 12%;">
	                                        <P class="content">64/65</P>
	                                    </div>
	                                    <div class="centerSort" style="width: 22%; margin-left: 10px;">
	                                        <p class="content">97%</p>
	                                    </div>
	                                </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="chatDiv">
                            <div class="chatTitle">
                                <p class="title fs-18">실시간 채팅</p>
                                <img src="${path }/resources/images/matchprediction/chatting.png" width="25px">
                            </div>
                             <button class="content chatBtn fs-20">실시간 채팅 참여하기<img src="${path }/resources/images/matchprediction/arrow.png"
                                    width="25px" style="margin-left: 3px;"></button>
                            <button class="content chatBtn fs-20">실시간 채팅 참여하기<img src="${path }/resources/images/matchprediction/arrow.png"
                                    width="25px" style="margin-left: 3px;"></button>
                        </div>
                    </div>
                </div>


                <div class="myDiv">
                    <div class="myInfoDiv">
                        <p class="title fs-20">나의 적중률 랭킹</p>
                        <div class="myInfoDetailDiv">
                            <div class="myRank">
                                <span class="title fs-75 mpCountSpan">1,350</span>
                                <span class="title fs-40">위</span>
                            </div>
                            <p class="content fs-18">총 12,435명 참여</p>
                        </div>
                    </div>
                    <div class="myInfoDiv">
                        <p class="title fs-20">나의 적중 횟수</p>
                        <div class="myInfoChartDiv">
                            <canvas id="riskFactorChart"></canvas>
                            <div class="chartInfoDiv">
                                <p class="content fs-18">적중 경기 수 64/67</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 댓글 -->
                <div class="qnaCommentDiv">
                    <div class="qnaCommentDivSize">
                        <p class="titleBlack qnaCommentTitle fs-20">댓글</p>
                        <!-- 댓글 작성 -->
                        <form>
                            <div class="insertCommentDiv">
                                <textarea type="text" class="insertComment contentBlack fs-20"
                                    style="resize: none;"></textarea>
                                <div class="countBtnDiv">
                                    <div class="countBtn">
                                        <span class="contentBlack fs-20">0/150</span>
                                    </div>
                                    <div class="iconBtn">
                                        <ion-icon name="happy-outline"></ion-icon>
                                        <button class="commentBtn content">등록</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- 댓글 목록 -->
                        <div class="qnaCommentListDiv">
                            <div class="commentSort">
                                <p class="contentBlack fs-18 newMargin">최신 순</p>
                                <p class="contentBlack fs-18">인기 순</p>
                            </div class="commentListSort">
                            <hr class="hr-1Black hr-op">

                            <!-- 댓글 한 개 -->
                            <div class="commentList">
                                <div class="">
                                    <img src="/UI/header/images/소환사아이콘.jpg"
                                        style="width: 70px; height: 70px; border-radius: 70px;">
                                </div>
                                <div class="detailDiv">
                                    <div class="commentDetail">
                                        <div class="commentInfo">
                                            <p class="contentBlack fs-20 nickname">똥제동이</p>
                                            <img src="/UI/header/images/tier_다이아.webp" class="tierImg">
                                            <div class="bestDiv">
                                                <p class="content fs-20">BEST</p>
                                            </div>
                                        </div>
                                        <div class="optionDiv">
                                            <button class="moreIconBtn">
                                                <ion-icon class="moreIcon" name="ellipsis-horizontal"
                                                    style="font-size: 28px;"></ion-icon>
                                            </button>
                                            <ul class="optionUl">
                                                <li>
                                                    <!-- 작성자 및 관리자 -->
                                                    <!-- <button><ion-icon class="optionIcon" name="create-outline"></ion-icon>수정</button>
                                <hr class="hr-1Black hr-op">
                                <button><ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>삭제</button> -->

                                                    <!-- 작성자 x -->
                                                    <button><ion-icon class="optionIcon"
                                                            name="remove-circle-outline"></ion-icon>신고</button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div>
                                        <p class="contentBlack fs-20 commentContent">
                                            안녕하세요~구르트
                                        </p>
                                    </div>
                                    <div class="dateBuffDiv">
                                        <span class="dateSpan">2023.07.26</span>
                                        <div class="buffNerfDiv">
                                            <div class="buffDiv">
                                                <button class="buffBtn">버프<ion-icon name="caret-up-circle-outline"
                                                        class="bnIcon"></ion-icon></button>
                                                <p class="contentBlack">1,224</p>
                                            </div>
                                            <div class="nerfDiv">
                                                <button class="buffBtn">너프<ion-icon name="caret-down-circle-outline"
                                                        class="bnIcon"></ion-icon></button>
                                                <p class="contentBlack">14</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="hr-1Black hr-op">

                            <!-- 대댓글 한 개 -->
                            <div class="commentList">
                                <div style="width: 80px;"></div>
                                <div class="">
                                    <img src="/UI/header/images/소환사아이콘.jpg"
                                        style="width: 70px; height: 70px; border-radius: 70px;">
                                </div>
                                <div class="detaildetailDiv">
                                    <div class="commentDetail">
                                        <div class="commentInfo">
                                            <p class="contentBlack fs-20 nickname">똥제동이</p>
                                            <img src="/UI/header/images/tier_다이아.webp" class="tierImg">
                                            <div class="bestDiv">
                                                <p class="content fs-20">BEST</p>
                                            </div>
                                        </div>
                                        <div class="optionDiv">
                                            <button class="moreIconBtn">
                                                <ion-icon class="moreIcon" name="ellipsis-horizontal"
                                                    style="font-size: 28px;"></ion-icon>
                                            </button>
                                            <ul class="optionUl">
                                                <li>
                                                    <!-- 작성자 및 관리자 -->
                                                    <!-- <button><ion-icon class="optionIcon" name="create-outline"></ion-icon>수정</button>
                                <hr class="hr-1Black hr-op">
                                <button><ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>삭제</button> -->

                                                    <!-- 작성자 x -->
                                                    <button><ion-icon class="optionIcon"
                                                            name="remove-circle-outline"></ion-icon>신고</button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div>
                                        <p class="contentBlack fs-20 commentContent">
                                            안녕하세요~구르트
                                        </p>
                                    </div>
                                    <div class="dateBuffDiv">
                                        <span class="dateSpan">2023.07.26</span>
                                        <div class="buffNerfDiv">
                                            <div class="buffDiv">
                                                <button class="buffBtn">버프<ion-icon name="caret-up-circle-outline"
                                                        class="bnIcon"></ion-icon></button>
                                                <p class="contentBlack">1,224</p>
                                            </div>
                                            <div class="nerfDiv">
                                                <button class="buffBtn">너프<ion-icon name="caret-down-circle-outline"
                                                        class="bnIcon"></ion-icon></button>
                                                <p class="contentBlack">14</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="hr-1Black hr-op">
                        </div>
                        <!-- 페이지바 -->
                        <!-- 데이터 10개 이하 페이지버튼 none처리 -->
                        <div class="pageBar">
                            <div class="pageAll">
                                <ul class="page">
                                    <li><a href="#">&lt;</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#" class="nowPage">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
/* chart */
$(".moreIconBtn").click(e => {
    $(".optionUl").toggle();
})

var options = {
    cutoutPercentage: 85,
    rotation: Math.PI,

    legend: {
        display: false,
    },
    tooltips: {
        enabled: true,
    },

};

var doughnutData = {
    labels: [
        "예측성공", "예측실패"
    ],
    datasets: [{
        data: [64,3],
        backgroundColor: [
        "#6454ED", "#ccc"
        ],
        hoverBackgroundColor: [
        "#6454ED", "#ccc"
        ],
        borderWidth: 0,
    }]
};

$('#riskFactorChartLoading').hide("fast");
var ctx = $("#riskFactorChart").get(0).getContext("2d");

var riskFactorChart = new Chart(ctx, {
    type: 'doughnut',
    data: doughnutData,
    options: options
});


/* 승부예측 */
	$(".mpMatchDiv").click(e=>{		
	
		// 둘 중 하나라도 true면 선택한 것
		console.log("home있니?" + $(e.target).hasClass('homeDiv'));
		console.log("home있니?" + $(e.target).parents('.homeDiv').hasClass('homeDiv'));
		
		// home 클릭 시
		if($(e.target).hasClass('homeDiv') || $(e.target).parents('.homeDiv').hasClass('homeDiv')){
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("background-color", "#0D0063");
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("background-color", "");
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("outline", "3px solid var(--lol-teamblue)");
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("outline", "3px solid var(--lol-teamblue)");
		} else if($(e.target).hasClass('awayDiv') || $(e.target).parents('.awayDiv').hasClass('awayDiv')){
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("background-color", "#490000");
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("background-color", "");
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("outline", "3px solid var(--lol-teamred)");
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("outline", "3px solid var(--lol-teamred)");
		}
		
		const msNo = $(e.target).parents('.mpMatchDiv').attr('id');
		const team = $(e.target).parents('.mpMatchDiv').attr('id');
		// console.log(msNo);
	});	
	
	
/* 주차 변경하기 */
const weekChoice=(week)=>{
	/* 버튼에 클래스 추가 weekChoice, 버튼에 삭제? */
	
	$.ajax({
	    type: "POST",
	    url: "/matchPrediction/week",
	    data: { week: week }, // 옵션 객체로 전달할 데이터는 key: value 형태로 작성해야 함
	    dataType: "json",
	    success: function(data) {
			const mpAllDiv = $(".mpAllDiv");
			mpAllDiv.html('');
			let html = '';
			
			data.forEach(function(item) {
				html += "<div class='mpDiv'>";
				html += "<fmt:formatDate value='${today}' pattern='yyyy.MM.dd(E)' var='todayDate' />";
				html += "<fmt:formatDate value='${m.msDate}' pattern='yyyy.MM.dd(E)' var='matchDate'/>";
				html += "<div class='mpDateDiv'>";
				html += "<span class='content fs-20'>${matchDate }</span>";
				html += "<hr class='dateHr'></div>";
				html += "<div class='statusTimeDiv'>";
				html += "<div class='statusDiv'>";
				html += "<p class='content fs-16'>미참여</p>";
				html += "</div>";
				html += "<p class='content fs-20'><fmt:formatDate value='${m.msDate}' pattern='HH:mm'/></p>";
				html += "</div>";
				html += "";
				html += "";
				html += "";
				html += "";
				html += "";
				html += "";
				html += "";
			});
			mpAllDiv.append(html);
			
			$(".weekDiv").removeClass("weekChoice");
			$(".weekDiv").each(function() {
				const weekChoice = $(this).attr('id')
				if(weekChoice == week){
					$(this).addClass("weekChoice");
				}
			});
			
	    },
	    error: function(err) {
	        console.log("요청 실패", err);
	    }
	});
		

}

</script>
<!-- icon -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<!-------------------------------------------->
</body>
</html>
