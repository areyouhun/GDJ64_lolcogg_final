function type() {
	let typingBool = false;
	let typingIdx = 0;

	// 타이핑될 텍스트를 가져온다 
	let typingTxt = $(".typing-txt").text();

	typingTxt = typingTxt.split(""); // 한글자씩 자른다. 

	if (typingBool == false) {
		// 타이핑이 진행되지 않았다면 
		typingBool = true;
		var tyInt = setInterval(typing, 30); // 반복동작 
	}

	function typing() {
		if (typingIdx < typingTxt.length) {
			// 타이핑될 텍스트 길이만큼 반복 
			$(".typing").append(typingTxt[typingIdx]);
			// 한글자씩 이어준다. 
			typingIdx++;
		} else {
			//끝나면 반복종료 
			clearInterval(tyInt);
		}
	}
}


window.onload = function() {
	$('#choiceGameBack').attr("src", path+"/resources/images/game/choiceGameBack" + Math.floor(Math.random() * 7) + ".gif");
}

$(function() {
	const worldcup = $('#worldcup');
	const adventure = $('#adventure');
	const gameTitle = $('#gameTitle');
	const adventureGame = $('#adventureGame');
	const worldCupGame = $('#worldCupGame');
	const worldCupPlay = $('#worldCupPlay');
	const adventurePlay = $('#adventurePlay');
	$('.switch').click(function(e) {
		if (worldcup.css('display') == "none") {
			worldcup.show();
			adventure.hide();
		} else {
			adventure.show();
			worldcup.hide();
		}

	});
	$('#adventureStart').click(function(e) {
		gameTitle.hide();
		adventureGame.addClass('load')
		adventureGame.show();;
		$('body').css("overflow", "hidden")
		setTimeout(function() {
			$('body').css("overflow-y", "scroll")
			adventurePlay.show();
		}, 2000);
		setTimeout(function() {
			let choice = 0;
			let count = 0;
			$('#adimg2').css('transform', 'scaleX(-1)');
			$('#adimg1').css('transform', 'scaleX(-1)');
			type();
			var typingTxt = $(".typing-txt").text();
			typingTxt = typingTxt.split("");
			var audio = new Audio(path+"/resources/audio/adventure/1.Keyboard Typing by seth-m Id-269713.wav");
			audio.load();
			audio.volume = 0.5;
			audio.play();
			audio.loop = true;
			var audio2 = new Audio(path+"/resources/audio/adventure/rogeuin-hwamyeon.wav");
			audio2.load();
			audio2.volume = 0.08;
			audio2.loop = true;
			audio2.play();
			var audio3 = new Audio(path+"/resources/audio/adventure/실내 웅성웅성BG.wav");
			audio3.load();
			audio3.volume = 1;
			var audio7 = new Audio(path+"/resources/audio/adventure/MP_Shotgun Blast.mp3");
			audio7.load();
			audio7.volume = 0.2;
			var audio8 = new Audio(path+"/resources/audio/adventure/MP_갱플랭크 스킬 QProceed 3028.wav");
			audio8.load();
			audio8.volume = 0.4;
			var audio10 = new Audio(path+"/resources/audio/adventure/MP_Gun Loud.mp3");
			audio10.load();
			audio10.volume = 0.2;
			$('#sound').click(function() {
				audio2.pause();
				$('#mute').show();
				$('#sound').hide();
			})
			$('#mute').click(function() {
				audio2.play();
				$('#sound').show();
				$('#mute').hide();
			})
			setTimeout(function() {
				audio.pause();
				$('#adarrow').show();
			}, typingTxt.length * 40)
			$('.adarrow').click(function() {
				if (count == 0) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('갱플포로가 아직 이 마을에 있다는 소문이 있던데 찾아봐야겠어')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
					count++;
				} else if (count == 1) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('일단 마을로 가보자!')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
					count++;
				} else if (count == 2) {
					$('#adarrow').hide();
					$('#admap').attr("src", path+"/resources/images/game/adventure/빌지워터마을.jpg");
					$('.typing').text('');
					$('.typing-txt').text('저분이 그 유명한 미스포로인가');
					type();
					audio.play();
					audio.loop = true;
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						$('#adarrow').show();
						audio.pause();
						count++;
					}, typingTxt.length * 40)
				} else if (count == 3) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('#adimg1').show();
					$('#namead').text('미스포로')
					$('.typing').text('');
					$('.typing-txt').text('이 마을에서 처음보는 사람 같은데 무슨일이지?');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
					count++;
				} else if (count == 4) {
					audio.play();
					audio.loop = true;
					$('#adimg1').hide();
					$('#adarrow').hide();
					$('#namead').text('김포로');
					$('.typing').text('');
					$('.typing-txt').text('갱플포로를 찾고 있는데 혹시 어디있는지 아시나요?');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
					count++;
				} else if (count == 5) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('#adimg1').show();
					$('#namead').text('미스포로');
					$('.typing').text('');
					$('.typing-txt').text('뭐? 갱플포로? 입 조심해 꼬맹아, 꺼저버려');
					var audio4 = new Audio(path+"/resources/audio/adventure/MP_미스 포츈 도발 4198.wav");
					audio4.load();
					audio4.volume = 0.5;
					audio4.play();
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						audio.pause();
						setTimeout(function() {
							$('#adimg1').hide();
							$('#admap').css('opacity', '0.7')
							$('#adchoice').show();
						}, 500)
					}, typingTxt.length * 40)
					count++;
				} else if (count == 100) {
					audio.play();
					audio.loop = true;
					$('#adimg1').hide();
					$('#adarrow').hide();
					$('#namead').text('김포로');
					$('.typing').text('');
					$('.typing-txt').text('죄송합니다. 선원자리가 비어있다면 제가 들어갈 수 있을까요?');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 101;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 101) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('#adimg1').show();
					$('#namead').text('미스포로')
					$('.typing').text('');
					$('.typing-txt').text('오늘은 결전의 날이다. 나의 고기방패가 되면 허락하지');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 102;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 102) {
					audio.play();
					audio.loop = true;
					$('#adimg1').hide();
					$('#adarrow').hide();
					$('#namead').text('김포로');
					$('.typing').text('');
					$('.typing-txt').text('고기방패가 되겠습니다!');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 103;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 103) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('#adimg1').show();
					$('#namead').text('미스포로')
					$('.typing').text('');
					$('.typing-txt').text('그래, 나한테 거짓말생각은 안하는게 좋을거야');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 104;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 104) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('계획을 알려주지');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 105;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 105) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('갱플포로는 쉽게 모습을 드러내지 않아');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 106;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 106) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('그래서 내가 손을 좀 써놓았지');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 107;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 107) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('트페포로에게 갱플포로의 작업장에서 물건을 훔쳐오라고 의뢰를 했어.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 108;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 108) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('그곳에 트페포로에게 복수를 하고싶은 그브포로를 보냈지');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 109;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 109) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('그 둘은 그곳을 엉망으로 만들거야');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 110;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 110) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('그 둘은 갱플포로 부하들만으로는 감당이 안될꺼야');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 111;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 111) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('작업장을 끔찍히도 아끼는 갱플포로는 그곳에 나타날 수 밖에 없어');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 112;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 112) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('우리는 상황을 봐서 갱플포로의 목숨을 노릴거다');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 113;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 113) {
					audio.play();
					audio.loop = true;
					$('#adimg1').hide();
					$('#adarrow').hide();
					$('#namead').text('김포로');
					$('.typing').text('');
					$('.typing-txt').text('선장님은 왜 갱플포로를 잡으려 하나요?');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 114;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 114) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('#adimg1').show();
					$('#namead').text('미스포로')
					$('.typing').text('');
					$('.typing-txt').text('내 부모가 그녀석때문에 죽었다. 더이상은 묻지 말아라');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 115;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 115) {
					audio.play();
					audio.loop = true;
					$('#admap').attr("src", path+"/resources/images/game/adventure/그브트페싸움.jpg");
					$('#adarrow').hide();
					$('#adimg1').hide();
					$('#namead').text('')
					$('.typing').text('');
					$('.typing-txt').text('우리는 그렇게 갱플포로의 작업장으로 갔다');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 116;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 116) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('역시나 그브포로와 트페포로는 싸우고 있었다');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 117;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 117) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('갱플포로 역시 등장했지만 주위의 부하들로 틈이 없었다');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 118;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 118) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('#admap').attr("src", path+"/resources/images/game/adventure/학살의부두.png");
					$('.typing-txt').text('그브포로는 학살의 부두로 도망을 치고 갱플포로는 이를 따라갔다.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 600;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (count == 200) {
					audio.play();
					audio.loop = true;
					$('#namead').text('김포로');
					$('.twoclick').hide();
					audio3.pause();
					$('.typing').text('');
					$('.typing-txt').text('주점에서 싸움난건가? 왜들 모여있지 구경해 봐야지')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
					count++;
				} else if (count == 201) {
					audio.play();
					audio.loop = true;
					$('#namead').text('그브포로');
					$('#adarrow').hide();
					$('#admap').attr("src", path+"/resources/images/game/adventure/그브트페싸움.jpg");
					$('#adimg4').show();
					$('.twoclick').hide();
					var audio5 = new Audio(path+"/resources/audio/adventure/MP_그레이브즈 도발 CA87 (mp3cut.net).wav");
					audio5.load();
					audio5.volume = 0.4;
					audio5.play();
					$('.typing').text('');
					$('.typing-txt').text('트페!!!!!! 늙어 죽는게 소원은 아니었길')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
					count++;
				} else if (count == 202) {
					audio.play();
					audio.loop = true;
					$('#namead').text('트페포로');
					$('#adimg4').hide();
					$('#adimg3').show();
					$('#adarrow').hide();
					var audio6 = new Audio(path+"/resources/audio/adventure/트위스티드 페이트 한국어 음성 (mp3cut.net).wav");
					audio6.load();
					audio6.volume = 0.4;
					audio6.play();
					$('.typing').text('');
					$('.typing-txt').text('진정 하라고 친구, 우리 말로 해결을 보자고')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					$('#oneclick').text('말린다')
					$('#twoclick').text('지켜본다')
					setTimeout(function() {
						audio.pause();
						setTimeout(function() {
							choice = 200;
							$('#adimg3').hide();
							$('#admap').css('opacity', '0.7')
							$('#adchoice').show();
						}, 500)
					}, typingTxt.length * 40)
				} else if (count == 203) {
					audio.play();
					audio.loop = true;
					$('#namead').text('트페포로');
					$('#adimg4').hide();
					$('#adimg3').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('총은 치우자. 응? 우리 친구잖아')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 204;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 204) {
					audio.play();
					audio.loop = true;
					$('#namead').text('그브포로');
					$('#adimg3').hide();
					$('#adimg4').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('보통사람이었으면 미쳐버리고 남았어. 네놈에게 복수하겠다는 의지 하나로 버틴 거다.')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 205;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 205) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('날 얼마에 팔아넘긴 거냐?')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 206;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 206) {
					audio.play();
					audio.loop = true;
					$('#namead').text('트페포로');
					$('#adimg4').hide();
					$('#adimg3').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('얘기하기 싫은 건 아닌데, 다른 적당한 때가 있지 않을까?')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 207;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 207) {
					$('#namead').text('');
					$('#adimg4').hide();
					$('#adimg3').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('탕!');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					audio7.play();
					setTimeout(function() {
						count = 208;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 208) {
					audio.play();
					audio.loop = true;
					$('#namead').text('트페포로');
					$('#adimg3').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('정신 나갔어?, 너 진짜 이럴 거야?')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 209;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 209) {
					audio.play();
					audio.loop = true;
					$('#namead').text('그브포로');
					$('#adimg3').hide();
					$('#adimg4').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('이번엔 내빼지 못할 거다. 절대로')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					$('#oneclick').text('이곳에서 도망치기')
					$('#twoclick').text('남아서 구경하기')
					setTimeout(function() {
						audio7.play();
						audio.pause();
						setTimeout(function() {
							choice = 300;
							$('#adimg3').hide();
							$('#admap').css('opacity', '0.7')
							$('#adchoice').show();
						}, 500)
					}, typingTxt.length * 40)
				} else if (count == 299) {
					audio.play();
					audio.loop = true;
					$('#adchoice').hide();
					$('#namead').text('갱플포로');
					$('#adimg2').show();
					$('#adarrow').hide();
					$('.typing').text('');
					audio8.play();
					$('.typing-txt').text('내 작업장에서 무슨짓이야!!!!!')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 300;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 300) {
					audio.play();
					audio.loop = true;
					$('#namead').text('트페포로');
					$('#adimg3').show();
					$('#adimg2').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('일단은 같이 빠져나가자. 복수는 그다음에 생각해. 제발')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 301;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 301) {
					audio.play();
					audio.loop = true;
					$('#namead').text('그브포로');
					$('#adimg3').hide();
					$('#adimg4').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('네놈을 믿느니 성을 갈겠다.')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 302;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 302) {
					audio.play();
					audio.loop = true;
					$('#namead').text('갱플포로');
					$('#adimg3').hide();
					$('#adimg4').hide();
					$('#adimg2').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('이놈들 쉽게 죽여주진 않겠다.');
					var audio9 = new Audio(path+"/resources/audio/adventure/MP_갱플랭크 MoveOrder2D 9EA9.wav");
					audio9.load();
					audio9.volume = 0.4;
					audio9.play();
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 303;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 303) {
					audio.play();
					audio.loop = true;
					$('#namead').text('트페포로');
					$('#adimg3').show();
					$('#adimg2').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('나 먼저 갈게, 살아서 만나');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 304;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 304) {
					audio.play();
					audio.loop = true;
					$('#namead').text('');
					$('#adimg3').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('갑자기 빛나는 카드가 날아가더니 트페포로는 사라졌다.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 305;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 305) {
					audio.play();
					audio.loop = true;
					$('#namead').text('그브포로');
					$('#adimg4').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('이녀석 또 배신이라니')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 306;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 306) {
					audio.play();
					audio.loop = true;
					$('#namead').text('');
					$('#adimg4').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('그브포로는 도망가기 시작했고 갱플포로는 그 뒤를 쫒았다.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					$('#oneclick').text('따라가기');
					$('#twoclick').text('남아있기');
					setTimeout(function() {
						audio.pause();
						setTimeout(function() {
							choice = 400;
							$('#admap').css('opacity', '0.7')
							$('#adchoice').show();
						}, 500)
					}, typingTxt.length * 40)
				} else if (count == 500) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('누구세요? 놔주세요 전 아무짓도 안했어요!')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 501;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 501) {
					audio.play();
					audio.loop = true;
					$('#namead').text('');
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('작업장에 남아있던 김포로는 갱플포로의 부하들에게 잡혀 감옥에 들어가 고문을 당했다.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 502;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 502) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('수년간... 끔찍하게... THE END................');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					$('#oneclick').text('다시하기');
					$('#twoclick').text('게임선택으로');
					setTimeout(function() {
						audio.pause();
						setTimeout(function() {
							choice = 500;
							$('#admap').css('opacity', '0.7')
							$('#adchoice').show();
						}, 500)
					}, typingTxt.length * 40)
				} else if (count == 600) {
					audio.play();
					audio.loop = true;
					$('#namead').text('갱플포로');
					$('#adimg2').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('실력하난 좋은 것 같은데')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 601;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 601) {
					audio.play();
					audio.loop = true;
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('내 부하가 되면 목숨만은 살려주지')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 602;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 602) {
					audio.play();
					audio.loop = true;
					$('#namead').text('그브포로');
					$('#adimg2').hide();
					$('#adimg4').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('무슨 말 같지도 않은 소리를')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 603;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 603) {
					audio.play();
					audio.loop = true;
					$('#namead').text('');
					$('#adarrow').hide();
					$('#adimg4').hide();
					$('.typing').text('');
					$('.typing-txt').text('그브포로가 연막탄을 사용하여 모두의 시야를 가렸다.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 604;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 604) {
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('탕!');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					audio10.play();
					setTimeout(function() {
						count = 605;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 605) {
					audio.play();
					audio.loop = true;
					$('#namead').text('미스포로');
					$('#adimg1').show();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('드디어 복수의 시간이다.')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 606;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 606) {
					audio.play();
					audio.loop = true;
					$('#namead').text('갱플포로');
					$('#adimg2').show();
					$('#adimg1').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('쓰레기같은 놈들')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 607;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (count == 607) {
					audio.play();
					audio.loop = true;
					$('#namead').text('');
					$('#adarrow').hide();
					$('#adimg2').hide();
					$('.typing').text('');
					$('.typing-txt').text('다음편에 계속 To Be Continued...');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					$('#oneclick').text('다시하기');
					$('#twoclick').text('게임선택으로');
					setTimeout(function() {
						audio.pause();
						setTimeout(function() {
							choice = 500;
							$('#admap').css('opacity', '0.7')
							$('#adchoice').show();
						}, 500)
					}, typingTxt.length * 40)
				}
			})


			$('#oneclick').click(function() {
				if (choice == 0) {
					$('#admap').css('opacity', '1');
					audio.play();
					audio.loop = true;
					$('#adchoice').hide();
					$('#adimg1').show();
					$('#namead').text('미스포로');
					$('.typing').text('');
					$('.typing-txt').text('왜 날 따라오는거지?')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						$('#adarrow').show();
						count = 100;
						audio.pause();
					}, typingTxt.length * 40)
				} else if (choice == 200) {
					audio.play();
					audio.loop = true;
					$('#adchoice').hide();
					$('#admap').css('opacity', '1');
					$('#adchoice').hide();
					$('.typing').text('');
					$('#namead').text('');
					$('.typing-txt').text('김포로는 말리려다 총을 대신 맞아버렸다... THE END................')
					audio7.play();
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					$('#oneclick').text('다시하기');
					$('#twoclick').text('게임선택으로');
					setTimeout(function() {
						audio.pause();
						setTimeout(function() {
							choice = 500;
							$('#admap').css('opacity', '0.7')
							$('#adchoice').show();
						}, 500)
					}, typingTxt.length * 40)
				} else if (choice == 400) {
					audio.play();
					audio.loop = true;
					$('#admap').css('opacity', '1')
					$('#adchoice').hide();
					$('#admap').attr("src", path+"/resources/images/game/adventure/학살의부두.png");
					$('.typing').text('');
					$('#namead').text('김포로');
					$('.typing-txt').text('갱플포로를 드디어 봤는데, 잡을 수가 없다.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 600;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (choice == 500) {
					audio.play();
					audio.loop = true;
					$('#admap').css('opacity', '1')
					$('#adchoice').hide();
					$('#admap').attr("src", path+"/resources/images/game/adventure/빌지워터.png");
					$('.typing').text('');
					$('#namead').text('김포로');
					$('#oneclick').text('따라간다')
					$('#twoclick').text('다른 곳을 둘러본다')
					$('.typing-txt').text('여기는 빌지워터, 현상수배범과 현상금 사냥꾼들이 넘쳐나는 도시이다.');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						choice = 0;
						count = 0;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (choice == 300) {
					audio.play();
					audio.loop = true;
					$('#adchoice').hide();
					$('#admap').css('opacity', '1');
					$('#namead').text('');
					$('#adimg4').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					$('.typing-txt').text('도망가려 했으나 갱플포로의 부하들이 들어와 도망치지 못했다.')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 299;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				}
			})
			$('#twoclick').click(function() {
				if (choice == 0) {
					$('#admap').css('opacity', '1');
					$('#adchoice').hide();
					$('.typing').text('');
					$('#namead').text('');
					audio3.play();
					audio3.loop = true;
					$('.typing-txt').text('웅성웅성웅성웅성웅성웅성')
					typingTxt = $(".typing-txt").text();
					type();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						$('#adarrow').show();
						count = 200;
					}, typingTxt.length * 40)
				} else if (choice == 200) {
					audio.play();
					audio.loop = true;
					$('#adchoice').hide();
					$('#admap').css('opacity', '1');
					$('#adchoice').hide();
					$('.typing').text('');
					$('#adimg4').show();
					$('#namead').text('그브포로');
					$('.typing-txt').text('대체 왜 날 배신한거야, 사람이 수용소에서 십 년을 썩으면 어떻게 되는지 알아? 아냐고!')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 203;
						$('#adarrow').show();
						audio.pause();
					}, typingTxt.length * 40)
				} else if (choice == 500) {
					location.replace(path+'/game/choice');
				} else if (choice == 300) {
					audio.play();
					audio.loop = true;
					$('#adchoice').hide();
					$('#admap').css('opacity', '1');
					$('#namead').text('갱플포로');
					$('#adimg2').show();
					$('#adimg4').hide();
					$('#adarrow').hide();
					$('.typing').text('');
					audio8.play();
					$('.typing-txt').text('내 작업장에서 무슨짓이야!!!!!')
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 300;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				} else if (choice == 400) {
					audio.play();
					audio.loop = true;
					$('#adchoice').hide();
					$('#admap').css('opacity', '1');
					$('#namead').text('김포로');
					$('.typing').text('');
					$('.typing-txt').text('여기가 갱플포로에 작업장이였다니');
					type();
					typingTxt = $(".typing-txt").text();
					typingTxt = typingTxt.split("");
					setTimeout(function() {
						count = 500;
						audio.pause();
						$('#adarrow').show();
					}, typingTxt.length * 40)
				}
			})

		}, 2900)
	})
	$('#worldcupStart').click(function(e) {
		gameTitle.hide();
		worldCupGame.addClass('load')
		$('body').css("overflow", "hidden")
		worldCupGame.show();;
		setTimeout(function() {
			worldCupPlay.show();
			$('body').css("overflow-y", "scroll")
		}, 2000);
	})

	$(".goGame").click(function(e) {
		const name = $(e.target).parent().parent().parent().find('.gameName').text();
		let num = 0;
		switch (name) {
			case "LCK 롤 프로게이머 월드컵": num = 1; break;
			case "LOL 롤 스킨 월드컵": num = 2; break;
			case "LOL 롤 챔피언 월드컵": num = 3; break;
			case "LOL 롤 BGM 음악 월드컵": num = 4; break;
		}
		window.open(path+"/game/worldcup?gameName=" + name + "&num=" + num)
	});
	$(".goRanking").click(function(e) {
		const name = $(e.target).parent().parent().parent().find('.gameName').text();
		let num = 0;
		switch (name) {
			case "LCK 롤 프로게이머 월드컵": num = 1; break;
			case "LOL 롤 스킨 월드컵": num = 2; break;
			case "LOL 롤 챔피언 월드컵": num = 3; break;
			case "LOL 롤 BGM 음악 월드컵": num = 4; break;
		}
		location.assign(path+"/game/worldcupRanking?gameName=" + name + "&num=" + num)
	});

});