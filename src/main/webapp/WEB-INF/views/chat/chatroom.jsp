<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
				<div class="shout-container pos-absolute">
					<!-- <h4><span class="nickname">김쉐프</span>님의 소리 없는 아우성!</h4>
					<h5>시시해서 죽고 싶어졌다</h5> -->
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
					<h4>실시간 채팅 (<span>1018</span>명 참여 중)</h4>
				</div>
				<div class="chatboard-box">
					<!-- <div class="chatboard-msg">
						<h6>닉네임1:</h6>
						<h6>채팅채팅채팅채팅채팅채팅채팅채팅채팅</h6>
					</div> -->
				</div>
				<div class="chatboard-send">
					<input id="chatMsg" class="flex-grow" type="text" placeholder="메세지 보내기">
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
	const me = '${loginMember.nickname}';
	const shouts = [];
	
	class Message {
		constructor(type = "", sender = "", receiver = "", content = "") {
			this.type = type;
			this.sender = sender;
			this.receiver = receiver;
			this.content = content;
		}
	}
	
	chattingServer.onopen = data => {
		chattingServer.send(JSON.stringify(new Message(type = "NOTIFICATION", 
														sender = me, 
														receiver = "", 
														content = "님이 입장하셨습니다.")
		));
	}
	
	chattingServer.onmessage = data => {
		const message = JSON.parse(data.data);
		console.log(message);
		
		switch (message.type) {
			case "NOTIFICATION":
				notify(message, "chatboard-msg", "notification");
				break;
			
			case "MSG": 
				chat(message, "chatboard-msg", message.sender === me ? "me" : ""); 
				break;
				
			case "SHOUT": 
				shouts.push(message);
				console.log(shouts);
				console.log(shouts.length);
				if (shouts.length === 1) {
					shout(shouts[0]);
				} else {
					setTimeout(() => {
						shouts.shift();
						shout(shouts[0]);
					}, 8000 * (shouts.length - 1));
				}

				break;
				
			case "SETTINGS":
				$(".chatboard-title span").text(message.content);
				break;
				
			case "ADMIN":
				console.log(message);
				break;
		}
	}
	
	chattingServer.onclose = data => {
		// WHEN CLOSING THE CHATROOM
	}
	
	$("#sendBtn").click(event => {
		chattingServer.send(JSON.stringify(new Message(type = "MSG", 
														sender = me, 
														receiver = "", 
														content = $("#chatMsg").val()))
		);
		
		$("#chatMsg").val("");
	});

	$(".btn-shout").click(event => {
		// check the user's point

		const shout = prompt("채팅방에 외칠 메시지를 적어주세요!");

		if (shout !== null) {
			chattingServer.send(JSON.stringify(new Message(type = "SHOUT", 
														sender = me, 
														receiver = "", 
														content = shout))
			);
		}
	});

	function shout(message) {
		const shoutContainer = $(".shout-container");
		const shoutUpper = "<h4><span class='nickname'>" + message.sender + "</span>님의 소리 없는 아우성!</h4>";
		const shoutLower = $("<h5>").text(message.content);

		shoutContainer.html("");
		shoutContainer.append(shoutUpper).append(shoutLower);
		shoutContainer.fadeIn(300);
		shoutContainer.fadeOut(7000);

		setTimeout(() => {
			if (shouts.length === 1) {
				shouts.shift();
			}
		}, 8000);
	}
	
	function chat(message, ...classes) {
		const chatBox = generateChatBox(message, classes);
		const nickname = $("<h6>").addClass("msg-nickname").text(message.sender + ":");
		const content = $("<h6>").addClass("msg-content").text(message.content);
		
		$(".chatboard-box").append(chatBox.append(nickname).append(content));
	}
	
	function notify(message, ...classes) {
		const chatBox = generateChatBox(message, classes);
		const content = $("<h6>").text(message.content);
		
		$(".chatboard-box").append(chatBox.append(content));
	}
	
	function generateChatBox(message, classes) {
		const $div = $("<div>");
		
		classes.forEach((_class, index) => {
			$div.addClass(_class);
		});
		
		return $div;
	}
</script>
</body>
</html>