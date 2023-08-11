<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" value="${sessionScope.loginMember}"/>
<spring:eval var="ttsKey" expression="@environment.getProperty('lolcogg.api.tts')"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
	<link rel="icon" href="${path}/resources/images/common/favicon-32.png" type="image/x-icon">
	<link rel="stylesheet" href="${path}/resources/css/common.css">
	<link rel="stylesheet" href="${path}/resources/css/style_chatroom.css">
<title>실시간 채팅</title>
</head>
<body>
	<div class="chatroom-container">
		<section class="chatroom-left">
			<div class="chatroom-left-video">
				<iframe width="854" height="480" src="https://www.youtube.com/embed/r3ZdT5wIk5k?autoplay=1&mute=1&start=2628" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen >
				</iframe>
				<div class="shout-container pos-absolute shout-layout">
					<!-- <h4><span class="nickname">닉네임</span>님의 소리 없는 아우성!</h4>
					<h5>메시지 내용</h5> -->
				</div>
			</div>
			<div class="chatroom-left-info">
				<h3 class="info-title fw-bold"></h3>
				<div class="flex-grow"></div>
				<button class="btn-shout"><span>소리 없는 아우성</span><img src="${path}/resources/images/chat/chatting.png"></button>
				<button class="btn-shout voice"><span>소리 있는 아우성</span><img src="${path}/resources/images/chat/sound.png"></button>
			</div>
		</section>
		<section class="chatroom-right">
			<div class="chatroom-right-chatboard">
				<div class="chatboard-title">
					<h4>실시간 채팅 (<span>0</span>명 참여 중)</h4>
				</div>
				<c:if test="${loginMember.nickname eq '관리자'}">
					<div class="nickname-list">
						<div class="nickname-list-title">
							<h5>접속자 명단</h5>
							<button><img src="${path}/resources/images/chat/slide-down.svg"></button>
						</div>
						<div class="nickname-list-wrapper">
							<ul></ul>
						</div>
					</div>
				</c:if>
				<div id="scrollBox" class="chatboard-wrapper ${loginMember.nickname eq '관리자' ? 'mt30' : ''}">
					<div class="chatboard-box">
						<!-- <div class="chatboard-msg">
						<div>
							<img src="아이콘">
						</div>
						<h6>닉네임:</h6>
						<h6>채팅내용</h6>
					</div> -->
					</div>
				</div>
				<div class="chatboard-send">
					<!-- <input id="chatMsg" class="flex-grow" type="text" placeholder="메세지 보내기"> -->
					<div class="chatMsgBox-outer">
						<div id="chatMsgBox" class="flex-grow" contenteditable="true">메세지 보내기</div>
						<input id="emoticonBtn" type="button">
					</div>
      				<input id="sendBtn" type="button" value="전송">
				</div>
			</div>
		</section>
	</div>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>
	$.getJSON(
		'https://noembed.com/embed',
    	{
			format: 'json', 
			url: "https://www.youtube.com/watch?v=" + "r3ZdT5wIk5k"
		}, 
			data => {
				$(".info-title").text(data.title);
			}
	);
	
	const chattingServer = new WebSocket("ws://localhost:7070/chatting");
	const userTeam = "${loginMember.teamAbbr}";
	const userEmail = "${loginMember.email}";
	const userNickname = '${loginMember.nickname}';
	const shouts = [];
	let sec = 30;
	
	class Message {
		constructor(type = "", teamAbbr="", 
				senderNickname = "", senderEmail,
				receiverNickname = "", receiverEmail="",
				content = "",
				voiced = false, banned = false) {
			this.type = type;
			this.teamAbbr = teamAbbr;
			this.senderNickname = senderNickname;
			this.senderEmail = senderEmail;
			this.receiverNickname = receiverNickname;
			this.receiverEmail = receiverEmail;
			this.content = content;
			this.voiced = voiced;
			this.banned = banned;
		}
	}
	
	chattingServer.onopen = data => {
		chattingServer.send(JSON.stringify(new Message(type = "ENTER", teamAbbr = userTeam, senderNickname = userNickname, senderEmail = userEmail)));
	}
	
	chattingServer.onmessage = data => {
		const message = JSON.parse(data.data);
		console.log(message);
		
		switch (message.type) {
			case "NOTIFICATION":
				notify(message, "chatboard-msg", "notification");
				$('#scrollBox').scrollTop($('#scrollBox')[0].scrollHeight);
				break;
			
			case "MSG": 
				chat(message, "chatboard-msg", addClassIfValid(message.senderNickname, userNickname, "me"), addClassIfValid(message.senderNickname, "관리자", "admin")); 
				$('#scrollBox').scrollTop($('#scrollBox')[0].scrollHeight);
				break;
				
			case "SHOUT": 
				shouts.push(message);
				if (shouts.length === 1) {
					shout(shouts[0]);
				} else {
					setTimeout(() => {
						shouts.shift();
						shout(shouts[0]);
					}, 8000 * (shouts.length - 1));
				}
				break;
				
			case "COUNT":
				$(".chatboard-title span").text(message.content);
				break;

			case "BAN":
				window.close();
				window.opener.alert("관리자에 의해 강퇴되었습니다. 금일 자정까지 채팅방 이용이 불가능합니다.");
				break;

			case "PROHIBIT":
				$("#sendBtn").off("click");
				$("#sendBtn").on("click", event => {
					alert("관리자에 의해 30초 동안 채팅이 금지되었습니다. [남은 시간: " + sec + "초]");
				});

				setInterval(() => {
					sec -= 1;
				}, 1000);

				setTimeout(() => {
					$("#sendBtn").off("click");
					$("#sendBtn").on("click", sendChatMessage);
				}, 30000);
				break;
				
			case "ADMIN":
				$(".nickname-list ul").html("");

				message.content.split(",").forEach((nickname, index) => {
					if (nickname !== "관리자") {
						const $li = $("<li>");
						const $h5 = $("<h5>").text(nickname).addClass("fw-bold");
						const $div = $("<div>").addClass("flex-grow");
						const btnBan = $("<button>").text("강퇴").addClass("ban");
						const btnProhibit = $("<button>").text("채금").addClass("prohibit");
	
						$li.append($h5)
							.append($div)
							.append(btnProhibit)
							.append(btnBan);
	
						$(".nickname-list ul").append($li);
					}
				});
				break;
		}
	}

	function addClassIfValid(senderNickname, nickname, className) {
		if (senderNickname === nickname) {
			return className;
		}
		return "";
	}

	$("#sendBtn").on("click", sendChatMessage);

	function sendChatMessage() {
		chattingServer.send(JSON.stringify(new Message(type = "MSG",
		teamAbbr = userTeam,
														senderNickname = userNickname,
														senderEmail = userEmail, 
														receiverNickname = "",
														receiverEmail = "", 
														content = $("#chatMsg").val()))
		);
		
		// $("#chatMsg").val("");

		$("#chatMsgBox").html("메세지 보내기");
		$("#chatMsgBox").on("focus", event => {
			$(event.target).html("");
			$(event.target).off("focus");
		});
	}



	$(".btn-shout").click(event => {
		let target;
		if ($(event.target).prop("tagName") === "BUTTON") {
			target = $(event.target);
		}

		if ($(event.target).prop("tagName") === "SPAN") {
			target = $(event.target).parent();
		}

		let shout = prompt("채팅방에 외칠 메시지를 입력해주세요!");

		if (shout.length === 0 || shout === null) {
			alert("입력된 메시지가 없습니다.");
			return
		}

		// after checking the user's point
		console.log(target.hasClass("voice"));
		if (target.hasClass("voice")) {
			chattingServer.send(JSON.stringify(new Message(type = "SHOUT", 
			teamAbbr = "",
														senderNickname = userNickname,
														senderEmail = userEmail, 
														receiverNickname = "",
														receiverEmail = "", 
														content = shout,
														voiced = true))
			);
		} else {
			chattingServer.send(JSON.stringify(new Message(type = "SHOUT", 
			teamAbbr = "",
														senderNickname = userNickname,
														senderEmail = userEmail, 
														receiverNickname = "",
														receiverEmail = "", 
														content = shout))
			);
		}
	});

	$(".nickname-list-title button").click(event => {
		let target;
		if ($(event.target).prop("tagName") === "BUTTON") {
			target = $(event.target);
		}

		if ($(event.target).prop("tagName") === "IMG") {
			target = $(event.target).parent();
		}

		target.toggleClass("rotate");
		$(".nickname-list").toggleClass("slide");
	});

	$(document).on("click", ".ban", event => {
		if (confirm($(event.target).siblings("h5").text() + "님을 강퇴하시겠습니까?")) {
			chattingServer.send(JSON.stringify(new Message(type = "BAN", 
														teamAbbr = "",
														senderNickname = userNickname,
														senderEmail = userEmail, 
														receiverNickname = $(event.target).siblings("h5").text(),
														receiverEmail = "",
														content = "",
														voiced = "",
														banned = true))
			);
		}
	});

	$(document).on("click", ".prohibit", event => {
		if (confirm($(event.target).siblings("h5").text() + "님을 30초 동안 채팅 금지 시키겠습니까?")) {
			chattingServer.send(JSON.stringify(new Message(type = "PROHIBIT", 
														teamAbbr = "",
														senderNickname = userNickname,
														senderEmail = userEmail, 
														receiverNickname = $(event.target).siblings("h5").text(),
														receiverEmail = "",
														content = "",
														voiced = "",
														banned = false))
			);
		}
	});

	$("#chatMsgBox").on("focus", event => {
		$(event.target).html("");
		$(event.target).off("focus");
	});

	function shout(message) {
		const shoutContainer = $(".shout-container");
		let shoutUpper = "<h4><span class='nickname'>" + message.senderNickname + "</span>님의 소리 없는 아우성!</h4>";
		const shoutLower = $("<h5>").text(message.content);

		shoutContainer.html("");
						
		if (message.voiced === true) {
			shoutUpper = "<h4><span class='nickname'>" + message.senderNickname + "</span>님의 소리 있는 아우성!</h4>";
			addVoice(message.content);
		}

		shoutContainer.append(shoutUpper).append(shoutLower);

		shoutContainer.fadeIn(300);
		setTimeout(() => {
			shoutContainer.fadeOut(2000);
		}, 5000);

		setTimeout(() => {
			if (shouts.length === 1) {
				shouts.shift();
			}
		}, 8000);
	}
	
	const colors = {
		T1: "#E2012D",
		GEN: "#AA8B2F",
		KT: "#FF0A07",
		HLE: "#F37321",
		DK: "#d1d1d1",
		KDF: "#E63313",
		BRO: "#004B29",
		NS: "#901A1E",
		LSB: "#FFC900",
		DRX: "#2f1eeb"
	};

	function chat(message, ...classes) {
		const chatBox = generateChatBox(classes);
		const $div = $("<div>").width("16px").css("marginRight", "3px");
		let $img = $("<img>").attr("src", "${path}/resources/images/logo/" + message.teamAbbr + "_square.png");

		if (message.teamAbbr === "") {
			$img = $("<img>").attr("src", "${path}/resources/images/common/icon_profile.png");
		}


		if (message.senderNickname === "관리자") {
			$img.attr("src", "${path}/resources/images/common/favicon-32.png");
		}

		const nickname = $("<h6>").addClass("msg-nickname").text(message.senderNickname + ":");

		if (message.senderNickname !== '관리자') {
			nickname.css("color", colors[message.teamAbbr]);
		}
		
		const content = $("<h6>").addClass("msg-content").text(message.content);
		
		chatBox.append($div.append($img))
				.append(nickname)
				.append(content);

		$(".chatboard-box").append(chatBox);
	}
	
	function notify(message, ...classes) {
		const chatBox = generateChatBox(classes);
		const content = $("<h6>").text(message.content);
		
		$(".chatboard-box").append(chatBox.append(content));
	}
	
	function generateChatBox(classes) {
		const $div = $("<div>");
		
		classes.forEach((_class, index) => {
			$div.addClass(_class);
		});
		
		return $div;
	}

	function addVoice(content) {
		var data = {    
				"voice":{
					"languageCode":"ko-KR"
				},
				"input":{
					"text": content
				},
				"audioConfig":{
					"audioEncoding":"mp3"
				}
			}

		$.ajax({
			type:'POST',
			url: 'https://texttospeech.googleapis.com/v1/text:synthesize?key=${ttsKey}',
			data: JSON.stringify(data),
			dataType: 'JSON',
			contentType: "application/json; charset=UTF-8",
			success: function(res) {
				const audioFile = new Audio();
				const audioBlob = base64ToBlob(res.audioContent, "mp3");
				audioFile.src = window.URL.createObjectURL(audioBlob);
				audioFile.playbackRate = 1;
				audioFile.play();
			},
			error : function(request, status, error) {
				alert("오류가 발생하였습니다. 관리자에게 문의해주세요.");
			}
		});
	};
	
	function base64ToBlob(base64, fileType) {
		const typeHeader = "data:application/" + fileType + ";base64,";
		const audioSrc = typeHeader + base64; 
		const arr = audioSrc.split(",");
		const array = arr[0].match(/:(.*?);/);
		const mime = (array && array.length > 1 ? array[1] : type) || type;
		const bytes = window.atob(arr[1]);
		const ab = new ArrayBuffer(bytes.length);
		const ia = new Uint8Array(ab);

		for (let i = 0; i < bytes.length; i++) {
			ia[i] = bytes.charCodeAt(i);
		}

		return new Blob([ab], { type: mime });
	}
</script>
</body>
</html>