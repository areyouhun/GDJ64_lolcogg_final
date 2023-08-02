<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="matchResult" value="${requestScope.matchResult}"/>
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
                    <p class="match-summary_date fw-bold"><fmt:formatDate value="${matchResult.MS_DATE}" type="both" pattern="yyyy년 MM월 dd일 HH:mm"/></p>
                    <div class="match-summary_content">
                        <div class="summary_content-team">
                            <div>
                                <img src="${path}/resources/images/logo/${matchResult.MS_HOME}_big.png">
                            </div>
                            <h2 class="title"><c:out value="${matchResult.MS_HOME}"/></h2>
                        </div>
                        <h2 class="title"><c:out value="${matchResult.MS_HOME_SCORE} : ${matchResult.MS_AWAY_SCORE}"/></h2>
                        <div class="summary_content-team">
                            <div>
                                <img src="${path}/resources/images/logo/${matchResult.MS_AWAY}_big.png">
                            </div>
                            <h2 class="title"><c:out value="${matchResult.MS_AWAY}"/></h2>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>
    $.get("${path}/resources/csv/match/2023-07-30_NS_vs_BRO.csv")
        .then(data => {
            const sets = data.split("|");
            sets.forEach((set, index) => {
                if (index < sets.length) {
                    const rows = data.split(/\r?\n|\r/);

                }
            });
        });
</script>
</body>
</html>
