<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/calendar/style_schedule.css">
<style>
.background-img {
	width: 100%;
	height: 100%;
	background-image: linear-gradient(rgba(15, 15, 15, 0.6),
	rgba(15, 15, 15, 1)),url("${path}/resources/images/calendar/schedule_Title_IMG.png");
	background-size: 100%;
	background-repeat: no-repeat;
	background-position: center top;
}
</style>
<!------------------------------------>
<title>일정</title>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <!-- Title -->
                <div class="title-margin"></div>
                <div class="title-container">
                    <p class="subTitle fs-20">MATCH SCHEDULE</p>
                    <p class="mainTitle fs-35">경기일정</p>
                    <div>
                        <p class="content fs-20">LCK 경기일정을 확인 후 승부예측에 도전해보세요!</p>
                        <p class="content fs-20">종료된 경기 클릭시 경기결과 페이지로 이동합니다.</p>
                    </div>
                </div>

                <!-- Calendar -->
				<div id="calendar">
					<div id="calendarHead">
				    	<div class="calendar-year">
				        	<c:out value="${year}" />
				        </div>
				        <div class="calendar-month">
				            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="27" viewBox="0 0 23 27" fill="none" onclick="prevMonth()">
				                <path d="M0 13.2156L22.8234 26.3927L22.8234 0.0385065L0 13.2156Z" fill="#EEEEEE"/>
				            </svg>
				            <span>
				            	<c:out value="${month}" />
				            </span>
				            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="27" viewBox="0 0 24 27" fill="none" onclick="nextMonth()">
				                <path d="M23.4316 13.216L0.608213 0.0389099V26.3931L23.4316 13.216Z" fill="#EEEEEE"/>
				            </svg>
				        </div>
				    </div>
				
				    <div id="calendarBody">
						<table id="calendarTable" class="flipIn">
						</table>
					</div>
				</div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script src="${path}/resources/js/calendar/script_calendar.js"></script>
<!-------------------------------------------->
</body>
</html>
