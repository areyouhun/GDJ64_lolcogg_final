<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/game/worldcup.css">
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
						<c:if test="${count>=128 }">
							<option value="128">128강</option>
						</c:if>
						<c:if test="${count>=64 }">
							<option value="64">64강</option>
						</c:if>
						<option value="32" selected>32강</option>
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
		    	"num" : ${num},
		    	"round" :$("#roundselect").val()
		    }, 
		    success : function(data) { 
		    	data.forEach(function(i){
		    		quarterfinalsplayerImg.push(i.wcImgFilename);
		    		quarterfinalsplayerName.push(i.wcImgName);
		    	})
		    	if(${num}==4){
		    		if($("#roundselect").val()==32){
		    			roundvideo32();
				    	quarterfinalsplayerImg=[]
				   	 	quarterfinalsplayerName=[]
				    	choiceClickVideo();
				    	  $('.leftchoiceTT,.rightchoiceTT').click(function(){
				    		 setTimeout(function(){
				    			 gameround=0;
				    			 roundvideo16();
				    			 quarterfinalsplayerImg=[]
				 		   	 	 quarterfinalsplayerName=[]
				    			 choiceClickVideo();
						    	  $('.leftchoiceST,.rightchoiceST').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 roundvideo8();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClickVideo();
						 		    	$('.leftchoiceE,.rightchoiceE').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 roundvideo4();
								    			 quarterfinalsplayerImg=[]
								 		   	 	 quarterfinalsplayerName=[]
								    			 choiceClickVideo();
								 		    	$('.leftchoiceF,.rightchoiceF').click(function(){
										    		 setTimeout(function(){
										    			 gameround=0;
										    			 roundvideo2();
										    			 finalClickVideo();
										    		 },500);
								 		    	})
								    		 },500);
						 		    	})
						    		 },500);
						    		
						    	 })
				    		 },500);
				    	 })
			    	}else if($("#roundselect").val()==16){
				    			 gameround=0;
				    			 roundvideo16();
				    			 quarterfinalsplayerImg=[]
				 		   	 	 quarterfinalsplayerName=[]
				    			 choiceClickVideo();
						    	  $('.leftchoiceST,.rightchoiceST').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 roundvideo8();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClickVideo();
						 		    	$('.leftchoiceE,.rightchoiceE').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 roundvideo4();
								    			 quarterfinalsplayerImg=[]
								 		   	 	 quarterfinalsplayerName=[]
								    			 choiceClickVideo();
								 		    	$('.leftchoiceF,.rightchoiceF').click(function(){
										    		 setTimeout(function(){
										    			 gameround=0;
										    			 roundvideo2();
										    			 finalClickVideo();
										    		 },500);
								 		    	})
								    		 },500);
						 		    	})
						    		 },500);
						    		
						    	 })
			    	}else if($("#roundselect").val()==8){
				    			 gameround=0;
				    			 roundvideo8();
				    			 quarterfinalsplayerImg=[]
				 		   	 	 quarterfinalsplayerName=[]
				    			 choiceClickVideo();
				 		    	$('.leftchoiceE,.rightchoiceE').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 roundvideo4();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClickVideo()
						 		    	$('.leftchoiceF,.rightchoiceF').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 roundvideo2();
								    			 finalClickVideo();
								    		 },500);
						 		    	})
						    		 },500);
				    	 })
	    			}else{
		    			 gameround=0;
		    			 roundvideo4();
		    			 quarterfinalsplayerImg=[]
		 		   	 	 quarterfinalsplayerName=[]
		    			 choiceClickVideo();
		 		    	$('.leftchoiceF,.rightchoiceF').click(function(){
				    		 setTimeout(function(){
				    			 gameround=0;
				    			 roundvideo2();
				    			 finalClickVideo();
				    		 },500);
					 	})
	    			}
		    	}else{
			    	if($("#roundselect").val()==128){
			    		round128();
				    	quarterfinalsplayerImg=[]
				   	 	quarterfinalsplayerName=[]
				    	choiceClick();
				    	  $('.finalImgLO,.finalNameLO').click(function(){
			    		  	setTimeout(function(){
				    		gameround=0;
				    		round64();
					    	quarterfinalsplayerImg=[]
					   	 	quarterfinalsplayerName=[]
					    	choiceClick();
					    	  $('.finalImgSF,.finalNameSF').click(function(){
				    		  	setTimeout(function(){
					    		gameround=0;
					    		round32();
						    	quarterfinalsplayerImg=[]
						   	 	quarterfinalsplayerName=[]
						    	choiceClick();
						    	  $('.finalImgTT,.finalNameTT').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 round16();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClick();
								    	  $('.finalImgST,.finalNameST').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 round8();
								    			 quarterfinalsplayerImg=[]
								 		   	 	 quarterfinalsplayerName=[]
								    			 choiceClick();
								 		    	$('.finalImgE,.finalNameE').click(function(){
										    		 setTimeout(function(){
										    			 gameround=0;
										    			 round4();
										    			 quarterfinalsplayerImg=[]
										 		   	 	 quarterfinalsplayerName=[]
										    			 choiceClick();
										 		    	$('.finalImgF,.finalNameF').click(function(){
												    		 setTimeout(function(){
												    			 gameround=0;
												    			 round2();
												    			 finalClick();
												    		 },500);
										 		    	})
										    		 },500);
								 		    	})
								    		 },500);
								    	 })
						    		 },500);
						    	 })
					    		 },500);
					    	 })
				    		 },500);
				    	 })
			    	}else if($("#roundselect").val()==64){
				    		round64();
					    	quarterfinalsplayerImg=[]
					   	 	quarterfinalsplayerName=[]
					    	choiceClick();
					    	  $('.finalImgSF,.finalNameSF').click(function(){
				    		  	setTimeout(function(){
					    		gameround=0;
					    		round32();
						    	quarterfinalsplayerImg=[]
						   	 	quarterfinalsplayerName=[]
						    	choiceClick();
						    	  $('.finalImgTT,.finalNameTT').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 round16();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClick();
								    	  $('.finalImgST,.finalNameST').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 round8();
								    			 quarterfinalsplayerImg=[]
								 		   	 	 quarterfinalsplayerName=[]
								    			 choiceClick();
								 		    	$('.finalImgE,.finalNameE').click(function(){
										    		 setTimeout(function(){
										    			 gameround=0;
										    			 round4();
										    			 quarterfinalsplayerImg=[]
										 		   	 	 quarterfinalsplayerName=[]
										    			 choiceClick();
										 		    	$('.finalImgF,.finalNameF').click(function(){
												    		 setTimeout(function(){
												    			 gameround=0;
												    			 round2();
												    			 finalClick();
												    		 },500);
										 		    	})
										    		 },500);
								 		    	})
								    		 },500);
								    	 })
						    		 },500);
						    	 })
					    		 },500);
					    	 })
			    		
			    	}else if($("#roundselect").val()==32){
			    		round32();
				    	quarterfinalsplayerImg=[]
				   	 	quarterfinalsplayerName=[]
				    	choiceClick();
				    	  $('.finalImgTT,.finalNameTT').click(function(){
				    		 setTimeout(function(){
				    			 gameround=0;
				    			 round16();
				    			 quarterfinalsplayerImg=[]
				 		   	 	 quarterfinalsplayerName=[]
				    			 choiceClick();
						    	  $('.finalImgST,.finalNameST').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 round8();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClick();
						 		    	$('.finalImgE,.finalNameE').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 round4();
								    			 quarterfinalsplayerImg=[]
								 		   	 	 quarterfinalsplayerName=[]
								    			 choiceClick();
								 		    	$('.finalImgF,.finalNameF').click(function(){
										    		 setTimeout(function(){
										    			 gameround=0;
										    			 round2();
										    			 finalClick();
										    		 },500);
								 		    	})
								    		 },500);
						 		    	})
						    		 },500);
						    		
						    	 })
				    		 },500);
				    	 })
			    	}else if($("#roundselect").val()==16){
				    			 gameround=0;
				    			 round16();
				    			 quarterfinalsplayerImg=[]
				 		   	 	 quarterfinalsplayerName=[]
				    			 choiceClick();
						    	  $('.finalImgST,.finalNameST').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 round8();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClick();
						 		    	$('.finalImgE,.finalNameE').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 round4();
								    			 quarterfinalsplayerImg=[]
								 		   	 	 quarterfinalsplayerName=[]
								    			 choiceClick();
								 		    	$('.finalImgF,.finalNameF').click(function(){
										    		 setTimeout(function(){
										    			 gameround=0;
										    			 round2();
										    			 finalClick();
										    		 },500);
								 		    	})
								    		 },500);
						 		    	})
						    		 },500);
						    		
						    	 })
			    	}else if($("#roundselect").val()==8){
				    			 gameround=0;
				    			 round8();
				    			 quarterfinalsplayerImg=[]
				 		   	 	 quarterfinalsplayerName=[]
				    			 choiceClick();
				 		    	$('.finalImgE,.finalNameE').click(function(){
						    		 setTimeout(function(){
						    			 gameround=0;
						    			 round4();
						    			 quarterfinalsplayerImg=[]
						 		   	 	 quarterfinalsplayerName=[]
						    			 choiceClick()
						 		    	$('.finalImgF,.finalNameF').click(function(){
								    		 setTimeout(function(){
								    			 gameround=0;
								    			 round2();
								    			 finalClick();
								    		 },500);
						 		    	})
						    		 },500);
				    	 })
	    			}else{
		    			 gameround=0;
		    			 round4();
		    			 quarterfinalsplayerImg=[]
		 		   	 	 quarterfinalsplayerName=[]
		    			 choiceClick();
		 		    	$('.finalImgF,.finalNameF').click(function(){
				    		 setTimeout(function(){
				    			 gameround=0;
				    			 round2();
				    			 finalClick();
				    		 },500);
					 	})
	    			}
					
			    	
			    	
			    }
		    },
		    error : function(request, status, error) { 
		        console.log(error)
		    }
		})
		
	}
	
	
	
	
	
	
	
	
	
	let count=1;
	function round128(){
		count=1;
		$('#worldcupAll').empty();
		for(let i=0;i<128;i+=2){
			const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
			shape.append('<div class="roundMain"><div class="round"><h2>${gameName } 128강 '+count+'/64</h2></div></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=126?'"':' finalImgLO" ')+'src="'+($("#roundselect").val()==128?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=126?'"':' finalImgLO" ')+'src="'+($("#roundselect").val()==128?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2 class="leftName'+(i!=126?'">':' finalNameLO">')+quarterfinalsplayerName[i]+'</h2><h2 class="rightName'+(i!=126?'">':' finalNameLO">')+quarterfinalsplayerName[i+1]+'</h2></div>')
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
	function round64(){
		count=1;
		$('#worldcupAll').empty();
		for(let i=0;i<64;i+=2){
			const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
			shape.append('<div class="roundMain"><div class="round"><h2>${gameName } 64강 '+count+'/32</h2></div></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=62?'"':' finalImgSF" ')+'src="'+($("#roundselect").val()==64?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=62?'"':' finalImgSF" ')+'src="'+($("#roundselect").val()==64?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2 class="leftName'+(i!=62?'">':' finalNameSF">')+quarterfinalsplayerName[i]+'</h2><h2 class="rightName'+(i!=62?'">':' finalNameSF">')+quarterfinalsplayerName[i+1]+'</h2></div>')
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
	function round32(){
		count=1;
		$('#worldcupAll').empty();
		for(let i=0;i<32;i+=2){
			const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
			shape.append('<div class="roundMain"><div class="round"><h2>${gameName } 32강 '+count+'/16</h2></div></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=30?'"':' finalImgTT" ')+'src="'+($("#roundselect").val()==32?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=30?'"':' finalImgTT" ')+'src="'+($("#roundselect").val()==32?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2 class="leftName'+(i!=30?'">':' finalNameTT">')+quarterfinalsplayerName[i]+'</h2><h2 class="rightName'+(i!=30?'">':' finalNameTT">')+quarterfinalsplayerName[i+1]+'</h2></div>')
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
			shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 16강 '+count+'/8</h2></div></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=14?'"':' finalImgST" ')+'src="'+($("#roundselect").val()==16?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=14?'"':' finalImgST" ')+'src="'+($("#roundselect").val()==16?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2 class="leftName'+(i!=14?'">':' finalNameST">')+quarterfinalsplayerName[i]+'</h2><h2 class="rightName'+(i!=14?'">':' finalNameST">')+quarterfinalsplayerName[i+1]+'</h2></div>')
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
			shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 8강 '+count+'/4</h2></div></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=6?'"':' finalImgE" ')+'src="'+($("#roundselect").val()==8?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=6?'"':' finalImgE" ')+'src="'+($("#roundselect").val()==8?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2 class="leftName'+(i!=6?'">':' finalNameE">')+quarterfinalsplayerName[i]+'</h2><h2 class="rightName'+(i!=6?'">':' finalNameE">')+quarterfinalsplayerName[i+1]+'</h2></div>')
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
			shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 4강 '+count+'/2</h2></div></div>');
			const imgsetting=$('<div class="imgSetting">')
			const firstImg=$('<img class="firstImg'+(i!=2?'"':' finalImgF" ')+'src="'+($("#roundselect").val()==4?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i]+'">')
			const secondImg=$('<img class="secondImg'+(i!=2?'"':' finalImgF" ')+'src="'+($("#roundselect").val()==4?"${path }/resources/images/game/worldcup/":"")+quarterfinalsplayerImg[i+1]+'">')
			const fight=$('<div class="fight">');
			const versus=$('<img src="${path }/resources/images/game/versus.png">');
			const name=$('<div><h2 class="leftName'+(i!=2?'">':' finalNameF">')+quarterfinalsplayerName[i]+'</h2><h2 class="rightName'+(i!=2?'">':' finalNameF">')+quarterfinalsplayerName[i+1]+'</h2></div>')
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
		shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 결승전</h2></div></div>');
		const imgsetting=$('<div class="imgSetting">')
		const firstImg=$('<img class="firstImg" src="'+quarterfinalsplayerImg[0]+'">')
		const secondImg=$('<img class="secondImg" src="'+quarterfinalsplayerImg[1]+'">')
		const fight=$('<div class="fight">');
		const versus=$('<img src="${path }/resources/images/game/versus.png">');
		const name=$('<div><h2 class="leftName finalLeft">'+quarterfinalsplayerName[0]+'</h2><h2 class="rightName finalRight">'+quarterfinalsplayerName[1]+'</h2></div>')
		imgsetting.append(firstImg);
		imgsetting.append(secondImg);
		shape.append(imgsetting);
		fight.append(versus);
		fight.append(name);
		shape.append(fight);
		$('#worldcupAll').append(shape);
	}
	
	function finalClick(){
		 $( '.firstImg,.leftName' ).click(function(e){
				$( '.firstImg' ).css({'transform':'scale(0.8)'});
		 		$( '.firstImg' ).css({'transition':'0.5s'});
		 		$( '.secondImg' ).css({'transform':'translate(200%,0)'});
		 		$( '.secondImg' ).css({'transition':'0.5s'});
		 		winnerwinnerChickemDinner($('.finalLeft').text());
		 		OTOWinner($('.finalLeft').text());
		 		$( '.fight' ).hide();
		 		$( '.round' ).hide();
		 		const finalText=$('<div class="finalLeftText" style="width:50vh;">');
		 		const winner=$('<h2>당신의 선택은</h2>');
		 		const winnerName=$('<h3>'+$(e.target).parent().next().find('div').children(":first").text()+'</h3>')
		 		const finalchoice=$('<div class="finalCenter gameChoice"><img src="${path}/resources/images/game/cupstart.png"><h3>게임 선택하러가기</h3></div><div class="finalCenter retry"><img src="${path}/resources/images/game/retry.png"><h3>다시 시도</h3></div><div class="finalCenter goRanking"><img src="${path}/resources/images/game/cuplist.png"><h3>랭킹보기</h3></div>');
		 		finalText.append(winner);
		 		finalText.append(winnerName);
		 		finalText.append(finalchoice);
		 		$('#worldcupAll').after(finalText);
		 		$(".goRanking").click(function(){
		 			location.assign("${path}/game/worldcupRanking?gameName=${gameName }&num=${num}") 
		 		});
		 		$(".retry").click(function(){
		 			location.replace("${path}/game/worldcup?gameName=${gameName }&num=${num}") 
		 		});
		 		$(".gameChoice").click(function(){
		 			location.replace('${path }/game/choice');
		 		})
		 	 })
		 	 $( '.secondImg,.rightName' ).click(function(e){
		 		$( '.secondImg' ).css({'transform':'scale(0.8)'});
		 		$( '.secondImg' ).css({'transition':'0.5s'})
		 		$( '.firstImg' ).css({'transform':'translate(-200%,0)'});
		 		$( '.firstImg' ).css({'transition':'0.5s'});
		 		winnerwinnerChickemDinner($('.finalRight').text());
		 		OTOWinner($('.finalRight').text());
		 		$( '.fight' ).hide();
		 		$( '.round' ).hide();
		 		const finalText=$('<div class="finalRightText style="width:50vh;"">');
		 		const winner=$('<h2>당신의 선택은</h2>');
		 		const winnerName=$('<h3>'+$(e.target).parent().next().find('div').children(":last").text()+'</h3>')
		 		const finalchoice=$('<div class="finalCenter gameChoice"><img src="${path}/resources/images/game/cupstart.png"><h3>게임 선택하러가기</h3></div><div class="finalCenter retry"><img src="${path}/resources/images/game/retry.png"><h3>다시 시도</h3></div><div class="finalCenter goRanking"><img src="${path}/resources/images/game/cuplist.png"><h3>랭킹보기</h3></div>');
		 		finalText.append(winner);
		 		finalText.append(winnerName);
		 		finalText.append(finalchoice);
		 		$('#worldcupAll').after(finalText);
		 		$(".goRanking").click(function(){
		 			location.assign("${path}/game/worldcupRanking?gameName=${gameName }&num=${num}");
		 		});
		 		$(".retry").click(function(){
		 			location.replace("${path}/game/worldcup?gameName=${gameName }&num=${num}");
		 		});
		 		$(".gameChoice").click(function(){
		 			location.replace('${path }/game/choice');
		 		})
		 	 })
	}
	
	function winnerwinnerChickemDinner(e){
		$.ajax({
			type : 'POST',          
		    url : '${path}/game/winnerwinnerChickemDinner',
		    dataType : 'text',
		    data : {"name" : e},
		})
		
	}
	function OTOWinner(e){
		$.ajax({
			type : 'POST',          
		    url : '${path}/game/OTOWinner',
		    dataType : 'text',
		    data : {"name" : e},
		})
	}
	
	
	
	function choiceClick(){
	 $( '.firstImg' ).click(function(e){
 		$( '.firstImg' ).css({'transform':'translate(50%,0)'});
 		$( '.firstImg' ).css({'transition':'0.5s'});
 		$( '.secondImg' ).css({'transform':'translate(200%,0)'});
 		$( '.secondImg' ).css({'transition':'0.5s'});
 		$( '.fight' ).hide();
 		OTOWinner($(e.target).parent().next().find('div').children(":first").text());
 		$(".firstImg").css({ 'pointer-events': 'none' });
 		$(".secondImg").css({ 'pointer-events': 'none' });
 		quarterfinalsplayerImg.push($(e.target).attr("src"));
 		quarterfinalsplayerName.push($(e.target).parent().next().find('div').children(":first").text());
 		setTimeout(function(){
 			$(".firstImg").css({ 'pointer-events': 'auto' });
 			$(".secondImg").css({ 'pointer-events': 'auto' });
 			$( '.firstImg' ).css({'transform':'translate(0,0)'});
 			$( '.secondImg' ).css({'transform':'translate(0,0)'});
 			$( '.worldcupStart'+(gameround+2) ).show();
 			$( '.worldcupStart'+gameround ).hide();
 			$( '.fight' ).show();
 			gameround+=2;
 		},500);
 	 })
 	 $( '.leftName').click(function(e){
 		$( '.firstImg' ).css({'transform':'translate(50%,0)'});
 		$( '.firstImg' ).css({'transition':'0.5s'});
 		$( '.secondImg' ).css({'transform':'translate(200%,0)'});
 		$( '.secondImg' ).css({'transition':'0.5s'});
 		$( '.fight' ).hide();
 		OTOWinner($(e.target).text());
 		$(".firstImg").css({ 'pointer-events': 'none' });
 		$(".secondImg").css({ 'pointer-events': 'none' });
 		quarterfinalsplayerImg.push($(e.target).parent().parent().parent().find('.imgSetting').find('.firstImg').attr("src"));
 		quarterfinalsplayerName.push($(e.target).text());
 		setTimeout(function(){
 			$(".firstImg").css({ 'pointer-events': 'auto' });
 			$(".secondImg").css({ 'pointer-events': 'auto' });
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
 		$(".firstImg").css({ 'pointer-events': 'none' });
 		$(".secondImg").css({ 'pointer-events': 'none' });
 		$( '.fight' ).hide();
 		OTOWinner($(e.target).parent().next().find('div').children(":last").text());
 		quarterfinalsplayerImg.push($(e.target).attr("src"));
 		quarterfinalsplayerName.push($(e.target).parent().next().find('div').children(":last").text());
 		setTimeout(function(){
 			$(".firstImg").css({ 'pointer-events': 'auto' });
 			$(".secondImg").css({ 'pointer-events': 'auto' });
 			$( '.firstImg' ).css({'transform':'translate(0,0)'});
 			$( '.secondImg' ).css({'transform':'translate(0,0)'});
 			$( '.worldcupStart'+(gameround+2) ).show();
 			$('.worldcupStart'+gameround ).hide();
 			$( '.fight' ).show();
 			gameround+=2;
 		},500);
 	 })
 	 $( '.rightName').click(function(e){
 		 $( '.secondImg' ).css({'transform':'translate(-50%,0)'});
 		 $( '.secondImg' ).css({'transition':'0.5s'});
 		$( '.firstImg' ).css({'transform':'translate(-200%,0)'});
 		$( '.firstImg' ).css({'transition':'0.5s'});
 		$(".firstImg").css({ 'pointer-events': 'none' });
 		$(".secondImg").css({ 'pointer-events': 'none' });
 		$( '.fight' ).hide();
 		OTOWinner($(e.target).text());
 		quarterfinalsplayerImg.push($(e.target).parent().parent().parent().find('.imgSetting').find('.secondImg').attr("src"));
 		quarterfinalsplayerName.push($(e.target).text());
 		setTimeout(function(){
 			$(".firstImg").css({ 'pointer-events': 'auto' });
 			$(".secondImg").css({ 'pointer-events': 'auto' });
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
	
<script>
function roundvideo32(){
	count=1;
	$('#worldcupAll').empty();
	for(let i=0;i<32;i+=2){
		const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
		shape.append('<div class="roundMain"><div class="round"><h2>${gameName } 32강 '+count+'/16</h2></div></div>');
		const imgsetting=$('<div class="videoSetting">')
		const firstImg=$('<iframe class="firstVideo" src="'+quarterfinalsplayerImg[i]+'" frameborder="0" loading = "lazy">')
		const secondImg=$('<iframe class="secondVideo" src="'+quarterfinalsplayerImg[i+1]+'" frameborder="0" loading = "lazy">')
		const fight=$('<div class="videofight">');
		const versus=$('<img src="${path }/resources/images/game/versus.png">');
		const name=$('<div><h2 class="leftName">'+quarterfinalsplayerName[i]+'</h2><h2 class="rightName">'+quarterfinalsplayerName[i+1]+'</h2></div>')
		const choice=$('<div class="choicemain"><div class="leftchoice' +(i!=30?'"':' leftchoiceTT" ')+'>선택</div><div class="rightchoice' +(i!=30?'"':' rightchoiceTT" ')+'>선택</div><div>')
		imgsetting.append(firstImg);
		imgsetting.append(secondImg);
		shape.append(imgsetting);
		fight.append(versus);
		fight.append(name);
		shape.append(fight);
		shape.append(choice);
		$('#worldcupAll').append(shape);
		count++;
	}
}
function roundvideo16(){
	$('#worldcupAll').empty();
	count=1;
	for(let i=0;i<16;i+=2){
		const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
		shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 16강 '+count+'/8</h2></div></div>');
		const imgsetting=$('<div class="imgSetting">')
		const firstImg=$('<iframe class="firstVideo" src="'+quarterfinalsplayerImg[i]+'" frameborder="0" loading = "lazy">')
		const secondImg=$('<iframe class="secondVideo" src="'+quarterfinalsplayerImg[i+1]+'" frameborder="0" loading = "lazy">')
		const fight=$('<div class="videofight">');
		const versus=$('<img src="${path }/resources/images/game/versus.png">');
		const name=$('<div><h2 class="leftName">'+quarterfinalsplayerName[i]+'</h2><h2 class="rightName">'+quarterfinalsplayerName[i+1]+'</h2></div>')
		const choice=$('<div class="choicemain"><div class="leftchoice' +(i!=14?'"':' leftchoiceST" ')+'>선택</div><div class="rightchoice' +(i!=14?'"':' rightchoiceST" ')+'>선택</div><div>')
		imgsetting.append(firstImg);
		imgsetting.append(secondImg);
		shape.append(imgsetting);
		fight.append(versus);
		fight.append(name);
		shape.append(fight);
		shape.append(choice);
		$('#worldcupAll').append(shape);
		count++;
	}
} 

function roundvideo8(){
	$('#worldcupAll').empty();
	count=1;
	for(let i=0;i<8;i+=2){
		const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
		shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 8강 '+count+'/4</h2></div></div>');
		const imgsetting=$('<div class="imgSetting">')
		const firstImg=$('<iframe class="firstVideo" src="'+quarterfinalsplayerImg[i]+'" frameborder="0" loading = "lazy">')
		const secondImg=$('<iframe class="secondVideo" src="'+quarterfinalsplayerImg[i+1]+'" frameborder="0" loading = "lazy">')
		const fight=$('<div class="videofight">');
		const versus=$('<img src="${path }/resources/images/game/versus.png">');
		const name=$('<div><h2 class="leftName">'+quarterfinalsplayerName[i]+'</h2><h2 class="rightName">'+quarterfinalsplayerName[i+1]+'</h2></div>')
		const choice=$('<div class="choicemain"><div class="leftchoice' +(i!=6?'"':' leftchoiceE" ')+'>선택</div><div class="rightchoice' +(i!=6?'"':' rightchoiceE" ')+'>선택</div><div>')
		imgsetting.append(firstImg);
		imgsetting.append(secondImg);
		shape.append(imgsetting);
		fight.append(versus);
		fight.append(name);
		shape.append(fight);
		shape.append(choice);
		$('#worldcupAll').append(shape);
		count++;
	}
}
function roundvideo4(){
	$('#worldcupAll').empty();
	count=1;
	for(let i=0;i<4;i+=2){
		const shape=$('<div class="worldcupStart'+i+(i==0?'">':'" style="display:none;">'));
		shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 4강 '+count+'/2</h2></div></div>');
		const imgsetting=$('<div class="imgSetting">')
		const firstImg=$('<iframe class="firstVideo" src="'+quarterfinalsplayerImg[i]+'" frameborder="0" loading = "lazy">')
		const secondImg=$('<iframe class="secondVideo" src="'+quarterfinalsplayerImg[i+1]+'" frameborder="0" loading = "lazy">')
		const fight=$('<div class="videofight">');
		const versus=$('<img src="${path }/resources/images/game/versus.png">');
		const name=$('<div><h2 class="leftName">'+quarterfinalsplayerName[i]+'</h2><h2 class="rightName">'+quarterfinalsplayerName[i+1]+'</h2></div>')
		const choice=$('<div class="choicemain"><div class="leftchoice' +(i!=2?'"':' leftchoiceF" ')+'>선택</div><div class="rightchoice' +(i!=2?'"':' rightchoiceF" ')+'>선택</div><div>')
		imgsetting.append(firstImg);
		imgsetting.append(secondImg);
		shape.append(imgsetting);
		fight.append(versus);
		fight.append(name);
		shape.append(fight);
		shape.append(choice);
		$('#worldcupAll').append(shape);
		count++;
	}
}
function roundvideo2(){
	$('#worldcupAll').empty();
	const shape=$('<div class="worldcupStart">');
	shape.append('<div class="roundMain"><div class="round"><h2>${gameName} 결승전</h2></div></div>');
	const imgsetting=$('<div class="imgSetting">')
	const firstImg=$('<iframe class="firstVideo" src="'+quarterfinalsplayerImg[0]+'" frameborder="0" loading = "lazy">')
	const secondImg=$('<iframe class="secondVideo" src="'+quarterfinalsplayerImg[1]+'" frameborder="0" loading = "lazy">')
	const fight=$('<div class="videofight">');
	const versus=$('<img src="${path }/resources/images/game/versus.png">');
	const name=$('<div><h2 class="leftName finalLeft">'+quarterfinalsplayerName[0]+'</h2><h2 class="rightName finalRight">'+quarterfinalsplayerName[1]+'</h2></div>')
	const choice=$('<div class="choicemain"><div class="leftchoice">선택</div><div class="rightchoice">선택</div><div>')
	imgsetting.append(firstImg);
	imgsetting.append(secondImg);
	shape.append(imgsetting);
	fight.append(versus);
	fight.append(name);
	shape.append(fight);
	shape.append(choice);
	$('#worldcupAll').append(shape);
}

function choiceClickVideo(){
	 $( '.leftchoice' ).click(function(e){
		$( '.firstVideo' ).css({'transform':'translate(50%,0)'});
		$( '.firstVideo' ).css({'transition':'0.5s'});
		$( '.secondVideo' ).css({'transform':'translate(200%,0)'});
		$( '.secondVideo' ).css({'transition':'0.5s'});
		$( '.videofight' ).hide();
		$( '.choicemain' ).hide();
		OTOWinner($(e.target).parent().parent().find('.leftName').text());
		$(".leftchoice").css({ 'pointer-events': 'none' });
		$(".rightchoice").css({ 'pointer-events': 'none' });
		quarterfinalsplayerImg.push($(e.target).parent().parent().find('.firstVideo').attr('src'));
		quarterfinalsplayerName.push($(e.target).parent().parent().find('.leftName').text());  
		setTimeout(function(){
			$(".leftchoice").css({ 'pointer-events': 'auto' });
			$(".rightchoice").css({ 'pointer-events': 'auto' });
			$( '.firstVideo' ).css({'transform':'translate(0,0)'});
			$( '.secondVideo' ).css({'transform':'translate(0,0)'});
			$( '.worldcupStart'+(gameround+2) ).show();
			$( '.worldcupStart'+gameround ).hide();
			$( '.videofight' ).show();
			$( '.choicemain' ).show();
			setTimeout(function(){
				$(e.target).parent().parent().find('.firstVideo').attr('src','');
				$(e.target).parent().parent().find('.secondVideo').attr('src','');
			},100)
			gameround+=2;
		},500); 
	 })
	 $( '.rightchoice' ).click(function(e){
		$( '.secondVideo' ).css({'transform':'translate(-50%,0)'});
		$( '.secondVideo' ).css({'transition':'0.5s'});
		$( '.firstVideo' ).css({'transform':'translate(-200%,0)'});
		$( '.firstVideo' ).css({'transition':'0.5s'});
		$(".leftchoice").css({ 'pointer-events': 'none' });
		$(".rightchoice").css({ 'pointer-events': 'none' });
		$( '.videofight' ).hide();
		$( '.choicemain' ).hide();
		OTOWinner($(e.target).parent().parent().find('.rightName').text()); 
		quarterfinalsplayerImg.push($(e.target).parent().parent().find('.secondVideo').attr('src'));
		quarterfinalsplayerName.push($(e.target).parent().parent().find('.rightName').text());
		setTimeout(function(){
			$(".leftchoice").css({ 'pointer-events': 'auto' });
			$(".rightchoice").css({ 'pointer-events': 'auto' });
			$( '.firstVideo' ).css({'transform':'translate(0,0)'});
			$( '.secondVideo' ).css({'transform':'translate(0,0)'});
			$( '.worldcupStart'+(gameround+2) ).show();
			$('.worldcupStart'+gameround ).hide();
			$( '.videofight' ).show();
			$( '.choicemain' ).show();
			setTimeout(function(){
				$(e.target).parent().parent().find('.firstVideo').attr('src','');
				$(e.target).parent().parent().find('.secondVideo').attr('src','');
			},100)
			gameround+=2;
		},500);
	 })

	}
function finalClickVideo(){
	 $( '.leftchoice' ).click(function(e){
			$( '.firstVideo' ).css({'transform':'scale(0.8)'});
	 		$( '.firstVideo' ).css({'transition':'0.5s'});
	 		$( '.secondVideo' ).css({'transform':'translate(200%,0)'});
	 		$( '.secondVideo' ).css({'transition':'0.5s'});
	 		winnerwinnerChickemDinner($(e.target).parent().parent().find('.leftName').text());
	 		OTOWinner($(e.target).parent().parent().find('.leftName').text());
	 		$( '.videofight' ).hide();
	 		$( '.choicemain' ).hide();
	 		$( '.round' ).hide();
	 		const finalText=$('<div class="finalLeftText" style="width:50vh;">');
	 		const winner=$('<h2>당신의 선택은</h2>');
	 		const winnerName=$('<h3>'+$(e.target).parent().parent().find('.leftName').text()+'</h3>')
	 		const finalchoice=$('<div class="finalCenter gameChoice"><img src="${path}/resources/images/game/cupstart.png"><h3>게임 선택하러가기</h3></div><div class="finalCenter retry"><img src="${path}/resources/images/game/retry.png"><h3>다시 시도</h3></div><div class="finalCenter goRanking"><img src="${path}/resources/images/game/cuplist.png"><h3>랭킹보기</h3></div>');
	 		finalText.append(winner);
	 		finalText.append(winnerName);
	 		finalText.append(finalchoice);
	 		$('#worldcupAll').after(finalText);
	 		$(".goRanking").click(function(){
	 			location.assign("${path}/game/worldcupRanking?gameName=${gameName }&num=${num}") 
	 		});
	 		$(".retry").click(function(){
	 			location.replace("${path}/game/worldcup?gameName=${gameName }&num=${num}") 
	 		});
	 		$(".gameChoice").click(function(){
	 			location.replace('${path }/game/choice');
	 		})
	 		setTimeout(function(){
				$(e.target).parent().parent().find('.secondVideo').attr('src','');
			},100)
	 	 })
	 	 $( '.rightchoice' ).click(function(e){
	 		$( '.secondVideo' ).css({'transform':'scale(0.8)'});
	 		$( '.secondVideo' ).css({'transition':'0.5s'})
	 		$( '.firstVideo' ).css({'transform':'translate(-200%,0)'});
	 		$( '.firstVideo' ).css({'transition':'0.5s'});
	 		winnerwinnerChickemDinner($(e.target).parent().parent().find('.rightName').text());
	 		OTOWinner($(e.target).parent().parent().find('.rightName').text()); 
	 		$( '.videofight' ).hide();
	 		$( '.choicemain' ).hide();
	 		$( '.round' ).hide();
	 		const finalText=$('<div class="finalRightText style="width:50vh;"">');
	 		const winner=$('<h2>당신의 선택은</h2>');
	 		const winnerName=$('<h3>'+$(e.target).parent().parent().find('.rightName').text()+'</h3>')
	 		const finalchoice=$('<div class="finalCenter gameChoice"><img src="${path}/resources/images/game/cupstart.png"><h3>게임 선택하러가기</h3></div><div class="finalCenter retry"><img src="${path}/resources/images/game/retry.png"><h3>다시 시도</h3></div><div class="finalCenter goRanking"><img src="${path}/resources/images/game/cuplist.png"><h3>랭킹보기</h3></div>');
	 		finalText.append(winner);
	 		finalText.append(winnerName);
	 		finalText.append(finalchoice);
	 		$('#worldcupAll').after(finalText);
	 		$(".goRanking").click(function(){
	 			location.assign("${path}/game/worldcupRanking?gameName=${gameName }&num=${num}");
	 		});
	 		$(".retry").click(function(){
	 			location.replace("${path}/game/worldcup?gameName=${gameName }&num=${num}");
	 		});
	 		$(".gameChoice").click(function(){
	 			location.replace('${path }/game/choice');
	 		})
	 		setTimeout(function(){
				$(e.target).parent().parent().find('.firstVideo').attr('src','');
			},100)
	 	 })
}

</script>
	<!-------------------------------------------->
</body>
</html>
