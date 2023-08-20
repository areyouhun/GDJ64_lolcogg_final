<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/card/card.css">
<!------------------------------------>
<title>카드업적</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="card_main_img">
			<img src="${path }/resources/images/card/포리츠프랭크.png" alt=""
				width="100%" height="450px">
		</div>
		<div class="center-1280 background-img mainpage mainHeight">
			<div class="width-1280 ">
				<div class="card_main_size">
					<div class="card_catalog">
						<a href="${path }/card/selectCardById"><span class="content"
							onclick="">MY CARD</span></a> <a href="${path }/card/selectCard"><span class="content">CARD
								CATALOG</span></a> <a href="${path }/card/cardAchievement"><span class="content">ACHIEVEMENT</span></a>
					</div>
					<div class="card_categorie_title">
						<div class="">
							<p class="subTitle fs-20">ACHIEVEMENT</p>
							<div class="achievement_div">
								<p class="cardmainTitle fs-35 ">카드 업적</p>
							</div>

							<div class="achievement_button">
								<button class="button"
									onclick="location.assign('${path}/card/cardAchievement')">업적
									전체</button>

								<button class="button"
									onclick="location.assign('${path}/card/selectAchievement')">달성한
									업적</button>

								<button class="button"
									onclick="location.assign('${path}/card/achievementUnsatisfaction')">미달성
									업적</button>
							</div>
							<hr class="hr-margin">
							<c:set var="count" value="0" />

							<c:forEach var="c" items="${cardAchievement }">
								<c:if test="${c.achievement.achievementNo!=count }">

									<div class="achievement_List_div">
										<input type="hidden" value="${c.achievement.achievementNo }"
											class="achievementNo">
										<div class="achievement_List_left">
											<div class="achievement_detail_div">
												<p class="title achievement_title">${c.achievement.achievementName}</p>

												<%-- <div class="achievement_graph_div">
													<span class="content">달성도</span>
													<div class="achievement_graph front_stack">
														<span style="width: 4%;"></span>
													</div>
													<span class="title title1 front_ability_size">0/${cmCount }</span>
												</div> --%>
											</div>
										</div>



										<div class="achievement_List_right">
											<c:set var="count" value="0" />
											<c:forEach var="ca" items="${cardAchievement }">
												<c:set var="leader_cardName1" value="${ca.cardNo.cardName }" />
												<c:set var="leader_cardName2"
													value="${fn:toLowerCase(leader_cardName1)}" />

												<c:if
													test="${c.achievement.achievementNo==ca.achievement.achievementNo}">


													<div class="card_img">
														<div class="achievement_card_content_div">
															<div class="card_content">
																<input type="hidden" value="${ca.cardNo.cardNo }"
																	class="cardNo">
																<div class="back_achievement">
																	<div class="back-content_achievement">
																		<svg stroke="#ffffff"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			xmlns="http://www.w3.org/2000/svg"
																			viewBox="0 0 50 50" height="50px" width="50px"
																			fill="#ffffff">

                                                            <g
																				stroke-width="0" id="SVGRepo_bgCarrier"></g>

                                                            <g
																				stroke-linejoin="round" stroke-linecap="round"
																				id="SVGRepo_tracerCarrier"></g>

                                                            <g
																				id="SVGRepo_iconCarrier">

                                                                <path
																				d="M20.84375 0.03125C20.191406 0.0703125 19.652344 0.425781 19.21875 1.53125C18.988281 2.117188 18.5 3.558594 18.03125 4.9375C17.792969 5.636719 17.570313 6.273438 17.40625 6.75C17.390625 6.796875 17.414063 6.855469 17.40625 6.90625C17.398438 6.925781 17.351563 6.949219 17.34375 6.96875L17.25 7.25C18.566406 7.65625 19.539063 8.058594 19.625 8.09375C22.597656 9.21875 28.351563 11.847656 33.28125 16.78125C38.5 22 41.183594 28.265625 42.09375 30.71875C42.113281 30.761719 42.375 31.535156 42.75 32.84375C42.757813 32.839844 42.777344 32.847656 42.78125 32.84375C43.34375 32.664063 44.953125 32.09375 46.3125 31.625C47.109375 31.351563 47.808594 31.117188 48.15625 31C49.003906 30.714844 49.542969 30.292969 49.8125 29.6875C50.074219 29.109375 50.066406 28.429688 49.75 27.6875C49.605469 27.347656 49.441406 26.917969 49.25 26.4375C47.878906 23.007813 45.007813 15.882813 39.59375 10.46875C33.613281 4.484375 25.792969 1.210938 22.125 0.21875C21.648438 0.0898438 21.234375 0.0078125 20.84375 0.03125 Z M 16.46875 9.09375L0.0625 48.625C-0.09375 48.996094 -0.00390625 49.433594 0.28125 49.71875C0.472656 49.910156 0.738281 50 1 50C1.128906 50 1.253906 49.988281 1.375 49.9375L40.90625 33.59375C40.523438 32.242188 40.222656 31.449219 40.21875 31.4375C39.351563 29.089844 36.816406 23.128906 31.875 18.1875C27.035156 13.34375 21.167969 10.804688 18.875 9.9375C18.84375 9.925781 17.8125 9.5 16.46875 9.09375 Z M 17 16C19.761719 16 22 18.238281 22 21C22 23.761719 19.761719 26 17 26C15.140625 26 13.550781 24.972656 12.6875 23.46875L15.6875 16.1875C16.101563 16.074219 16.550781 16 17 16 Z M 31 22C32.65625 22 34 23.34375 34 25C34 25.917969 33.585938 26.730469 32.9375 27.28125L32.90625 27.28125C33.570313 27.996094 34 28.949219 34 30C34 32.210938 32.210938 34 30 34C27.789063 34 26 32.210938 26 30C26 28.359375 26.996094 26.960938 28.40625 26.34375L28.3125 26.3125C28.117188 25.917969 28 25.472656 28 25C28 23.34375 29.34375 22 31 22 Z M 21 32C23.210938 32 25 33.789063 25 36C25 36.855469 24.710938 37.660156 24.25 38.3125L20.3125 39.9375C18.429688 39.609375 17 37.976563 17 36C17 33.789063 18.789063 32 21 32 Z M 9 34C10.65625 34 12 35.34375 12 37C12 38.65625 10.65625 40 9 40C7.902344 40 6.960938 39.414063 6.4375 38.53125L8.25 34.09375C8.488281 34.03125 8.742188 34 9 34Z">
                                                                </path>

                                                            </g>

                                                        </svg>
																		<div class="card_info_div">
																			<strong> <img
																				src="${path }/resources/images/card/${ca.cardNo.cardClass.cardClassName }.png"
																				alt="" width="120px" height="145px"
																				class="player_img">
																			</strong>
																			<div class="card_player_info">
																				<p class="title achievement_player_name">${ca.cardNo.cardName}</p>
																				<p class="content achievement_player_position">${ca.cardNo.cardPosition }</p>
																				<img
																					src="${path }/resources/images/player/${ca.cardNo.teamName }_roster_${leader_cardName2 }1.png"
																					alt="" class="achievement_player" width="80px"
																					height="100px"> <img
																					src="${path }/resources/images/logo/${ca.cardNo.teamName }_logo_small.png"
																					alt="" class="achievement_player_team_logo"
																					width="15px" height="10px"> <img
																					src="${path }/resources/images/card/${ca.cardNo.cardPosition }.svg"
																					alt="" class="achievement_player_position_img"
																					width="10px" height="10px">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>

										</div>
										<div class="compensation_total">
											<div class="compensation_div">
												<c:if test="${c.compensation!=0}">
													<img src="${path }/resources/images/store/pointImg.png"
														alt="" width="25px" height="25px">
													<p>보상 : [${c.compensation}] point</p>
												</c:if>
												<c:if test="${c.compensation==0}">
													<img src="${path }/resources/images/card/업적아이콘.svg" alt=""
														width="25px" height="25px">

													<p>보상 : [${c.titleNo.titleName }] 칭호</p>
												</c:if>
											</div>
											<div class="receipt_button_div">
												<button class="compensation_button">
													<p>보상받기</p>
												</button>
											</div>
										</div>
									</div>
									<c:set var="count" value="${c.achievement.achievementNo}" />
								</c:if>
							</c:forEach>
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
	
	
	
	
 

    
	window.addEventListener("load", function() {
	    const cardElements = document.querySelectorAll(".cardNo");
	    const achievementElements = document.querySelectorAll(".achievementNo");
	    
	    const memberCardData = [
	        <c:forEach var="memberCard" items="${selectCardById}">
	            {
	                card: {
	                    cardNo: "${memberCard.card.cardNo}" // 실제 cardNo 값에 맞게 수정해야 함
	                }
	            },
	        </c:forEach>
	    ];
	    const memberAchievementData = [
	        <c:forEach var="memberAchievement" items="${selectMemberAchievement}">
	            {
	            	achievement: {
	            		achievementNo: "${memberAchievement.achievementNo}" 
	                }
	            },
	        </c:forEach>
	    ];
	    

	    for (let i = 0; i < cardElements.length; i++) {
	        const cardNoValue = cardElements[i].value;

	        for (let j = 0; j < memberCardData.length; j++) {
	            const memberCardNo = memberCardData[j].card.cardNo.toString();

	            if (cardNoValue === memberCardNo) {
	                const backAchievementElement = cardElements[i].nextElementSibling
	                const backContentAchievementElement = cardElements[i].nextElementSibling.firstElementChild;
							 			
							  			
	                    backAchievementElement.classList.remove("back_achievement");
	                    backAchievementElement.classList.add("back");
	                    backContentAchievementElement.classList.remove("back-content_achievement");
	                    backContentAchievementElement.classList.add("back-content");
	               
	                break;
	            }
	        }
	    }
	    const achievementListDivs = document.querySelectorAll(".achievement_List_div");

	    // "achievement_List_div" 요소에 대한 작업 수행
	    achievementListDivs.forEach(achievementListDiv => {
	        const backAchievementElement = achievementListDiv.querySelector(".back-content_achievement");

	        if (!backAchievementElement) {
	            const compensationButton = achievementListDiv.querySelector(".compensation_button");
	            const compensation = achievementListDiv.querySelector(".compensation_div");
	            const compensationP = compensation.querySelector("p").textContent;
	            const pattern = /\[(.*?)\]/;
	            const matches = compensationP.match(pattern);
	            const extractedText = matches[1];

	            if (compensationButton) {
	                compensationButton.classList.add("active");

	                function handleCompensationButtonClick(e) {
	                    const ach = this.closest(".achievement_List_div").firstElementChild.value;
	                    
	                    if (confirm("정말 보상을 받으시겠습니까?")) {
	                    	$.ajax({
	                    		  url: `${path}/card/achievementCompensation`,
	                    		  type: 'GET',
	                    		  data: {
	                    		    compensation: extractedText,
	                    		    ach: ach
	                    		  },
	                    		  success: function(response) {
	                    			  location.reload();
	                    		  },
	                    		  error: function(error) {
	                    		 
	                    		  }
	                    		});

	                    } else {
	                        return false;
	                    }
	                }

	                compensationButton.addEventListener("click", handleCompensationButtonClick);
	            }
	        }
	    });
	    
	    
	    for (let i = 0; i < achievementElements.length; i++) {
	        const achievementValue = achievementElements[i].value;

	        for (let j = 0; j < memberAchievementData.length; j++) {
	            const memberAchievementNo = memberAchievementData[j].achievement.achievementNo;

	            if (achievementValue === memberAchievementNo) {
	                const comAchievementElement = achievementElements[i].nextElementSibling.nextElementSibling;
	                const comAchievementElement1 = achievementElements[i].nextElementSibling.nextElementSibling.nextElementSibling;

	                // achievement 처리 코드 (클래스 변경 및 버튼 처리)
	                comAchievementElement.classList.remove("achievement_List_right");
	                comAchievementElement.classList.add("achievement_List_right_completion");
	                comAchievementElement1.classList.remove("compensation_total");
	                comAchievementElement1.classList.add("compensation_total_completion");
	                const compensation1 = comAchievementElement1.querySelector(".compensation_button");
	                const compensation2 = compensation1.querySelector("p");
	                compensation2.innerText = "수령완료";
	                compensation1.classList.add("active1");

	                compensation1.classList.add("disabled");
	                

	                break;
	            }
	        }
	    }

	
	});
	
	

	
	
	
	
	




	
	
	
		
	
		
		
		
	</script>
	<!-------------------------------------------->
</body>
</html>
