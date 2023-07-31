<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<style>
.worldcupModal {
	width: 600px;
	height: 400px;
	position: absolute;
	z-index: 1000;
	background-color: var(--lol-white);
	margin-top: 60px;
}

.worldcupModal>img {
	margin-top: 3rem;
}

.worldcupModal>h2 {
	color: var(--lol-black);
	font-family: EF_MACHO;
	margin-top: 1rem;
}

.worldcupModal>div>p {
	color: var(--lol-black);
	font-family: "SUIT-Regular";
}

.worldcupModal>div {
	margin-top: 1rem;
	width: 90%;
}

.worldcupModal>div>* {
	margin-bottom: 0.5rem;
}

.worldcupModal>div>select {
	width: 33rem;
	height: 2.5rem;
	background-color: #D9D9D9;
	text-indent: 1rem;
}

.worldcupModal>div>button:first-child {
	width: 25rem;
	height: 2.8rem;
	border: none;
	background-color: var(--lol-mainblue);
	color: var(--lol-white);
}

.worldcupModal>div>button:last-child {
	width: 8rem;
	height: 2.8rem;
}

.worldcupModal>form>div:last-child>button {
	font-size: 16px;
}

.firstImg, .secondImg {
	width: 77vh;
	height: 100%;
	background-size: contain;
}

#worldcupStart {
	display: flex;
	flex-direction: column;
}

.round {
	position: absolute;
	color: var(--lol-white);
	top: 5.7%;
	width: 75%;
	display: flex;
	justify-content: center;
	background-color: rgb(0, 0, 0, 0.6);
	font-size: 3vh;
	z-index: 3;
}

.fight {
	display: flex;
	justify-content: center;
}

.imgSetting {
	height: 100vh;
	display: flex;
}

.fight>img {
	position: absolute;
	height: 28%;
	top: 44%;
	left: 41%;
	background-size: contain;
	background-position: center top;
}

