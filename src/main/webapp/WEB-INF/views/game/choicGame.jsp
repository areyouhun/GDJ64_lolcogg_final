<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/game/choiceGame.css">
<!------------------------------------>
<title>롤코지지-게임</title>
</head>
<body style="overflow-x: hidden">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
    	<div id="adventureGame" style="display:none">
    		<img src="${path}/resources/images/game/poro_adventure_loading.jpg"  style="width:100%;height:100vh">
    	</div>
    	<div id="worldCupGame" style="display:none">
    		<img src="${path}/resources/images/game/worldcup_loading.jpg" style="width:100%;height:100vh">
    	</div>
    	<img id="choiceGameBack" style="height: 927px;">
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin" style="height:551px">	
            
            	<div id="gameTitle" >
	                <p class="subTitle fs-20">게임 선택</p>
	                <div class="choiceMain" id="worldcup">
	                    <p class="mainTitle fs-35 mainTitleMargin">이상형 월드컵</p>
	                    <div class="gameChoiceView">
	                    	<img class="cursor switch" src="${path }/resources/images/game/leftClick.png">
		                    <div class="choiceTheme ">
		                    	<div class="percent">
		                    		<img class="percent" src="${path }/resources/images/game/worldcup_choice.png">
		                    	</div>
		                    </div>
		                    <img class="cursor switch" src="${path }/resources/images/game/rightClick.png">
	                    </div>
	                    <img class="startGame" id="worldcupStart" src="${path }/resources/images/game/choiceButton.png">
	                </div>
	                <div class="choiceMain" id="adventure" style="display:none">
	                    <p class="mainTitle fs-35 mainTitleMargin">포로의 대모험</p>
	                    <div class="gameChoiceView">
	                    	<img class="cursor switch" src="${path }/resources/images/game/leftClick.png">
		                    <div class="choiceTheme">
	                    		<img id="poro" src="${path }/resources/images/game/poro_adventure.jpg">
		                    </div>
		                    <img class="cursor switch" src="${path }/resources/images/game/rightClick.png">
	                    </div>
	                    <img class="startGame" id="adventureStart" src="${path }/resources/images/game/choiceButton.png">
	                </div>
				</div>
				
				
				
				<div id="worldCupPlay" style="display:none">
					<p class="mainTitle fs-35">이상형 월드컵</p>
					<div>
						<div class="cupGameBack">
							<div>
								<div>
		                    		<img src="${path }/resources/images/game/gameMainChampion.png" style="width:400px;height:200px;border-radius:10px;">
								</div>
							</div>
							<div>
								<h3 class="gameName">LOL 롤 챔피언 월드컵</h3>
	                            <div class="startworld">
	                                <div class="start cursor goGame" >
	                                    <img src="${path}/resources/images/game/cupstart.png">
	                                    <h3>시작하기</h3>
	                                </div>
	                                <div class="start cursor goRanking">
	                                    <img src="${path}/resources/images/game/cuplist.png">
	                                    <h3>랭킹보기</h3>
	                                </div>
	                            </div>
							</div>
						</div>
						<div class="cupGameBack">
							<div>
								<div>
		                    		<img src="${path }/resources/images/game/gameMainSkin.png" style="width:400px;height:200px">
								</div>
							</div>
							<div>
								<h3 class="gameName">LOL 롤 스킨 월드컵</h3>
	                            <div class="startworld">
	                                <div class="start cursor goGame">
	                                    <img src="${path}/resources/images/game/cupstart.png">
	                                    <h3>시작하기</h3>
	                                </div>
	                                <div class="start cursor goRanking">
	                                    <img src="${path}/resources/images/game/cuplist.png">
	                                    <h3>랭킹보기</h3>
	                                </div>
	                            </div>
							</div>
						</div>
					</div>
					<div>
						<div class="cupGameBack">
							<div>
								<div>
		                    		<img src="${path }/resources/images/game/gameMainProgamer.png" style="width:400px;height:200px">
								</div>
							</div>
							<div>
								<h3 class="gameName">LCK 롤 프로게이머 월드컵</h3>
	                            <div class="startworld">
	                                <div class="start cursor goGame">
	                                    <img src="${path}/resources/images/game/cupstart.png">
	                                    <h3>시작하기</h3>
	                                </div>
	                                <div class="start cursor goRanking">
	                                    <img src="${path}/resources/images/game/cuplist.png">
	                                    <h3>랭킹보기</h3>
	                                </div>
	                            </div>
							</div>
						</div>
						<div class="cupGameBack">
							<div>
								<div>
		                    		<img src="${path }/resources/images/game/lolBGM.png" style="width:400px;height:200px">
								</div>
							</div>
							<div>
								<h3 class="gameName">LOL 롤 BGM 음악 월드컵</h3>
	                            <div class="startworld">
	                                <div class="start cursor goGame" >
	                                    <img src="${path}/resources/images/game/cupstart.png">
	                                    <h3>시작하기</h3>
	                                </div>
	                                <div class="start cursor goRanking">
	                                    <img src="${path}/resources/images/game/cuplist.png">
	                                    <h3>랭킹보기</h3>
	                                </div>
	                            </div>
							</div>
						</div>
					</div>
				</div>
				
				<div id="adventurePlay" style="display:none">
					<p class="mainTitle fs-35">포로의 대모험</p>
					<div>
						<div class="adventureMain">
							<img id="admap" src="${path}/resources/images/game/adventure/빌지워터.png">
							<div id="adch">
								<img id="adimg1" src="${path}/resources/images/game/adventure/미스포로.png" style="display:none;">
								<img id="adimg2" src="${path}/resources/images/game/adventure/갱플포로.png" style="display:none">
								<img id="adimg3" src="${path}/resources/images/game/adventure/트페포로.png" style="display:none">
								<img id="adimg4" src="${path}/resources/images/game/adventure/그브포로.png" style="display:none">
							</div>
							
							<div id="adchoice" style="display:none;">
								<button id="oneclick">따라간다</button>
								<button id="twoclick">다른 곳을 둘러본다</button>
							</div>
							<div id="adname">
								<div >
									<p id="namead">김포로</p>
								</div>
							</div>
							<div id="adtext">
								<div>
								</div>
								<p class="typing-txt">여기는 빌지워터, 현상수배범과 현상금 사냥꾼들이 넘쳐나는 도시이다.</p>
								<p class="typing"></p>
							</div>
							<div>
								<img id="adarrow" class="adarrow" src="${path}/resources/images/game/adventure/gamearrow.png"  style="display:none">
							</div>
							<div id="adsound">
								<img class="soundimg" id="sound" src="${path}/resources/images/game/adventure/sound-up.png"  >
								<img class="soundimg" id="mute" src="${path}/resources/images/game/adventure/sound-mute.png"  style="display:none">
							</div>
						</div>
					</div>
				</div>
				
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
	const path='${path}';
</script>
<script src="${path}/resources/js/game/choiceGame.js"></script>
<!-------------------------------------------->
</body>
</html>
