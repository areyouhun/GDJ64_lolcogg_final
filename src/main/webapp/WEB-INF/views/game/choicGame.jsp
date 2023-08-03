<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<style>
#choiceGameBack{
	width: 100%;
    height: 100%;
    opacity: 0.2;
    position: absolute;
    z-index: -10;
}
#gameTitle{
	display:flex;
    flex-direction: column;
    align-items: center;
}
.choiceMain{
	width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.gameChoiceView{
	display:flex;
    align-items: center;
    width: 75%;
    justify-content: space-evenly;
    margin-bottom: 4rem;
    height: 353px;
}
.choiceTheme{
	display: flex;
    border: 4px solid var(--lol-teamblue);
    border-radius: 10px 10px 10px 10px;
    flex-direction: column;
    align-items: center;
    height: 100%;
    width: 660px;
}
.choiceTheme>div:first-child{
	display:flex;
}
.choiceTheme>div:first-child>img{
	z-index: -1;
}
.choiceTheme>div:last-child{
	position: absolute;
    width: 27%;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 8rem;
    
}
.choiceTheme>div:last-child>div{
	display:flex;
	flex-direction: row;
    justify-content: space-between;
    width: 84%;
    font-size: 30px;
    -webkit-text-stroke: 1px;
    -webkit-text-stroke-color: var(--lol-mainblue);
}
.cursor, .startGame{
	cursor: pointer;
}
#poro{
	width: 100%;
	overflow: hidden;
    border-radius: 10px 10px 10px 10px;
}
.load{
		width:100%;
		height:100%;
		background-color:var(--lol-black);
		animation-duration: 4s;
 		animation-name: slidein;
 		z-index:10000;
 		position: absolute;
 		display: flex;
 		align-items: center;
    	justify-content: center;
    	animation-fill-mode: forwards;
	}
	
	@keyframes slidein {
		0%{
		    margin-left: -100%;
			width: 100%;
			opacity: 0;
	 	}
	
		50%{
		    margin-left: 0%;
		    width: 100%;
		    opacity:1;
		}
		100%{
		    margin-left: 100%;
			width: 100%;
			opacity: 0;
			display:none;
	 	}

	}
	#worldCupPlay{
		display: flex;
	    flex-direction: column;
    	align-items: center;
	}
	.cupGameBack{
		background-color: var(--lol-mainblue);
		border: 4px solid var(--lol-mainblue);
		border-radius: 10px 10px 10px 10px;
	}
	.cupGameBack>div:first-child,.cupGameBack>div:first-child>div:first-child {
		display: flex;
	}
	.cupGameBack>div:last-child {
		display: flex;
		flex-direction: column;
   		align-items: center;
   		color: var(--lol-white);
	} 


	.cupGameBack>div:last-child>div{
		display: flex;
	    width: 100%;
	    justify-content: space-around;
	}
	.cupGameBack>div:last-child>div>div{
		display: flex;
	    align-items: center;
	}
	.cupGameBack>div:last-child>h3{
		margin-top: 0.8rem;
	    margin-bottom: 0.8rem;
	}
	.start *{
		margin: 0.4rem;
	}
	#worldCupPlay>div{
		display: flex;
		width: 100%;
   		justify-content: space-around;
   		margin-bottom: 2rem;
	}
</style>
<!------------------------------------>
<title>롤코지지-게임</title>
</head>
<body style="overflow: hidden">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
    	<div id="adventureGame" style="display:none">
    		<img src="${path}/resources/images/game/poro_adventure_loading.jpg" >
    	</div>
    	<div id="worldCupGame" style="display:none">
    		<img src="${path}/resources/images/game/worldcup_loading.jpg" >
    	</div>
    	<img id="choiceGameBack" >
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin" style="height:551px">
            
            	<div id="gameTitle" >
	                <p class="subTitle fs-20">게임 선택</p>
	                <div class="choiceMain" id="worldcup">
	                    <p class="mainTitle fs-35 mainTitleMargin">이상형 월드컵</p>
	                    <div class="gameChoiceView">
	                    	<img class="cursor switch" src="${path }/resources/images/game/leftClick.png">
		                    <div class="choiceTheme">
		                    	<div>
		                    		<img src="${path }/resources/images/game/Teemo_choice.png">
		                    		<img src="${path }/resources/images/game/Yuumi_choice.png">
		                    	</div>
		                    	<div>
			                    	<img src="${path }/resources/images/game/versus.png" style="width:8rem;height:8rem;">
			                    	<div>
			                    		<h4 class="mainTitle">티모</h4>
			                    		<h4 class="mainTitle">유미</h4>
			                    	</div>
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
		                    		<img src="${path }/resources/images/game/gameMainSkin.png" style="width:400px;height:200px">
								</div>
							</div>
							<div>
								<h3 class="gameName">LOL 월드컵</h3>
	                            <div class="startworld">
	                                <div class="start cursor goGame" >
	                                    <img src="${path}/resources/images/game/cupstart.png">
	                                    <h3>시작하기</h3>
	                                </div>
	                                <div class="start cursor">
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
								<h3 class="gameName">LOL 월드컵</h3>
	                            <div class="startworld">
	                                <div class="start cursor goGame">
	                                    <img src="${path}/resources/images/game/cupstart.png">
	                                    <h3>시작하기</h3>
	                                </div>
	                                <div class="start cursor">
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
	                                <div class="start cursor">
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
	                                <div class="start cursor">
	                                    <img src="${path}/resources/images/game/cuplist.png">
	                                    <h3>랭킹보기</h3>
	                                </div>
	                            </div>
							</div>
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
<script>
window.onload=function(){
	$('#choiceGameBack').attr("src","${path }/resources/images/game/choiceGameBack"+Math.floor(Math.random() * 7)+".gif");
}
$(function () {
		const worldcup=$('#worldcup');
		const adventure=$('#adventure');
		const gameTitle=$('#gameTitle');
		const adventureGame=$('#adventureGame');
		const worldCupGame=$('#worldCupGame');
		const worldCupPlay=$('#worldCupPlay');
	$('.switch').click(function(e) {
		if(worldcup.css('display')=="none"){
			worldcup.show();
			adventure.hide();
		}else{
			adventure.show();
			worldcup.hide();
		}

	});
	$('#adventureStart').click(function(e){
		gameTitle.hide();
		adventureGame.addClass('load')
		adventureGame.show();;
		setTimeout(function(){
			gameTitle.show();
		},2000);
		setTimeout(function(){
			adventureGame.removeClass('load')
			adventureGame.hide();
		},3000);
	})
	$('#worldcupStart').click(function(e){
		gameTitle.hide();
		worldCupGame.addClass('load')
		worldCupGame.show();;
		setTimeout(function(){
			worldCupPlay.show();
		},2000);
	})
	
	$(".goGame").click(function(e){
		const name=$(e.target).parent().parent().parent().find('.gameName').text();
		let num=0;
		switch(name){
			case "LCK 롤 프로게이머 월드컵" : num=1;break;
			case "LOL 롤 스킨 월드컵" : num=2;break;
		}
		window.open("${path}/game/worldcup?gameName="+name+"&no="+num) 
	});
	
});


</script>
<!-------------------------------------------->
</body>
</html>