.fight>div {
	position: absolute;
	display: flex;
	top: 67%;
	width: 164vh;
	justify-content: space-around;
	color: var(--lol-white);
	-webkit-text-stroke: 1.5px;
	-webkit-text-stroke-color: var(--lol-mainblue);
	font-size: 4vh;
	-webkit-text-stroke-color: var(--lol-mainblue);
}
</style>
<!------------------------------------>
<title>롤코지지-${gameName }</title>
</head>
<body style="overflow: hidden">
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section style="height: 700px">
		<div style="display: flex; justify-content: center;">
			<div class="worldcupModal"
				style="display: flex; flex-direction: column; align-items: center;">
				<img src="${path }/resources/images/game/worldcup/trophy.png">
				<h2>${gameName }</h2>
				<div>
					<p>총 라운드를 선택하세요</p>
					<select id="roundselect">
						<option value="32">32강</option>
						<option value="16">16강</option>
						<option value="8">8강</option>
						<option value="4">4강</option>
					</select>
					<p id="roundText">총 ${count }명의 후보 중 무작위 32명이 대결합니다.</p>
				</div>
				<div>
					<button onclick="startWorldCup();">시작하기</button>
					<button onclick="location.replace('${path }/game/choice')">돌아가기</button>
				</div>
			</div>

			<div id="worldcupAll"></div>


		</div>
	</section>
	<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
	<script src="${path}/resources/js/script_common.js"></script>
	<!-- Your own script tag or JavaScript file -->
	<script>
	 let gameround=0;
	 let select=[];
	 let quarterfinalsplayerImg=[]
	 let quarterfinalsplayerName=[]
	const startWorldCup=()=>{
		$('.worldcupModal').hide();
		$.ajax({
		    type : 'GET',          
		    url : '${path}/game/worldcupStart',
		    dataType : 'json',
		    data : {
		    	"no" : ${no},
		    	"round" :$("#roundselect").val()
		    }, 
		    success : function(data) { 
		    	console.log(data)
		    	data.forEach(function(i){
		    		quarterfinalsplayerImg.push(i.wcImgFilename);
		    		quarterfinalsplayerName.push(i.wcImgName);
		    	})
		    	if($("#roundselect").val()==32){
		    		round32();
			    	quarterfinalsplayerImg=[]
			   	 	quarterfinalsplayerName=[]
			    	choiceClick();
			    	  $('.finalImgTT').click(function(){
			    		 setTimeout(function(){
			    			 gameround=0;
			    			 round16();
			    			 quarterfinalsplayerImg=[]
			 		   	 	 quarterfinalsplayerName=[]
			    			 choiceClick();
					    	  $('.finalImgST').click(function(){
					    		 setTimeout(function(){
					    			 gameround=0;
					    			 round8();
					    			 quarterfinalsplayerImg=[]
					 		   	 	 quarterfinalsplayerName=[]
					    			 choiceClick();
					 		    	$('.finalImgE').click(function(){
							    		 setTimeout(function(){
							    			 gameround=0;
							    			 round4();
							    			 quarterfinalsplayerImg=[]
							 		   	 	 quarterfinalsplayerName=[]
							    			 choiceClick();
							 		    	$('.finalImgF').click(function(){
									    		 setTimeout(function(){
									    			 gameround=0;
									    			 round2();
									    			 choiceClick();
									    		 },1000);
							 		    	})
							    		 },1000);
					 		    	})
					    		 },1000);
					    		
					    	 })
			    		 },1000);
			    	 })
		    	}else if($("#roundselect").val()==16){
			    			 gameround=0;
			    			 round16();
			    			 quarterfinalsplayerImg=[]
			 		   	 	 quarterfinalsplayerName=[]
			    			 choiceClick();
					    	  $('.finalImgST').click(function(){
					    		 setTimeout(function(){
					    			 gameround=0;
					    			 round8();
					    			 quarterfinalsplayerImg=[]
					 		   	 	 quarterfinalsplayerName=[]
					    			 choiceClick();
					 		    	$('.finalImgE').click(function(){
							    		 setTimeout(function(){
							    			 gameround=0;
							    			 round4();
							    			 quarterfinalsplayerImg=[]
							 		   	 	 quarterfinalsplayerName=[]
							    			 choiceClick();
							 		    	$('.finalImgF').click(function(){
									    		 setTimeout(function(){
									    			 gameround=0;
									    			 round2();
									    			 choiceClick();
									    		 },1000);
							 		    	})
							    		 },1000);
					 		    	})
					    		 },1000);
					    		
					    	 })
		    	}else if($("#roundselect").val()==8){
			    			 gameround=0;
			    			 round8();
			    			 quarterfinalsplayerImg=[]
			 		   	 	 quarterfinalsplayerName=[]
			    			 choiceClick();
			 		    	$('.finalImgE').click(function(){
					    		 setTimeout(function(){
					    			 gameround=0;
					    			 round4();
					    			 quarterfinalsplayerImg=[]
					 		   	 	 quarterfinalsplayerName=[]
					    			 choiceClick()
					 		    	$('.finalImgF').click(function(){
							    		 setTimeout(function(){
							    			 gameround=0;
							    			 round2();
							    			 choiceClick();
							    		 },1000);
					 		    	})
					    		 },1000);
			    	 })
    	}else{
	    			 gameround=0;
	    			 round4();
	    			 quarterfinalsplayerImg=[]
	 		   	 	 quarterfinalsplayerName=[]
	    			 choiceClick();
	 		    	$('.finalImgF').click(function(){
			    		 setTimeout(function(){
			    			 gameround=0;
			    			 round2();
			    			 finalClick();
			    		 },1000);
	 })
    	}
				
		    	
		    	
		    },
		    error : function(request, status, error) { 
		        console.log(error)
		    }
		})
		
	}
	
	let count=1;
	function round32(){
		console.log(quarterfinalsplayerImg);
		console.log(quarterfinalsplayerName);
		$('#worldcupAll').empty();
		for(let i=0;i<32;i+=2){
			const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
			shape.append('<div class="round"><h2>${gameName } 32강 '+count+'/16</h2></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=30?'"':' finalImgTT" ')+'src="${path }'+($("#roundselect").val()==32?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=30?'"':' finalImgTT" ')+'src="${path }'+($("#roundselect").val()==32?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2>'+quarterfinalsplayerName[i]+'</h2><h2>'+quarterfinalsplayerName[i+1]+'</h2></div>')
			imgsetting.append(firstImg);
			imgsetting.append(secondImg);
			shape.append(imgsetting);
			fight.append(versus);
			fight.append(name);
			shape.append(fight);
			$('#worldcupAll').append(shape);
			count++;
		}
	}
	function round16(){
		$('#worldcupAll').empty();
		count=1;
		for(let i=0;i<16;i+=2){
			const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
			shape.append('<div class="round"><h2>${gameName} 16강 '+count+'/8</h2></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=14?'"':' finalImgST" ')+'src="${path }'+($("#roundselect").val()==16?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=14?'"':' finalImgST" ')+'src="${path }'+($("#roundselect").val()==16?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2>'+quarterfinalsplayerName[i]+'</h2><h2>'+quarterfinalsplayerName[i+1]+'</h2></div>')
			imgsetting.append(firstImg);
			imgsetting.append(secondImg);
			shape.append(imgsetting);
			fight.append(versus);
			fight.append(name);
			shape.append(fight);
			$('#worldcupAll').append(shape);
			count++;
		}
	} 
	
	function round8(){
		$('#worldcupAll').empty();
		count=1;
		for(let i=0;i<8;i+=2){
			const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
			shape.append('<div class="round"><h2>${gameName} 8강 '+count+'/4</h2></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=6?'"':' finalImgE" ')+'src="${path }'+($("#roundselect").val()==8?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=6?'"':' finalImgE" ')+'src="${path }'+($("#roundselect").val()==8?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2>'+quarterfinalsplayerName[i]+'</h2><h2>'+quarterfinalsplayerName[i+1]+'</h2></div>')
			imgsetting.append(firstImg);
			imgsetting.append(secondImg);
			shape.append(imgsetting);
			fight.append(versus);
			fight.append(name);
			shape.append(fight);
			$('#worldcupAll').append(shape);
			count++;
		}
	}
	function round4(){
		$('#worldcupAll').empty();
		count=1;
		for(let i=0;i<4;i+=2){
			const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
			shape.append('<div class="round"><h2>${gameName} 4강 '+count+'/2</h2></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=2?'"':' finalImgF" ')+'src="${path }'+($("#roundselect").val()==4?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=2?'"':' finalImgF" ')+'src="${path }'+($("#roundselect").val()==4?"/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2>'+quarterfinalsplayerName[i]+'</h2><h2>'+quarterfinalsplayerName[i+1]+'</h2></div>')
			imgsetting.append(firstImg);
			imgsetting.append(secondImg);
			shape.append(imgsetting);
			fight.append(versus);
			fight.append(name);
			shape.append(fight);
			$('#worldcupAll').append(shape);
			count++;
		}
	}
	function round2(){
		$('#worldcupAll').empty();
		const shape=$('<div class="worldcupStart">');
		shape.append('<div class="round"><h2>${gameName} 결승전</h2></div>');
		const imgsetting=$('<div class="imgSetting">')
		const firstImg=$('<img class="firstImg" src="${path }'+quarterfinalsplayerImg[0]+'">')
		const secondImg=$('<img class="secondImg" src="${path }'+quarterfinalsplayerImg[1]+'">')
		const fight=$('<div class="fight">');
		const versus=$('<img src="${path }/resources/images/game/versus.png">');
		const name=$('<div><h2>'+quarterfinalsplayerName[0]+'</h2><h2>'+quarterfinalsplayerName[1]+'</h2></div>')
		imgsetting.append(firstImg);
		imgsetting.append(secondImg);
		shape.append(imgsetting);
		fight.append(versus);
		fight.append(name);
		shape.append(fight);
		$('#worldcupAll').append(shape);
	}
	
	function finalClick(){
		 $( '.firstImg' ).click(function(e){
		 		$( '.firstImg' ).css({'transform':'translate(50%,0)'});
		 		$( '.firstImg' ).css({'transition':'0.5s'});
		 		$( '.secondImg' ).css({'transform':'translate(200%,0)'});
		 		$( '.secondImg' ).css({'transition':'0.5s'});
		 		$( '.fight' ).hide();
		 	 })
		 	 $( '.secondImg' ).click(function(e){
		 		 $( '.secondImg' ).css({'transform':'translate(-50%,0)'});
		 		 $( '.secondImg' ).css({'transition':'0.5s'});
		 		$( '.firstImg' ).css({'transform':'translate(-200%,0)'});
		 		$( '.firstImg' ).css({'transition':'0.5s'});
		 		$( '.fight' ).hide();

		 	 })
	}
	
	
	
	function choiceClick(){
	 $( '.firstImg' ).click(function(e){
 		$( '.firstImg' ).css({'transform':'translate(50%,0)'});
 		$( '.firstImg' ).css({'transition':'0.5s'});
 		$( '.secondImg' ).css({'transform':'translate(200%,0)'});
 		$( '.secondImg' ).css({'transition':'0.5s'});
 		$( '.fight' ).hide();
 		quarterfinalsplayerImg.push($(e.target).attr("src"));
 		quarterfinalsplayerName.push($(e.target).parent().next().find('div').children(":first").text());
 		setTimeout(function(){
 			$( '.firstImg' ).css({'transform':'translate(0,0)'});
 			$( '.secondImg' ).css({'transform':'translate(0,0)'});
 			$( '.worldcupStart'+(gameround+2) ).show();
 			$( '.worldcupStart'+gameround ).hide();
 			$( '.fight' ).show();
 			gameround+=2;
 		},500);
 	 })
 	 $( '.secondImg' ).click(function(e){
 		 $( '.secondImg' ).css({'transform':'translate(-50%,0)'});
 		 $( '.secondImg' ).css({'transition':'0.5s'});
 		$( '.firstImg' ).css({'transform':'translate(-200%,0)'});
 		$( '.firstImg' ).css({'transition':'0.5s'});
 		$( '.fight' ).hide();
 		quarterfinalsplayerImg.push($(e.target).attr("src"));
 		quarterfinalsplayerName.push($(e.target).parent().next().find('div').children(":last").text());
 		setTimeout(function(){
 			$( '.firstImg' ).css({'transform':'translate(0,0)'});
 			$( '.secondImg' ).css({'transform':'translate(0,0)'});
 			$( '.worldcupStart'+(gameround+2) ).show();
 			$('.worldcupStart'+gameround ).hide();
 			$( '.fight' ).show();
 			gameround+=2;
 		},500);
 	 })
	}
	 
	 $("#roundselect").change(function(){
		 const regex = /\b\d{1,2}(?=명이)/g;
		 const str=$("#roundText").text()
		 $("#roundText").html(str.replace(regex,$('#roundselect').val())); 
	 })
	 
	 
</script>
	<!-------------------------------------------->
</body>
</html>