<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/card/card.css">

<style>
</style>
<!------------------------------------>
<title>나의 카드</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="card_main_img">
			<img src="${path }/resources/images/card/포이스트페이트.png" alt=""
				width="100%" height="450px">
		</div>
		<div class="center-1280 background-img mainpage mainHeight">
			<div class="width-1280 ">
				<div class="card_main_size">
					<div class="card_catalog">
						<a href="${path }/card/selectCardById"><span class="content"
							onclick="">MY CARD</span></a> <a href="${path }/card/selectCard"><span
							class="content">CARD CATALOG</span></a> <a
							href="${path }/card/cardAchievement"><span class="content">ACHIEVEMENT</span></a>
					</div>
					<div class="card_categorie_title">
						<div class="">
							<p class="subTitle fs-20">MY CARD</p>
							<div class="mycard_leader_div">
								<p class="cardmainTitle fs-35 ">나의 카드</p>
								<div>
									<button type="button" class="button" onclick="leaderSetting();">대표
										카드 설정</button>
									<button type="button" class="button"
										onclick="location.assign('${path}/card/leaderclear')">대표
										카드 해제</button>

								</div>
							</div>
						</div>
					</div>
					<hr>
					<c:if test="${empty l}">
						<div class="leader_card">
							<p class="content fs-20">보유한 카드만 대표 카드로 설정할수있습니다.</p>
						</div>
					</c:if>
					<c:if test="${not empty l }">
						<c:set var="leader_cardName1" value="${l.card.cardName }" />
						<c:set var="leader_cardName2"
							value="${fn:toLowerCase(leader_cardName1)}" />
						<div class="leader_card_div">
							<div class="leader_card_on">
								<div class="container noselect">
									<div class="canvas">
										<div class="tracker tr-1"></div>
										<div class="tracker tr-2"></div>
										<div class="tracker tr-3"></div>
										<div class="tracker tr-4"></div>
										<div class="tracker tr-5"></div>
										<div class="tracker tr-6"></div>
										<div class="tracker tr-7"></div>
										<div class="tracker tr-8"></div>
										<div class="tracker tr-9"></div>
										<div class="tracker tr-10"></div>
										<div class="tracker tr-11"></div>
										<div class="tracker tr-12"></div>
										<div class="tracker tr-13"></div>
										<div class="tracker tr-14"></div>
										<div class="tracker tr-15"></div>
										<div class="tracker tr-16"></div>
										<div class="tracker tr-17"></div>
										<div class="tracker tr-18"></div>
										<div class="tracker tr-19"></div>
										<div class="tracker tr-20"></div>
										<div class="tracker tr-21"></div>
										<div class="tracker tr-22"></div>
										<div class="tracker tr-23"></div>
										<div class="tracker tr-24"></div>
										<div class="tracker tr-25"></div>
										<div id="card">
											<div class="card_img">
												<div class="card_content_div">
													<div class="card_content">
														<div class="back">
															<div class="back-content">
																<svg stroke="#ffffff"
																	xmlns:xlink="http://www.w3.org/1999/xlink"
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"
																	height="50px" width="50px" fill="#ffffff">
                                <g stroke-width="0"
																		id="SVGRepo_bgCarrier"></g>
          
                                <g stroke-linejoin="round"
																		stroke-linecap="round" id="SVGRepo_tracerCarrier"></g>
          
                                <g id="SVGRepo_iconCarrier">
          
                                  <path
																		d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">
                                  </path>
          
                                </g>
                              </svg>
																<div class="card_info_div">
																	<strong> <img
																		src="${path }/resources/images/card/${l.card.cardClass.cardClassName }.png"
																		alt="" width="250px" height="350px" class="player_img">
																	</strong>
																	<div class="card_player_info">
																		<p class="title player_name">${l.card.cardName }</p>
																		<p class="content player_season">${l.card.cardSeason }</p>
																		<p class="content player_position">${l.card.cardPosition }</p>
																		<img
																			src="${path }/resources/images/player/${l.card.teamName}_roster_${leader_cardName2 }1.png"
																			alt="" class="player" width="170px" height="250px">
																		<img
																			src="${path }/resources/images/logo/${l.card.teamName }_logo_small.png"
																			class="player_team_logo"> <img
																			src="${path }/resources/images/card/${l.card.cardPosition }.svg"
																			alt="" class="player_position_img" width="20px"
																			height="20px">
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card_info">
								<div class="card_img_name">
									<img
										src="${path }/resources/images/logo/${l.card.teamName }_logo_small.png"
										alt=""> <span class="title">${l.card.cardName }</span>
								</div>
								<hr>

								<div class="rader_ability_div">
									<div style="width: 300px;">
										<canvas id="radar-chart"></canvas>
									</div>
									<div class="card_info_ability_div">
										<div class="card_info_ability">
											<img src="${path }/resources/images/card/BATTLE.png" alt=""
												width="25px"> <span class="title">공격</span>
											<div class="graph stack">
												<span style="width: ${l.card.cardBattleAbility}%;"></span>
											</div>
											<span class="title ability_size">${l.card.cardBattleAbility}%</span>
										</div>
										<div class="card_info_ability">
											<img src="${path }/resources/images/card/DEFEND.png" alt=""
												width="25px"> <span class="title">수비</span>
											<div class="graph stack1">
												<span style="width: ${l.card.cardDefendAbility}%;"></span>
											</div>
											<span class="title">${l.card.cardDefendAbility}%</span>
										</div>
										<div class="card_info_ability">
											<img src="${path }/resources/images/card/SURVIVAL.png" alt=""
												width="25px"> <span class="title">생존</span>
											<div class="graph stack2">
												<span style="width: ${l.card.cardsurvivalAbility}%;"></span>
											</div>
											<span class="title">${l.card.cardsurvivalAbility}%</span>
										</div>
										<div class="card_info_ability">
											<img src="${path }/resources/images/card/GROWTH.png" alt=""
												width="25px"> <span class="title">성장</span>
											<div class="graph stack3">
												<span style="width: ${l.card.cardGrowthAbility}%;"></span>
											</div>
											<span class="title">${l.card.cardGrowthAbility}%</span>
										</div>
										<div class="card_info_ability">
											<img src="${path }/resources/images/card/ASSISTANT.png"
												alt="" width="25px"> <span class="title">어시</span>
											<div class="graph stack4">
												<span style="width: ${l.card.cardAssistantAbility}%;"></span>
											</div>
											<span class="title ability_size">${l.card.cardAssistantAbility}%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
				</c:if>
				<hr>
				<div class="select_card">
					<div class="select_refresh_div">

						<select class="Initialization select_button_rating">
							<option hidden="hiddn" value="rating">등급</option>
							<option value="NORMAL">NORMAL</option>
							<option value="COMMON">COMMON</option>
							<option value="UNIQUE">UNIQUE</option>
						</select> <select class="Initialization select_button_team">
							<option hidden="hiddn" value="team">팀</option>
							<option value="brion">BRO</option>
							<option value="dplus">DK</option>
							<option value="drx">DRX</option>
							<option value="geng">GEN</option>
							<option value="hanwha">HLE</option>
							<option value="redforce">KDF</option>
							<option value="kt">KT</option>
							<option value="sandbox">LSB</option>
							<option value="redforce">NS</option>
							<option value="t1">T1</option>
						</select> <select class="Initialization select_button_player">
							<c:forEach var="a" items="${selectCardName }">
								<option hidden="hiddn" value="player">선수</option>
								<option value="${a.cardName }">${a.cardName }</option>
							</c:forEach>

						</select> <select class="Initialization select_button_season">
							<option hidden="hiddn" value="season">시즌</option>
							<option value="LCK 2023 spring">2023 Spring</option>

						</select> <select class="Initialization select_button_position">
							<option hidden="hiddn" value="position">포지션</option>

							<option value="TOP">TOP</option>
							<option value="JGL">JGL</option>
							<option value="MID">MID</option>
							<option value="BOT">BOT</option>
							<option value="SUP">SUP</option>
						</select> <img src="${path }/resources/images/card/새로고침.svg" alt=""
							onclick="test();" class="refresh">
					</div>


					<div>
						<div class="board-search-div">
							<input placeholder="검색" class="search"> <img
								src="${path }/resources/images/card/돋보기.svg" alt="돋보기"
								class="hiddenOption">
						</div>
					</div>

				</div>
				<div class="card_img_div">
					<c:if test="${empty cardList}">
						<div class="have_card">
							<p class="content fs-20">보유한 카드가 없습니다.</p>
						</div>
					</c:if>
					<c:if test="${not empty cardList}">
						<c:forEach var="c" items="${cardList }">
							<c:set var="cardName1" value="${c.card.cardName }" />
							<c:set var="cardName2" value="${fn:toLowerCase(cardName1)}" />

							<div class="card_img">
								<div class="card_content_div">
									<div class="card_content">
										<div class="back">
											<div class="back-content">
												<svg stroke="#ffffff"
													xmlns:xlink="http://www.w3.org/1999/xlink"
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"
													height="50px" width="50px" fill="#ffffff">
            
                                  <g stroke-width="0"
														id="SVGRepo_bgCarrier"></g>
            
                                  <g stroke-linejoin="round"
														stroke-linecap="round" id="SVGRepo_tracerCarrier"></g>
            
                                  <g id="SVGRepo_iconCarrier">
            
                                    <path
														d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">
                                    </path>
            
                                  </g>
            
                                </svg>
												<div class="card_info_div">
													<strong> <img
														src="${path }/resources/images/card/${c.card.cardClass.cardClassName }.png"
														alt="" width="250px" height="350px" class="player_img">
													</strong>
													<div class="card_player_info">
														<p class="title  player_name">${c.card.cardName }</p>
														<p class="content player_season">${c.card.cardSeason }</p>
														<p class="content player_position">${c.card.cardPosition }</p>
														<img
															src="${path }/resources/images/player/${c.card.teamName}_roster_${cardName2 }1.png"
															alt="" class="player" width="170px" height="250px">
														<img
															src="${path }/resources/images/logo/${c.card.teamName }_logo_small.png"
															alt="" class="player_team_logo"> <img
															src="${path }/resources/images/card/${c.card.cardPosition }.svg"
															alt="" class="player_position_img" width="20px"
															height="20px">
													</div>
												</div>
											</div>
										</div>
										<div class="front">
											<div class="front-content">
												<div class="front_ability_total">
													<div class="front_ability_div">
														<img
															src="${path }/resources/images/card/${c.card.cardClass.cardClassName }.png"
															alt="" width="250px" height="350px">
														<div class="front_ability">
															<img src="${path }/resources/images/card/BATTLE.png"
																alt="" width="15px"> <span class="title title1">공격</span>
															<div class="graph1 front_stack">
																<span style="width: ${c.card.cardBattleAbility}%;"></span>
															</div>
															<span class="title title1 front_ability_size">${c.card.cardBattleAbility}%</span>
														</div>
														<div class="front_ability">
															<img src="${path }/resources/images/card/DEFEND.png"
																alt="" width="15px"> <span class="title title1">수비</span>
															<div class="graph1 front_stack1">
																<span style="width: ${c.card.cardDefendAbility}%;"></span>
															</div>
															<span class="title title1 front_ability_size">${c.card.cardDefendAbility}%</span>
														</div>
														<div class="front_ability">
															<img src="${path }/resources/images/card/SURVIVAL.png"
																alt="" width="15px"> <span class="title title1">생존</span>
															<div class="graph1 front_stack2">
																<span style="width: ${c.card.cardsurvivalAbility}%;"></span>
															</div>
															<span class="title title1 front_ability_size">${c.card.cardsurvivalAbility }%</span>
														</div>
														<div class="front_ability">
															<img src="${path }/resources/images/card/GROWTH.png"
																alt="" width="15px"> <span class="title title1">성장</span>
															<div class="graph1 front_stack3">
																<span style="width: ${c.card.cardGrowthAbility}%;"></span>
															</div>
															<span class="title title1 front_ability_size">${c.card.cardGrowthAbility}%</span>
														</div>
														<div class="front_ability">
															<img src="${path }/resources/images/card/ASSISTANT.png"
																alt="" width="15px"> <span class="title title1">어시</span>
															<div class="graph1 front_stack4">
																<span style="width: ${c.card.cardAssistantAbility}%;"></span>
															</div>
															<span
																class="title title1 ability_size front_ability_size">${c.card.cardAssistantAbility}%</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<div class="pageBar_div">
					<c:out value="${pageBar }" escapeXml="false" />
				</div>
			</div>
		</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
	<script src="${path}/resources/js/script_common.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/chart.js@3.8.2/dist/chart.min.js"></script>
	<!-- Your own script tag or JavaScript file -->
	<script>
	
	let style = document.createElement('style');
	document.head.appendChild(style);
	let styleSheet = style.sheet;

	let keyframesRules = [
	  `
	  @keyframes stack {
    0% {
        width: 0;
        color: rgb(255, 255, 255, 0);
    }

    40% {
        color: rgb(255, 255, 255, 1);
    }

    100% {
        width: ${l.card.cardBattleAbility}%;
    }
}`,
`

	  @keyframes stack1 {
	    0% {
	        width: 0;
	        color: rgb(255, 255, 255, 0);
	    }

	    40% {
	        color: rgb(255, 255, 255, 1);
	    }

	    100% {
	        width: ${l.card.cardDefendAbility}%;
	    }
	  }`,
	  `
	  @keyframes stack2 {
	    0% {
	        width: 0;
	        color: rgb(255, 255, 255, 0);
	    }

	    40% {
	        color: rgb(255, 255, 255, 1);
	    }

	    100% {
	        width: ${l.card.cardsurvivalAbility}%;
	    }
	  }`,
	  `
	  @keyframes stack3 {
	    0% {
	        width: 0;
	        color: rgb(255, 255, 255, 0);
	    }

	    40% {
	        color: rgb(255, 255, 255, 1);
	    }

	    100% {
	        width: ${l.card.cardGrowthAbility}%;
	    }
	  }`,
	  `
	  @keyframes stack4 {
	    0% {
	        width: 0;
	        color: rgb(255, 255, 255, 0);
	    }

	    40% {
	        color: rgb(255, 255, 255, 1);
	    }

	    100% {
	        width: ${l.card.cardAssistantAbility}%;
	    }
	  }`
	];

	for (let rule of keyframesRules) {
	  styleSheet.insertRule(rule, styleSheet.cssRules.length);
	}


	
	var data = [${l.card.cardBattleAbility},${l.card.cardDefendAbility},${l.card.cardsurvivalAbility},${l.card.cardGrowthAbility},${l.card.cardAssistantAbility}]
	const chartData = {
		      labels: ['공격 ', '수비', '생존', '성장', '어시'],
		      datasets: [
		        {
		          label: '팀 점수',
		          data: data,
		          backgroundColor: 'rgba(255, 108, 61, 0.2)',
		        },
		      ],
		    };
		    const chartOptions = {
		      elements: {
		        line: {
		          borderWidth: 1,
		          borderColor: '#EEEEEE',
		        },
		        point: {
		          pointBackgroundColor: '#fff',
		        },
		      },
		      scales: {
		        r: {
		          backgroundColor: '#6454ED',
		          ticks: {
		            stepSize:20,
		            display: false,
		          },
		          grid: {
		            color: '#9E9E9E', // COLOR.GRAY_9E 대체
		          },
		          pointLabels: {
		        font: {
		          size: 20,
		          weight: '800',
		          color: '#FFFFFF', // 여기를 변경했습니다
		        },

		          },
		          angleLines: {
		            display: false,
		          },
		          suggestedMin: 0,
		          suggestedMax: 10,
		        },
		      },
		      plugins: {
		        legend: {
		          display: false,
		        },
		      },

		    };


		    const ctx = document.getElementById('radar-chart');
		    new Chart(ctx, {
		      type: 'radar',
		      data: chartData,
		      options: chartOptions,
		    });

	
	const leaderSetting=()=>{
		openPage("${path}/card/leaderSetting",500,600);
	}
	const leaderclear=()=>{
		"${path}/card/leaderclear"
	}
	
	
	

	$(".hiddenOption").click(function(){
		const search=$(".search").val();
		   $.ajax({
	            type: "get",
	            url: "${path}/card/searchPlayer",
	            data: {
	                search: search,
	            },
		        success: function (cardList) {
		        	
	      
		        	if (cardList.searchPlayer.length==0) {
		        	    let html = '<div class="have_card">';
		        	    html += '<p class="content fs-20">보유한 카드가 없습니다.</p>';
		        	    html += '</div>';
		        	    document.querySelector('.card_img_div').innerHTML = html; 
		        	} else {
		        	    let html = '';

		        	    cardList.searchPlayer.forEach(c => {
		        	    	let cardName1 =c.card.cardName
							let cardName2 = cardName1.toLowerCase();
		        	    	  
		        	        html += '<div class="card_img">';
		        	        html += '<div class="card_content_div">';
		        	        html += '<div class="card_content">';
		        	        html += '<div class="back">';
		        	        html += '<div class="back-content">';
		        	        html += '<svg stroke="#ffffff" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" height="50px" width="50px" fill="#ffffff">';
		        	        html += '<g stroke-width="0" id="SVGRepo_bgCarrier">';
		        	        html += '<g>';
		        	        html += '<g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier">';
		        	        html += '<g>';
		        	        html += '<g id="SVGRepo_iconCarrier">';
		        	        html += '<path d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">';
		        	        html += '</path>';
		        	        html += '</g>';
		        	        html += '</svg>'; 
		        	        html += '<div class="card_info_div">';
		        	        html += '<strong>';
		        	        html += '<img src="${path }/resources/images/card/' + c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px" class="player_img">';
		        	        html += '</strong>';
		        	        html += '<div class="card_player_info">';
		        	        html += '<p class="title  player_name">'+c.card.cardName+'<p>';
		        	        html += '<p class="content player_season">'+c.card.cardSeason+'</p>';
		        	        html += '<p class="content player_position">'+c.card.cardPosition+'</p>';
		        	        html += '<img src="${path }/resources/images/player/'+c.card.teamName+'_roster_'+cardName2+'1.png" alt="" class="player" width="170px" height="250px">';
		        	        html += '<img src="${path }/resources/images/logo/'+c.card.teamName+'_logo_small.png" alt="" class="player_team_logo">';
		        	        html += '<img src="${path }/resources/images/card/'+c.card.cardPosition+'.svg" alt="" class="player_position_img" width="20px" height="20px">';
		        	        html += '</div></div></div></div>';
		        	       	html += '<div class="front">';
		        	       	html += '<div class="front-content">';
		        	        html += '<div class="front_ability_total">';
		        	        html += '<div class="front_ability_div">';
		        	        html += '<img src="${path }/resources/images/card/'+ c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px">';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/BATTLE.png" alt="" width="15px">';
		        	        html += '<span class="title title1">공격';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width:'+ c.card.cardBattleAbility + '%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardBattleAbility+'%</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/DEFEND.png" alt="" width="15px">';
		        	        html += '<span class="title title1">수비';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardDefendAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardDefendAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/SURVIVAL.png" alt="" width="15px">';
		        	        html += '<span class="title title1">생존';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardsurvivalAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardsurvivalAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/GROWTH.png" alt="" width="15px">';
		        	        html += '<span class="title title1">성장';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardGrowthAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardGrowthAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/ASSISTANT.png" alt="" width="15px">';
		        	        html += '<span class="title title1">어시';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardAssistantAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardAssistantAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '</div></div></div></div></div></div></div>';
		        	    });
		        	    
		        	    

		        	    document.querySelector('.card_img_div').innerHTML = html;
		        	    $(".pageBar_div").html(cardList.pageBar);

		        	}
		        	
		        	

					var cards = document.querySelectorAll(".player_img");
					var backs = document.querySelectorAll(".back");

					for (var i = 0; i < cards.length; i++) {
						if (cards[i].getAttribute("src").includes("COMMON")) {
							backs[i].classList.add("common");
						} else if (cards[i].getAttribute("src").includes("NORMAL")) {
							backs[i].classList.add("normal");
						} else if (cards[i].getAttribute("src").includes("UNIQUE")) {
							backs[i].classList.add("unique");
						}
					}
					 
		        },
		        error: function (e) {
		           
		            console.log("요청 실패", e);
		        }
		    });
	
		
	});
	$(".search").keyup(function(key){
	    if(key.keyCode==13) {
	    	const search=$(".search").val();
		
	    $.ajax({
            type: "get",
            url: "${path}/card/searchPlayer",
            data: {
                search: search,
              
            },
	        success: function (cardList) {
	      
	        	if (cardList.searchPlayer.length==0) {
	        	    let html = '<div class="have_card">';
	        	    html += '<p class="content fs-20">보유한 카드가 없습니다.</p>';
	        	    html += '</div>';
	        	    document.querySelector('.card_img_div').innerHTML = html; 
	        	} else {
	        	    let html = '';

	        	    cardList.searchPlayer.forEach(c => {
	        	    	let cardName1 =c.card.cardName
						let cardName2 = cardName1.toLowerCase();
	        	    	  
	        	        html += '<div class="card_img">';
	        	        html += '<div class="card_content_div">';
	        	        html += '<div class="card_content">';
	        	        html += '<div class="back">';
	        	        html += '<div class="back-content">';
	        	        html += '<svg stroke="#ffffff" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" height="50px" width="50px" fill="#ffffff">';
	        	        html += '<g stroke-width="0" id="SVGRepo_bgCarrier">';
	        	        html += '<g>';
	        	        html += '<g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier">';
	        	        html += '<g>';
	        	        html += '<g id="SVGRepo_iconCarrier">';
	        	        html += '<path d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">';
	        	        html += '</path>';
	        	        html += '</g>';
	        	        html += '</svg>'; 
	        	        html += '<div class="card_info_div">';
	        	        html += '<strong>';
	        	        html += '<img src="${path }/resources/images/card/' + c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px" class="player_img">';
	        	        html += '</strong>';
	        	        html += '<div class="card_player_info">';
	        	        html += '<p class="title  player_name">'+c.card.cardName+'<p>';
	        	        html += '<p class="content player_season">'+c.card.cardSeason+'</p>';
	        	        html += '<p class="content player_position">'+c.card.cardPosition+'</p>';
	        	        html += '<img src="${path }/resources/images/player/'+c.card.teamName+'_roster_'+cardName2+'1.png" alt="" class="player" width="170px" height="250px">';
	        	        html += '<img src="${path }/resources/images/logo/'+c.card.teamName+'_logo_small.png" alt="" class="player_team_logo">';
	        	        html += '<img src="${path }/resources/images/card/'+c.card.cardPosition+'.svg" alt="" class="player_position_img" width="20px" height="20px">';
	        	        html += '</div></div></div></div>';
	        	       	html += '<div class="front">';
	        	       	html += '<div class="front-content">';
	        	        html += '<div class="front_ability_total">';
	        	        html += '<div class="front_ability_div">';
	        	        html += '<img src="${path }/resources/images/card/'+ c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px">';
	        	        html += '<div class="front_ability">';
	        	        html += '<img src="${path }/resources/images/card/BATTLE.png" alt="" width="15px">';
	        	        html += '<span class="title title1">공격';
	        	        html += '</span>';
	        	        html += '<div class="graph1">';
	        	        html += '<span style="width:'+ c.card.cardBattleAbility + '%;">';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<span class="title title1 front_ability_size">'+c.card.cardBattleAbility+'%</span>';
	        	        html += '</div>';
	        	        html += '<div class="front_ability">';
	        	        html += '<img src="${path }/resources/images/card/DEFEND.png" alt="" width="15px">';
	        	        html += '<span class="title title1">수비';
	        	        html += '</span>';
	        	        html += '<div class="graph1">';
	        	        html += '<span style="width: '+c.card.cardDefendAbility+'%;">';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<span class="title title1 front_ability_size">'+c.card.cardDefendAbility+'%';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<div class="front_ability">';
	        	        html += '<img src="${path }/resources/images/card/SURVIVAL.png" alt="" width="15px">';
	        	        html += '<span class="title title1">생존';
	        	        html += '</span>';
	        	        html += '<div class="graph1">';
	        	        html += '<span style="width: '+c.card.cardsurvivalAbility+'%;">';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<span class="title title1 front_ability_size">'+c.card.cardsurvivalAbility+'%';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<div class="front_ability">';
	        	        html += '<img src="${path }/resources/images/card/GROWTH.png" alt="" width="15px">';
	        	        html += '<span class="title title1">성장';
	        	        html += '</span>';
	        	        html += '<div class="graph1">';
	        	        html += '<span style="width: '+c.card.cardGrowthAbility+'%;">';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<span class="title title1 front_ability_size">'+c.card.cardGrowthAbility+'%';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<div class="front_ability">';
	        	        html += '<img src="${path }/resources/images/card/ASSISTANT.png" alt="" width="15px">';
	        	        html += '<span class="title title1">어시';
	        	        html += '</span>';
	        	        html += '<div class="graph1">';
	        	        html += '<span style="width: '+c.card.cardAssistantAbility+'%;">';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '<span class="title title1 front_ability_size">'+c.card.cardAssistantAbility+'%';
	        	        html += '</span>';
	        	        html += '</div>';
	        	        html += '</div></div></div></div></div></div></div>';
	        	    });

	        	    document.querySelector('.card_img_div').innerHTML = html;
	        	    $(".pageBar_div").html(cardList.pageBar);

	        	}

				var cards = document.querySelectorAll(".player_img");
				var backs = document.querySelectorAll(".back");

				for (var i = 0; i < cards.length; i++) {
					if (cards[i].getAttribute("src").includes("COMMON")) {
						backs[i].classList.add("common");
					} else if (cards[i].getAttribute("src").includes("NORMAL")) {
						backs[i].classList.add("normal");
					} else if (cards[i].getAttribute("src").includes("UNIQUE")) {
						backs[i].classList.add("unique");
					}
				}
				 
	        },
	        error: function (e) {
	           
	            console.log("요청 실패", e);
	        }
	    });
	    	
	    	
        }
		
	});
	
	 const searchPaging = (no) => {
		
		    	const search=$(".search").val();
			
		    $.ajax({
	            type: "get",
	            url: "${path}/card/searchPlayer",
	            data: {
	            	cPage:no,
	                search: search,
	              
	            },
		        success: function (cardList) {
		        	
		        	if (cardList.searchPlayer.length==0) {
		        	    let html = '<div class="have_card">';
		        	    html += '<p class="content fs-20">보유한 카드가 없습니다.</p>';
		        	    html += '</div>';
		        	    document.querySelector('.card_img_div').innerHTML = html; 
		        	} else {
		        	    let html = '';

		        	    cardList.searchPlayer.forEach(c => {
		        	    	let cardName1 =c.card.cardName
							let cardName2 = cardName1.toLowerCase();
		        	    	  
		        	        html += '<div class="card_img">';
		        	        html += '<div class="card_content_div">';
		        	        html += '<div class="card_content">';
		        	        html += '<div class="back">';
		        	        html += '<div class="back-content">';
		        	        html += '<svg stroke="#ffffff" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" height="50px" width="50px" fill="#ffffff">';
		        	        html += '<g stroke-width="0" id="SVGRepo_bgCarrier">';
		        	        html += '<g>';
		        	        html += '<g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier">';
		        	        html += '<g>';
		        	        html += '<g id="SVGRepo_iconCarrier">';
		        	        html += '<path d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">';
		        	        html += '</path>';
		        	        html += '</g>';
		        	        html += '</svg>'; 
		        	        html += '<div class="card_info_div">';
		        	        html += '<strong>';
		        	        html += '<img src="${path }/resources/images/card/' + c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px" class="player_img">';
		        	        html += '</strong>';
		        	        html += '<div class="card_player_info">';
		        	        html += '<p class="title  player_name">'+c.card.cardName+'<p>';
		        	        html += '<p class="content player_season">'+c.card.cardSeason+'</p>';
		        	        html += '<p class="content player_position">'+c.card.cardPosition+'</p>';
		        	        html += '<img src="${path }/resources/images/player/'+c.card.teamName+'_roster_'+cardName2+'1.png" alt="" class="player" width="170px" height="250px">';
		        	        html += '<img src="${path }/resources/images/logo/'+c.card.teamName+'_logo_small.png" alt="" class="player_team_logo">';
		        	        html += '<img src="${path }/resources/images/card/'+c.card.cardPosition+'.svg" alt="" class="player_position_img" width="20px" height="20px">';
		        	        html += '</div></div></div></div>';
		        	       	html += '<div class="front">';
		        	       	html += '<div class="front-content">';
		        	        html += '<div class="front_ability_total">';
		        	        html += '<div class="front_ability_div">';
		        	        html += '<img src="${path }/resources/images/card/'+ c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px">';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/BATTLE.png" alt="" width="15px">';
		        	        html += '<span class="title title1">공격';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width:'+ c.card.cardBattleAbility + '%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardBattleAbility+'%</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/DEFEND.png" alt="" width="15px">';
		        	        html += '<span class="title title1">수비';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardDefendAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardDefendAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/SURVIVAL.png" alt="" width="15px">';
		        	        html += '<span class="title title1">생존';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardsurvivalAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardsurvivalAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/GROWTH.png" alt="" width="15px">';
		        	        html += '<span class="title title1">성장';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardGrowthAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardGrowthAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/ASSISTANT.png" alt="" width="15px">';
		        	        html += '<span class="title title1">어시';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardAssistantAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardAssistantAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '</div></div></div></div></div></div></div>';
		        	    });

		        	    document.querySelector('.card_img_div').innerHTML = html;
		        	    $(".pageBar_div").html(cardList.pageBar);

		        	}

					var cards = document.querySelectorAll(".player_img");
					var backs = document.querySelectorAll(".back");

					for (var i = 0; i < cards.length; i++) {
						if (cards[i].getAttribute("src").includes("COMMON")) {
							backs[i].classList.add("common");
						} else if (cards[i].getAttribute("src").includes("NORMAL")) {
							backs[i].classList.add("normal");
						} else if (cards[i].getAttribute("src").includes("UNIQUE")) {
							backs[i].classList.add("unique");
						}
					}
					 
		        },
		        error: function (e) {
		           
		            console.log("요청 실패", e);
		        }
		    });
		    	
		    	
	        
		
	 }
	
	
	
	
	
	/* 카드 테두리 효과 */
		window.onload = function onloadEvent() {
			var cards = document.querySelectorAll(".player_img");
			var backs = document.querySelectorAll(".back");

			for (var i = 0; i < cards.length; i++) {
				if (cards[i].getAttribute("src").includes("COMMON")) {
					backs[i].classList.add("common");
				} else if (cards[i].getAttribute("src").includes("NORMAL")) {
					backs[i].classList.add("normal");
				} else if (cards[i].getAttribute("src").includes("UNIQUE")) {
					backs[i].classList.add("unique");
				}
			}
		}
		
		/* 새로고침  */
		function test() {
			$('.Initialization').each(function() {
				$(this).prop('selectedIndex', 0);
			});
			 $.ajax({
	                type:"get",
	                url:"${path}/card/selectCategorie",
	                data: { 
	                    rating:'rating', 
	                    team: 'team', 
	                    player: 'player',
	                    season: 'season',
	                    position: 'position'
	                },
	                success: function (cardList) {
	      		      
			        	if (cardList.selectCategorie.length==0) {
			        	    let html = '<div class="have_card">';
			        	    html += '<p class="content fs-20">보유한 카드가 없습니다.</p>';
			        	    html += '</div>';
			        	    document.querySelector('.card_img_div').innerHTML = html; 
			        	} else {
			        	    let html = '';

			        	    cardList.selectCategorie.forEach(c => {
			        	    	let cardName1 =c.card.cardName
								let cardName2 = cardName1.toLowerCase();
			        	    	 
			        	        html += '<div class="card_img">';
			        	        html += '<div class="card_content_div">';
			        	        html += '<div class="card_content">';
			        	        html += '<div class="back">';
			        	        html += '<div class="back-content">';
			        	        html += '<svg stroke="#ffffff" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" height="50px" width="50px" fill="#ffffff">';
			        	        html += '<g stroke-width="0" id="SVGRepo_bgCarrier">';
			        	        html += '<g>';
			        	        html += '<g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier">';
			        	        html += '<g>';
			        	        html += '<g id="SVGRepo_iconCarrier">';
			        	        html += '<path d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">';
			        	        html += '</path>';
			        	        html += '</g>';
			        	        html += '</svg>'; 
			        	        html += '<div class="card_info_div">';
			        	        html += '<strong>';
			        	        html += '<img src="${path }/resources/images/card/' + c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px" class="player_img">';
			        	        html += '</strong>';
			        	        html += '<div class="card_player_info">';
			        	        html += '<p class="title  player_name">'+c.card.cardName+'<p>';
			        	        html += '<p class="content player_season">'+c.card.cardSeason+'</p>';
			        	        html += '<p class="content player_position">'+c.card.cardPosition+'</p>';
			        	        html += '<img src="${path }/resources/images/player/'+c.card.teamName+'_roster_'+cardName2+'1.png" alt="" class="player" width="170px" height="250px">';
			        	        html += '<img src="${path }/resources/images/logo/'+c.card.teamName+'_logo_small.png" alt="" class="player_team_logo">';
			        	        html += '<img src="${path }/resources/images/card/'+c.card.cardPosition+'.svg" alt="" class="player_position_img" width="20px" height="20px">';
			        	        html += '</div></div></div></div>';
			        	       	html += '<div class="front">';
			        	       	html += '<div class="front-content">';
			        	        html += '<div class="front_ability_total">';
			        	        html += '<div class="front_ability_div">';
			        	        html += '<img src="${path }/resources/images/card/'+ c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px">';
			        	        html += '<div class="front_ability">';
			        	        html += '<img src="${path }/resources/images/card/BATTLE.png" alt="" width="15px">';
			        	        html += '<span class="title title1">공격';
			        	        html += '</span>';
			        	        html += '<div class="graph1">';
			        	        html += '<span style="width:'+ c.card.cardBattleAbility + '%;">';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<span class="title title1 front_ability_size">'+c.card.cardBattleAbility+'%</span>';
			        	        html += '</div>';
			        	        html += '<div class="front_ability">';
			        	        html += '<img src="${path }/resources/images/card/DEFEND.png" alt="" width="15px">';
			        	        html += '<span class="title title1">수비';
			        	        html += '</span>';
			        	        html += '<div class="graph1">';
			        	        html += '<span style="width: '+c.card.cardDefendAbility+'%;">';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<span class="title title1 front_ability_size">'+c.card.cardDefendAbility+'%';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<div class="front_ability">';
			        	        html += '<img src="${path }/resources/images/card/SURVIVAL.png" alt="" width="15px">';
			        	        html += '<span class="title title1">생존';
			        	        html += '</span>';
			        	        html += '<div class="graph1">';
			        	        html += '<span style="width: '+c.card.cardsurvivalAbility+'%;">';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<span class="title title1 front_ability_size">'+c.card.cardsurvivalAbility+'%';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<div class="front_ability">';
			        	        html += '<img src="${path }/resources/images/card/GROWTH.png" alt="" width="15px">';
			        	        html += '<span class="title title1">성장';
			        	        html += '</span>';
			        	        html += '<div class="graph1">';
			        	        html += '<span style="width: '+c.card.cardGrowthAbility+'%;">';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<span class="title title1 front_ability_size">'+c.card.cardGrowthAbility+'%';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<div class="front_ability">';
			        	        html += '<img src="${path }/resources/images/card/ASSISTANT.png" alt="" width="15px">';
			        	        html += '<span class="title title1">어시';
			        	        html += '</span>';
			        	        html += '<div class="graph1">';
			        	        html += '<span style="width: '+c.card.cardAssistantAbility+'%;">';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '<span class="title title1 front_ability_size">'+c.card.cardAssistantAbility+'%';
			        	        html += '</span>';
			        	        html += '</div>';
			        	        html += '</div></div></div></div></div></div></div>';
			        	    });

			        	    document.querySelector('.card_img_div').innerHTML = html;
			        	    $(".pageBar_div").html(cardList.pageBar);
	   
			        	}

						var cards = document.querySelectorAll(".player_img");
						var backs = document.querySelectorAll(".back");

						for (var i = 0; i < cards.length; i++) {
							if (cards[i].getAttribute("src").includes("COMMON")) {
								backs[i].classList.add("common");
							} else if (cards[i].getAttribute("src").includes("NORMAL")) {
								backs[i].classList.add("normal");
							} else if (cards[i].getAttribute("src").includes("UNIQUE")) {
								backs[i].classList.add("unique");
							}
						}
						 
			        },
			        error: function (e) {
			           
			            console.log("요청 실패", e);
			        }
			    });
		}
	       
		
		/*카드 카테고리 중첩검색  */
		
		 $(".Initialization").change(function () {
	        // 모든 선택 값을 가져옵니다.
	        var ratingVal = $(".select_button_rating").val();
	        var teamVal = $(".select_button_team").val();
	        var playerVal = $(".select_button_player").val();
	        var seasonVal = $(".select_button_season").val();
	        var positionVal = $(".select_button_position").val();

	        
		   $.ajax({
	            type: "get",
	            url: "${path}/card/selectCategorie",
	            data: {
	                rating: ratingVal,
	                team: teamVal,
	                player: playerVal,
	                season: seasonVal,
	                position: positionVal
	            },
		        success: function (cardList) {
		      
		        	if (cardList.selectCategorie.length==0) {
		        	    let html = '<div class="have_card">';
		        	    html += '<p class="content fs-20">보유한 카드가 없습니다.</p>';
		        	    html += '</div>';
		        	    document.querySelector('.card_img_div').innerHTML = html; 
		        	} else {
		        	    let html = '';

		        	    cardList.selectCategorie.forEach(c => {
		        	    	let cardName1 =c.card.cardName
							let cardName2 = cardName1.toLowerCase();
		        	    	 
		        	        html += '<div class="card_img">';
		        	        html += '<div class="card_content_div">';
		        	        html += '<div class="card_content">';
		        	        html += '<div class="back">';
		        	        html += '<div class="back-content">';
		        	        html += '<svg stroke="#ffffff" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" height="50px" width="50px" fill="#ffffff">';
		        	        html += '<g stroke-width="0" id="SVGRepo_bgCarrier">';
		        	        html += '<g>';
		        	        html += '<g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier">';
		        	        html += '<g>';
		        	        html += '<g id="SVGRepo_iconCarrier">';
		        	        html += '<path d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">';
		        	        html += '</path>';
		        	        html += '</g>';
		        	        html += '</svg>'; 
		        	        html += '<div class="card_info_div">';
		        	        html += '<strong>';
		        	        html += '<img src="${path }/resources/images/card/' + c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px" class="player_img">';
		        	        html += '</strong>';
		        	        html += '<div class="card_player_info">';
		        	        html += '<p class="title  player_name">'+c.card.cardName+'<p>';
		        	        html += '<p class="content player_season">'+c.card.cardSeason+'</p>';
		        	        html += '<p class="content player_position">'+c.card.cardPosition+'</p>';
		        	        html += '<img src="${path }/resources/images/player/'+c.card.teamName+'_roster_'+cardName2+'1.png" alt="" class="player" width="170px" height="250px">';
		        	        html += '<img src="${path }/resources/images/logo/'+c.card.teamName+'_logo_small.png" alt="" class="player_team_logo">';
		        	        html += '<img src="${path }/resources/images/card/'+c.card.cardPosition+'.svg" alt="" class="player_position_img" width="20px" height="20px">';
		        	        html += '</div></div></div></div>';
		        	       	html += '<div class="front">';
		        	       	html += '<div class="front-content">';
		        	        html += '<div class="front_ability_total">';
		        	        html += '<div class="front_ability_div">';
		        	        html += '<img src="${path }/resources/images/card/'+ c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px">';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/BATTLE.png" alt="" width="15px">';
		        	        html += '<span class="title title1">공격';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width:'+ c.card.cardBattleAbility + '%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardBattleAbility+'%</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/DEFEND.png" alt="" width="15px">';
		        	        html += '<span class="title title1">수비';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardDefendAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardDefendAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/SURVIVAL.png" alt="" width="15px">';
		        	        html += '<span class="title title1">생존';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardsurvivalAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardsurvivalAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/GROWTH.png" alt="" width="15px">';
		        	        html += '<span class="title title1">성장';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardGrowthAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardGrowthAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/ASSISTANT.png" alt="" width="15px">';
		        	        html += '<span class="title title1">어시';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardAssistantAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardAssistantAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '</div></div></div></div></div></div></div>';
		        	    });

		        	    document.querySelector('.card_img_div').innerHTML = html;
		        	    $(".pageBar_div").html(cardList.pageBar);
   
		        	}

					var cards = document.querySelectorAll(".player_img");
					var backs = document.querySelectorAll(".back");

					for (var i = 0; i < cards.length; i++) {
						if (cards[i].getAttribute("src").includes("COMMON")) {
							backs[i].classList.add("common");
						} else if (cards[i].getAttribute("src").includes("NORMAL")) {
							backs[i].classList.add("normal");
						} else if (cards[i].getAttribute("src").includes("UNIQUE")) {
							backs[i].classList.add("unique");
						}
					}
					 
		        },
		        error: function (e) {
		           
		            console.log("요청 실패", e);
		        }
		    });
		});
		
		
		
		 const ajaxPaging = (no) => {
			  var ratingVal = $(".select_button_rating").val();
		        var teamVal = $(".select_button_team").val();
		        var playerVal = $(".select_button_player").val();
		        var seasonVal = $(".select_button_season").val();
		        var positionVal = $(".select_button_position").val();
		 $.ajax({
	            type: "get",
	            url: "${path}/card/selectCategorie",
	            data: {
	            	cPage : no,
	                rating: ratingVal,
	                team: teamVal,
	                player: playerVal,
	                season: seasonVal,
	                position: positionVal
	            },
		        success: function (cardList) {
		      
		        	if (cardList.selectCategorie.length==0) {
		        	    let html = '<div class="have_card">';
		        	    html += '<p class="content fs-20">보유한 카드가 없습니다.</p>';
		        	    html += '</div>';
		        	    document.querySelector('.card_img_div').innerHTML = html; 
		        	} else {
		        	    let html = '';

		        	    cardList.selectCategorie.forEach(c => {
		        	    	let cardName1 =c.card.cardName
							let cardName2 = cardName1.toLowerCase();
		        	    	 
		        	        html += '<div class="card_img">';
		        	        html += '<div class="card_content_div">';
		        	        html += '<div class="card_content">';
		        	        html += '<div class="back">';
		        	        html += '<div class="back-content">';
		        	        html += '<svg stroke="#ffffff" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" height="50px" width="50px" fill="#ffffff">';
		        	        html += '<g stroke-width="0" id="SVGRepo_bgCarrier">';
		        	        html += '<g>';
		        	        html += '<g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier">';
		        	        html += '<g>';
		        	        html += '<g id="SVGRepo_iconCarrier">';
		        	        html += '<path d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">';
		        	        html += '</path>';
		        	        html += '</g>';
		        	        html += '</svg>'; 
		        	        html += '<div class="card_info_div">';
		        	        html += '<strong>';
		        	        html += '<img src="${path }/resources/images/card/' + c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px" class="player_img">';
		        	        html += '</strong>';
		        	        html += '<div class="card_player_info">';
		        	        html += '<p class="title  player_name">'+c.card.cardName+'<p>';
		        	        html += '<p class="content player_season">'+c.card.cardSeason+'</p>';
		        	        html += '<p class="content player_position">'+c.card.cardPosition+'</p>';
		        	        html += '<img src="${path }/resources/images/player/'+c.card.teamName+'_roster_'+cardName2+'1.png" alt="" class="player" width="170px" height="250px">';
		        	        html += '<img src="${path }/resources/images/logo/'+c.card.teamName+'_logo_small.png" alt="" class="player_team_logo">';
		        	        html += '<img src="${path }/resources/images/card/'+c.card.cardPosition+'.svg" alt="" class="player_position_img" width="20px" height="20px">';
		        	        html += '</div></div></div></div>';
		        	       	html += '<div class="front">';
		        	       	html += '<div class="front-content">';
		        	        html += '<div class="front_ability_total">';
		        	        html += '<div class="front_ability_div">';
		        	        html += '<img src="${path }/resources/images/card/'+ c.card.cardClass.cardClassName +'.png" alt="" width="250px" height="350px">';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/BATTLE.png" alt="" width="15px">';
		        	        html += '<span class="title title1">공격';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width:'+ c.card.cardBattleAbility + '%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardBattleAbility+'%</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/DEFEND.png" alt="" width="15px">';
		        	        html += '<span class="title title1">수비';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardDefendAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardDefendAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/SURVIVAL.png" alt="" width="15px">';
		        	        html += '<span class="title title1">생존';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardsurvivalAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardsurvivalAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/GROWTH.png" alt="" width="15px">';
		        	        html += '<span class="title title1">성장';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardGrowthAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardGrowthAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<div class="front_ability">';
		        	        html += '<img src="${path }/resources/images/card/ASSISTANT.png" alt="" width="15px">';
		        	        html += '<span class="title title1">어시';
		        	        html += '</span>';
		        	        html += '<div class="graph1">';
		        	        html += '<span style="width: '+c.card.cardAssistantAbility+'%;">';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '<span class="title title1 front_ability_size">'+c.card.cardAssistantAbility+'%';
		        	        html += '</span>';
		        	        html += '</div>';
		        	        html += '</div></div></div></div></div></div></div>';
		        	    });

		        	    document.querySelector('.card_img_div').innerHTML = html;
		        	    $(".pageBar_div").html(cardList.pageBar);

		        	}

					var cards = document.querySelectorAll(".player_img");
					var backs = document.querySelectorAll(".back");

					for (var i = 0; i < cards.length; i++) {
						if (cards[i].getAttribute("src").includes("COMMON")) {
							backs[i].classList.add("common");
						} else if (cards[i].getAttribute("src").includes("NORMAL")) {
							backs[i].classList.add("normal");
						} else if (cards[i].getAttribute("src").includes("UNIQUE")) {
							backs[i].classList.add("unique");
						}
					}
					 
		        },
		        error: function (e) {
		           
		            console.log("요청 실패", e);
		        }
		    });
		 }
	     



	</script>




</body>
</html>
