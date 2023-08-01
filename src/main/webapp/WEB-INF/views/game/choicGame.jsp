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
    height: 350px;
}
.choiceTheme{
	display: flex;
    border: 4px solid var(--lol-teamblue);
    border-radius: 10px 10px 10px 10px;
    flex-direction: column;
    align-items: center;
    width: 69%;
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
}
</style>
<!------------------------------------>
<title>SAMPLE</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
    	<img id="choiceGameBack" >
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin" id="gameTitle">
                <p class="subTitle fs-20">게임 선택</p>
                <div class="choiceMain" id="worldcup">
                    <p class="mainTitle fs-35 mainTitleMargin">이상형 월드컵</p>
                    <div class="gameChoiceView">
                    	<img class="cursor" src="${path }/resources/images/game/leftClick.png">
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
	                    <img class="cursor" src="${path }/resources/images/game/rightClick.png">
                    </div>
                    <img class="startGame" src="${path }/resources/images/game/choiceButton.png">
                </div>
                <div class="choiceMain" id="adventure" style="display:none">
                    <p class="mainTitle fs-35 mainTitleMargin">포로의 대모험</p>
                    <div class="gameChoiceView">
                    	<img class="cursor" src="${path }/resources/images/game/leftClick.png">
	                    <div class="choiceTheme">
                    		<img id="poro" src="${path }/resources/images/game/poro_adventure.jpg">
	                    </div>
	                    <img class="cursor" src="${path }/resources/images/game/rightClick.png">
                    </div>
                    <img class="startGame" src="${path }/resources/images/game/choiceButton.png">
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
	$('.cursor').click(function(e) {
		const worldcup=$('#worldcup');
		const adventure=$('#adventure');
		if(worldcup.css('display')=="none"){
			worldcup.show();
			adventure.hide();
		}else{
			adventure.show();
			worldcup.hide();
		}

	});
});


</script>
<!-------------------------------------------->
</body>
</html>
