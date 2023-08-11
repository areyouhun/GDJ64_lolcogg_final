<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/quiz/style_quiz.css">
<!------------------------------------>
<title>SAMPLE</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
		<!-- 배경 이미지 -->
		<img id="backgroundImg" src="${path}/resources/images/quiz/backgorund-img.jpg" />

        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin" style="height:551px">	
            <div id="quizTitle" >
					<p class="subTitle fs-20">퀴즈 선택</p>
					<!-- 퀴즈 분류 -->
					<div class="choice-quiz" id="champNameQuiz">
						<p class="mainTitle fs-35 mainTitleMargin">그림으로 이름 맞추기</p>
						<div class="quiz-view">
							<img class="cursor switch-btn" src="${path}/resources/images/game/leftClick.png" />
							<div class="choice-thema">
								<img class="percent" src="${path}/resources/images/quiz/garen-img.jpg" />
							</div>
							<img class="cursor switch-btn" src="${path}/resources/images/game/rightClick.png">
						</div>
						<a href="#" class="start-quiz">퀴즈 시작!</a>
					</div>

					<div class="choice-quiz" id="voiceQuiz" style="display:none">
						<p class="mainTitle fs-35 mainTitleMargin">음성으로 이름 맞추기</p>
						<div class="quiz-view">
							<img class="cursor switch-btn" src="${path}/resources/images/game/leftClick.png" />
							<div class="choice-thema">
								<img class="percent" src="${path}/resources/images/quiz/zoe-img.jpg" />
							</div>
							<img class="cursor switch-btn" src="${path}/resources/images/game/rightClick.png" />
						</div>
						<a href="#" class="start-quiz">퀴즈 시작!</a>
					</div>
					<!-- 퀴즈 분류 종료 -->
				</div>
            </div>
        </div>
    </section>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
	const CHAMP_NAME_QUIZ = $('#champNameQuiz');
	const VOICE_QUIZ = $('#voiceQuiz');

	$('.switch-btn').click((event) => {
		CHAMP_NAME_QUIZ.toggle();
		VOICE_QUIZ.toggle();
	});
</script>
<!-------------------------------------------->
</body>
</html>