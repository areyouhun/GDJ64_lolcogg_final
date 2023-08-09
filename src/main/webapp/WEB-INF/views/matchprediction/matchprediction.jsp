<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="loginMember" scope="session" value="${loginMember }" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet"
	href="${path }/resources/css/matchprediction/matchprediction.css">
<!------------------------------------>
<title>승부예측</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="center-1280 background-img mainpage mainHeight bgImgDiv">
			<div class="width-1280 page-margin">
				<div class="mpTitleMargin"></div>
				<div class="mpTitle">
					<p class="subTitle fs-20">MATCH PREDICTION</p>
					<p class="mainTitle fs-35 mainTitleMargin mp">승부예측</p>
					<div class="mpInfo">
						<p class="content fs-20">LCK 10팀의 승패예측, 지금 바로 참여하세요!</p>
						<p class="content fs-20">예측성공 수에 따라 포인트가 지급됩니다.</p>
					</div>
					<p class="title fs-25">
						현재 <span class="title mpCountSpan"><fmt:formatNumber
								value="${playerCount }" pattern="#,###" />명</span> 참여중!
					</p>
				</div>

				<div class="weekChoiceDiv">
					<c:if test="${not empty week }">
						<c:forEach var="w" items="${week }">
							<c:if test="${nowWeek == w.msWeek}">
								<button id="${w.msWeek }" class="weekDiv weekChoice"
									onclick="weekChoice('${w.msWeek}');">
							</c:if>
							<c:if test="${nowWeek > w.msWeek}">
								<button id="${w.msWeek }" class="weekDiv"
									onclick="weekChoice('${w.msWeek}');">
							</c:if>
							<c:if test="${nowWeek < w.msWeek}">
								<button id="${w.msWeek }" class="weekDiv">
							</c:if>
							<c:if test="${!(nowWeek < w.msWeek)}">
								<div class="weekDivInfo">
									<p class="title fs-26 week">${w.msWeek }</p>
									<p class="content fs-16 weekSpan">주차</p>
								</div>
							</c:if>
							<c:if test="${nowWeek < w.msWeek}">
								<div class="weekDivInfo">
									<p class="title fs-26 week closeWeek">${w.msWeek }</p>
									<p class="content fs-16 weekSpan closeWeek">주차</p>
								</div>
							</c:if>
							<c:if test="${nowWeek == w.msWeek}">
								<p class="content fs-12 weekStatus weekChoiceP">진행중</p>
							</c:if>
							<c:if test="${nowWeek < w.msWeek}">
								<p class="content fs-12 weekStatus closeWeek">예정</p>
							</c:if>
							<c:if test="${nowWeek > w.msWeek}">
								<p class="content fs-12 weekStatus">종료</p>
							</c:if>
							</button>
						</c:forEach>
					</c:if>
				</div>

				<!-- 승부예측, 적중률 랭킹, 실시간 채팅 -->
				<div class="mpPageDiv">
					<div class="mpAllDiv">
						<div class="mpDiv">
							<c:if test="${not empty ms}">
								<c:forEach var="m" items="${ms }">
									<c:if test="${nowWeek == m.msWeek }">
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd(E)"
												var="todayDate" />
											<fmt:formatDate value="${m.msDate}" pattern="yyyy.MM.dd(E)"
												var="matchDate" />

											<div class="mpDateDiv">
												<c:if test="true">
													<span class="content fs-20">${matchDate }</span>
												</c:if>
												<hr class="dateHr">
											</div>

											<div class="statusTimeDiv">
												<div class="statusDiv ${(m.msDate < today || m.msHome == null || m.msAway == null) ? '' : 'nowRec'}">
													<p class="content fs-16">${m.msDate < today ? '종료' : (m.msHome == null || m.msAway == null) ? '예정' : '진행중'}</p>
												</div>
												<p class="content fs-20">
													<fmt:formatDate value="${m.msDate}" pattern="HH:mm" />
												</p>
											</div>
											<!-- 내 승부예측 표시 -->
											<c:set var="finishHome" value=""/>
											<c:set var="finishAway" value=""/>
											<c:set var="ingHome" value=""/>
											<c:set var="ingAway" value=""/>
											<c:set var="outlineHome" value=""/>
											<c:set var="outlineAway" value=""/>
											<c:forEach var="myMpCss" items="${myMp }">
												<c:if test="${m.msDate < today && m.msHome == myMpCss.mpTeam}">
													<!-- 홈팀투표(지난 예측) -->
													<c:set var="finishHome" value="finishHome"/>
													<c:set var="finishAway" value=""/>
												</c:if>
												<c:if test="${m.msDate < today && m.msAway == myMpCss.mpTeam}">
													<!-- 어웨이투표(지난 예측) -->
													<c:set var="finishAway" value="finishAway"/>
													<c:set var="finishHome" value=""/>
												</c:if>
												<c:if test="${m.msDate > today && m.msAway == myMpCss.mpTeam}">
													<!-- 어웨이투표(진행중인 예측) -->
													<c:set var="outlineHome" value="outlineHome"/>
													<c:set var="ingAway" value="ingAway"/>
												</c:if>
												<c:if test="${m.msDate > today && m.msHome == myMpCss.mpTeam}">
													<!-- 어웨이투표(진행중인 예측) -->
													<c:set var="outlineAway" value="outlineAway"/>
													<c:set var="ingHome" value="ingHome"/>
													<c:set var="outlineHome" value=""/>
													<c:set var="ingAway" value=""/>
												</c:if>
											</c:forEach>
											<!-- 한 경기 시작 -->
											<div id="${m.msNo }" class="mpMatchDiv ${m.msDate < today ? 'pointerEvents' : ''} }">
												<div id="${m.msNo }" class="homeDiv ${finishHome } ${ingHome} ${outlineHome}">
													<div class="logoDiv">
														<div class="logoImgDiv">
															<c:if test="${m.msHome != null}">
																<img
																	src="${path }/resources/images/logo/${m.msHome}_big.png">
															</c:if>
														</div>
													</div>
													<div class="homeStatusDiv">
														<c:if test="${m.msHome != null }">
															<p class="content">${m.msHome } ${m.team.homeRank }위</p>
														</c:if>
														<c:if test="${m.msHome == null }">
															<p class="content">TBD</p>
														</c:if>
														<p class="content fs-40 fw-bold">100%</p>
													</div>
													<div class="homeScoreDiv">
														<p class="title fs-45">${m.msHomeScore }</p>
													</div>
												</div>
												<div id="${m.msNo }" class="awayDiv ${finishAway } ${ingAway} ${outlineAway}">
													<div class="awayScoreDiv">
														<p class="title fs-45">${m.msAwayScore }</p>
													</div>
													<div class="awayStatusDiv">
														<c:if test="${m.msAway != null }">
															<p class="content awaySort">${m.msAway }
																${m.team.awayRank }위</p>
														</c:if>
														<c:if test="${m.msAway == null }">
															<p class="content awaySort">TBD</p>
														</c:if>
														<p class="content fs-40 fw-bold awaySort">100%</p>
													</div>
													<div class="awayLogoDiv">
														<div class="logoImgDiv">
															<c:if test="${m.msAway != null}">
																<img
																	src="${path }/resources/images/logo/${m.msAway}_big.png">
															</c:if>
														</div>
													</div>
												</div>
											</div>
											<!-- 한 경기 끝 -->
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div>

					<div class="rankDiv" style="width: 25%;">
						<div class="choiceRankDiv">
							<div class="choiceTitle">
								<p class="title fs-18">적중률 랭킹</p>
								<img src="${path }/resources/images/matchprediction/rank.png"
									width="25px">
							</div>
							<div class="rankContentDiv">
								<div class="rankTrDiv">
									<div class="centerSort" style="width: 15%;">
										<p class="content">순위</p>
									</div>
									<div class="leftSort" style="width: 50%;">
										<p class="content">닉네임</p>
									</div>
									<div class="centerSort" style="width: 20%;">
										<P class="content">적중 수</P>
									</div>
									<div class="centerSort" style="width: 20%; margin-left: 10px;">
										<p class="content">적중률</p>
									</div>
								</div>
								<c:forEach items="${mpSuccess }" var="mpRank" varStatus="status"
									end="9">
									<c:if test="${mpRank.nickname == loginMember.nickname }">
										<div class="rankInfoDiv borderRank">
									</c:if>
									<c:if test="${mpRank.nickname != loginMember.nickname }">
										<div class="rankInfoDiv">
									</c:if>
									<div class="centerSort" style="width: 15%;">
										<p class="title">${status.count }</p>
									</div>
									<div class="leftSort" style="width: 51%;">
										<p class="content">${mpRank.nickname }</p>
									</div>
									<div class="centerSort" style="width: 12%;">
										<P class="content">${mpRank.successPlay }/${mpRank.totalPlay }</P>
									</div>
									<div class="centerSort" style="width: 22%; margin-left: 10px;">
										<p class="content">${mpRank.successPlayPercentage }%</p>
									</div>
							</div>
							</c:forEach>
						</div>
					</div>

					<div class="chatDiv">
						<div class="chatTitle">
							<p class="title fs-18">실시간 채팅</p>
							<img src="${path }/resources/images/matchprediction/chatting.png"
								width="25px">
						</div>
						<button class="content chatBtn fs-20">
							실시간 채팅 참여하기<img
								src="${path }/resources/images/matchprediction/arrow.png"
								width="25px" style="margin-left: 3px;">
						</button>
						<button class="content chatBtn fs-20">
							실시간 채팅 참여하기<img
								src="${path }/resources/images/matchprediction/arrow.png"
								width="25px" style="margin-left: 3px;">
						</button>
					</div>
				</div>
			</div>


			<div class="myDiv">
				<c:if test="${not empty myMpSuccess}">
					<c:forEach var="my" items="${myMpSuccess }">
						<div class="myInfoDiv">
							<p class="title fs-20">나의 적중률 랭킹</p>
							<div class="myInfoDetailDiv">
								<div class="myRank">
									<span class="title fs-75 mpCountSpan"><fmt:formatNumber
											value="${my.rownum }" pattern="#,###" /></span> <span
										class="title fs-40">위</span>
								</div>
								<p class="content fs-18">
									총
									<fmt:formatNumber value="${playerCount }" pattern="#,###" />
									명 참여
								</p>
							</div>
						</div>
						<div class="myInfoDiv">
							<p class="title fs-20">나의 적중 횟수</p>
							<div class="myInfoChartDiv">
								<div class="chart">
									<canvas id="riskFactorChart"></canvas>
								</div>
								<div class="chartInfoDiv">
									<p class="content fs-18">적중 경기 수 ${my.successPlay }/${my.totalPlay }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty myMpSuccess}">
					<div class="myInfoDiv">
						<p class="title fs-20">나의 적중률 랭킹</p>
						<div class="myInfoDetailDiv">
							<p class="content fs-18">로그인 후 이용하실 수 있습니다.</p>
						</div>
					</div>
					<div class="myInfoDiv">
						<p class="title fs-20">나의 적중 횟수</p>
						<div class="myInfoChartDiv">
							<div class="chartInfoDiv">
								<p class="content fs-18">로그인 후 이용하실 수 있습니다.</p>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<!-- 댓글 -->
			<div class="mpCommentDiv">
				<div class="mpCommentDivSize">
					<p class="titleBlack mpCommentTitle fs-20">댓글</p>
					<!-- 댓글 작성 -->
					<!-- id="commentForm" 지움 나중에 에러나면 다시 추가 -->
					<form method="post" onsubmit="return fn_insertComment(${nowWeek}, event);">
						<div class="insertCommentDiv">
							<div class="commentDiv">
							<textarea type="text" class="insertComment contentBlack fs-20"
								style="resize: none;"></textarea>
								<%-- <div class="insertEmoDiv">
									<button type="button" class="emoXIcon"><img src="${path }/resources/images/matchprediction/xicon.png"></button>
								</div> --%>
							</div>
							<div class="countBtnDiv">
								<div class="countBtn">
									<span id="letterSpan" class="contentBlack fs-20">0/150</span>
								</div>
								<div class="iconBtn">
									<div class="emoDiv">
										<ion-icon name="happy-outline"></ion-icon>
										<div class="emo">
											<ul class="emoSort">
												<!-- 보유 이모티콘 -->
												<c:forEach var="emo" items="${myEmo }">
													<li><button class="emoBtn" type="button">
														<img id="${emo.emoticon.emoNo }" src="${path }/resources/images/emoticon/${emo.emoticon.emoFilename}" width="65px"
															height="65px"></li>
													</c:forEach>
												</button>
											</ul>
										</div>
									</div>
									<button class="commentBtn content">등록</button>
								</div>
							</div>
						</div>
					</form>
<!-- 댓글 목록 -->
  <div class="mpCommentListDiv">
    <div class='commentSort'>
      <p class='contentBlack fs-18 newMargin fw-bolder'>최신 순</p>
      <p class='contentBlack fs-18'>인기 순</p>
    </div>
    <hr class='hr-1Black hr-op'>

    <!-- 베스트 댓글 한 개 -->
    <c:if test="${not empty bestCommentList}">
      <c:forEach var="best" items="${bestCommentList}">
        <div class="commentList">
          <div>
            <img src="${path }/resources/upload/profile/${best.mpcWriter.profile}"
              style="width: 70px; height: 70px; border-radius: 70px;">
          </div>
          <div class="detailDiv">
            <div class="commentDetail">
              <div class="commentInfo">
                <p class="contentBlack fs-20 nickname">${best.mpcWriter.nickname }</p>
                <img src="${path }/resources/images/tier/${best.mpcWriter.tier.tierRulesNo.tierRulesImage}"
                  class="tierImg">
                <div class="bestDiv">
                  <p class="content fs-20">BEST</p>
                </div>
              </div>
              <div class="optionDiv">
                <button class="moreIconBtn">
                  <ion-icon class="moreIcon" name="ellipsis-horizontal" style="font-size: 28px;"></ion-icon>
                </button>
                <ul class="optionUl">
                  <li id="${best.mpcNo}">
                    <!-- 작성자 및 관리자 -->
                    <c:if test="${best.mpcWriter.email == loginMember.email || loginMember.authority.equals('관리자')}">
                      <button class="upBtn"><ion-icon class="optionIcon" name="create-outline"></ion-icon>수정</button>
                      <hr class="hr-1Black hr-op">
                      <button class="delBtn"><ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>삭제</button>
                    </c:if>
                    <!-- 작성자 x -->
                    <c:if test="${best.mpcWriter.email != loginMember.email}">
                      <button class="repBtn">
                        <ion-icon class="optionIcon" name="remove-circle-outline"></ion-icon>
                        신고
                      </button>
                    </c:if>
                  </li>
                </ul>
              </div>
            </div>

            <div>
              <p class="contentBlack fs-20 commentContent">${best.mpcContent }</p>
              <c:if test="${best.mpcEmoNo.emoFilename != null}">
                <img class="emoticon" src="${path }/resources/images/emoticon/${best.mpcEmoNo.emoFilename}"
                  width="100px" height="100px">
              </c:if>
            </div>
            
            <div class="dateBuffDiv">

              <div class='insertReplyDiv'>
                <span class="dateSpan">
                <c:if test="${best.mpcUpDate == null }">
                	<fmt:formatDate value="${best.mpcDate }" pattern="yyyy.MM.dd HH:mm" />
                </c:if>
                <c:if test="${best.mpcUpDate != null }">
                최근 수정일 <fmt:formatDate value="${best.mpcUpDate }" pattern="yyyy.MM.dd HH:mm" />
                </c:if>
                </span>
                <p id="${best.mpcNo }" class='insertReply' onclick='insertReply(event);'>답글쓰기</p>
                <p class='replyCount insertReply'>답글보기</p>
              </div>

              <div id="${best.mpcNo }" class="buffNerfDiv">
                <div class="buffDiv">
	            <c:set var="myBnSet" value=""/>
                <c:forEach var="bn" items="${myBn }">
	                <c:if test="${bn.bnMpcNo == best.mpcNo && bn.bnBn == 'B' }">
		                <c:set var="myBnSet" value="myBn"/>
	                </c:if>
                </c:forEach>
                  <button class="buffBtn ${myBnSet }">                
                    버프
                    <ion-icon name="caret-up-circle-outline" class="bnIcon"></ion-icon>
                  </button>
                  <p class="contentBlack">
                    <fmt:formatNumber value="${best.buffCount }" type="number" />
                  </p>
                </div>
                <div class="nerfDiv">
                  <c:set var="myBnSet" value=""/>
                <c:forEach var="bn" items="${myBn }">
	                <c:if test="${bn.bnMpcNo == best.mpcNo && bn.bnBn == 'N' }">
		                <c:set var="myBnSet" value="myBn"/>
	                </c:if>
                </c:forEach>
                  <button class="nerfBtn ${myBnSet }">         
                    너프
                    <ion-icon name="caret-down-circle-outline" class="bnIcon"></ion-icon>
                  </button>
                  <p class="contentBlack">
                    <fmt:formatNumber value="${best.nerfCount }" type="number" />
                  </p>
                </div>
              </div>
            </div>

            <div class='replyDiv'>
              <form id="${best.mpcNo }" class="replyForm" method="post"
                onsubmit="return fn_insertComment(${nowWeek}, event);">
                <div class="insertCommentDiv">
                  <div class="commentDiv">
                    <textarea type="text" class="insertComment contentBlack fs-20" style="resize: none;"></textarea>
                  </div>
                </div>
                <div class="countBtnDiv">
                  <div class="countBtn">
                    <span id="letterSpan" class="contentBlack fs-20">0/150</span>
                  </div>
                  <div class="iconBtn">
                    <div class="emoDiv">
                      <ion-icon name="happy-outline"></ion-icon>
                      <div class="emo">
                        <ul class="emoSort">
                          <c:forEach var="emo" items="${myEmo }">
                            <li><button class="emoBtn" type="button">
                                <img id="${emo.emoticon.emoNo }"
                                  src="${path }/resources/images/emoticon/${emo.emoticon.emoFilename}" width="65px"
                                  height="65px"></li>
                          </c:forEach>
                          </button>
                        </ul>
                      </div>
                    </div>
                    <button class="commentBtn content">등록</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <hr class="hr-1Black hr-op">

        <div class="replyBestAllDiv">
          <c:forEach var="reply" items="${commentList }">
            <c:if test="${reply.mpcRefNo != 0 && best.mpcNo == reply.mpcRefNo}">
              <!-- 대댓글 한 개 시작 -->
              <div class="commentList">
                <div style="width: 80px;"></div>
                <div>
                  <img src="${path }/resources/upload/profile/${reply.mpcWriter.profile}"
                    style="width: 70px; height: 70px; border-radius: 70px;">
                </div>
                <div class="detaildetailDiv">
                  <div class="commentDetail">
                    <div class="commentInfo">
                      <p class="contentBlack fs-20 nickname">${reply.mpcWriter.nickname }</p>
                      <img src="${path }/resources/images/tier/${reply.mpcWriter.tier.tierRulesNo.tierRulesImage}"
                        class="tierImg">
                    </div>
                    <div class="optionDiv">
                      <button class="moreIconBtn">
                        <ion-icon class="moreIcon" name="ellipsis-horizontal" style="font-size: 28px;"></ion-icon>
                      </button>
                      <ul class="optionUl">
                        <li id="${reply.mpcNo}" >
                          <!-- 작성자 및 관리자 -->
                          <c:if
                            test="${reply.mpcWriter.email == loginMember.email || loginMember.authority.equals('관리자')}">
                            <button class="upBtn"><ion-icon class="optionIcon" name="create-outline"></ion-icon>수정</button>
                            <hr class="hr-1Black hr-op">
                            <button class="delBtn"><ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>삭제</button>
                          </c:if>
                          <!-- 작성자 x -->
                          <c:if test="${reply.mpcWriter.email != loginMember.email}">
                            <button class="repBtn">
                              <ion-icon class="optionIcon" name="remove-circle-outline"></ion-icon>
                              신고
                            </button>
                          </c:if>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div>
                    <p class="contentBlack fs-20 commentContent">${reply.mpcContent }</p>
                    <c:if test="${reply.mpcEmoNo.emoFilename != null}">
                      <img class="emoticon" src="${path }/resources/images/emoticon/${reply.mpcEmoNo.emoFilename}"
                        width="100px" height="100px">
                    </c:if>
                  </div>
                  <div class="dateBuffDiv">
                  <div class='insertReplyDiv'>
                    <span class="dateSpan">
	                <c:if test="${reply.mpcUpDate == null }">
	                	<fmt:formatDate value="${reply.mpcDate }" pattern="yyyy.MM.dd HH:mm" />
	                </c:if>
	                <c:if test="${reply.mpcUpDate != null }">
	                최근 수정일 <fmt:formatDate value="${reply.mpcUpDate }" pattern="yyyy.MM.dd HH:mm" />
	                </c:if>
	                </span>
                  </div>
                    <div id="${reply.mpcNo }" class="buffNerfDiv">
                      <div class="buffDiv">
                        <c:set var="myBnSet" value=""/>
		                <c:forEach var="bn" items="${myBn }">
			                <c:if test="${bn.bnMpcNo == reply.mpcNo && bn.bnBn == 'B' }">
				                <c:set var="myBnSet" value="myBn"/>
			                </c:if>
		                </c:forEach>
		                  <button class="buffBtn ${myBnSet }">         
                          버프
                          <ion-icon name="caret-up-circle-outline" class="bnIcon"></ion-icon>
                        </button>
                        <p class="contentBlack">
                          <fmt:formatNumber value="${reply.buffCount }" type="number" />
                        </p>
                      </div>
                      <div class="nerfDiv">
                        <c:set var="myBnSet" value=""/>
                <c:forEach var="bn" items="${myBn }">
	                <c:if test="${bn.bnMpcNo == reply.mpcNo && bn.bnBn == 'N' }">
		                <c:set var="myBnSet" value="myBn"/>
	                </c:if>
                </c:forEach>
                  <button class="nerfBtn ${myBnSet }">         
                          너프
                          <ion-icon name="caret-down-circle-outline" class="bnIcon"></ion-icon>
                        </button>
                        <p class="contentBlack">
                          <fmt:formatNumber value="${reply.nerfCount }" type="number" />
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <hr class="hr-1Black hr-op">
              <!-- 대댓글 하나 끝 -->
            </c:if>
          </c:forEach>
        </div>
      </c:forEach>
    </c:if>

    <!-- 댓글 한 개 -->
    <c:forEach var="comment" items="${commentList }">
      <c:if test="${comment.mpcRefNo == 0 }">
        <div class="commentList">
          <div>
            <img src="${path }/resources/upload/profile/${comment.mpcWriter.profile}"
              style="width: 70px; height: 70px; border-radius: 70px;">
          </div>
          <div class="detailDiv">
            <div class="commentDetail">
              <div class="commentInfo">
                <p class="contentBlack fs-20 nickname">${comment.mpcWriter.nickname }</p>
                <img src="${path }/resources/images/tier/${comment.mpcWriter.tier.tierRulesNo.tierRulesImage}"
                  class="tierImg">
              </div>
              <div class="optionDiv">
                <button class="moreIconBtn">
                  <ion-icon class="moreIcon" name="ellipsis-horizontal" style="font-size: 28px;"></ion-icon>
                </button>
                <ul class="optionUl">
                  <li id="${comment.mpcNo}" >
                    <!-- 작성자 및 관리자 -->
                    <c:if test="${comment.mpcWriter.email == loginMember.email || loginMember.authority.equals('관리자')}">
                      <button class="upBtn"><ion-icon class="optionIcon" name="create-outline"></ion-icon>수정</button>
                      <hr class="hr-1Black hr-op">
                      <button class="delBtn"><ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>삭제</button>
                    </c:if>
                    <!-- 작성자 x -->
                    <c:if test="${comment.mpcWriter.email != loginMember.email}">
                      <button class="repBtn">
                        <ion-icon class="optionIcon" name="remove-circle-outline"></ion-icon>
                        신고
                      </button>
                    </c:if>
                  </li>
                </ul>
              </div>
            </div>

            <div>
              <p class="contentBlack fs-20 commentContent">${comment.mpcContent }</p>
              <c:if test="${comment.mpcEmoNo.emoFilename != null}">
                <img class="emoticon" src="${path }/resources/images/emoticon/${comment.mpcEmoNo.emoFilename}"
                  width="100px" height="100px">
              </c:if>
            </div>
            <div class="dateBuffDiv">

              <div class='insertReplyDiv'>
                <span class="dateSpan">
                <c:if test="${comment.mpcUpDate == null }">
                	<fmt:formatDate value="${comment.mpcDate }" pattern="yyyy.MM.dd HH:mm" />
                </c:if>
                <c:if test="${comment.mpcUpDate != null }">
                최근 수정일 <fmt:formatDate value="${comment.mpcUpDate }" pattern="yyyy.MM.dd HH:mm" />
                </c:if>
                </span>
                <p id="${comment.mpcNo }" class='insertReply' onclick='insertReply(event);'>답글쓰기</p>
                <p class='replyCount insertReply'>답글보기</p>
              </div>

              <div id="${comment.mpcNo }" class="buffNerfDiv">
                <div class="buffDiv">
                  <c:set var="myBnSet" value=""/>
                <c:forEach var="bn" items="${myBn }">
	                <c:if test="${bn.bnMpcNo == comment.mpcNo && bn.bnBn == 'B' }">
		                <c:set var="myBnSet" value="myBn"/>
	                </c:if>
                </c:forEach>
                  <button class="buffBtn ${myBnSet }">         
                    버프
                    <ion-icon name="caret-up-circle-outline" class="bnIcon"></ion-icon>
                  </button>
                  <p class="contentBlack">
                    <fmt:formatNumber value="${comment.buffCount }" type="number" />
                  </p>
                </div>
                <div class="nerfDiv">
                  <c:set var="myBnSet" value=""/>
                <c:forEach var="bn" items="${myBn }">
	                <c:if test="${bn.bnMpcNo == comment.mpcNo && bn.bnBn == 'N' }">
		                <c:set var="myBnSet" value="myBn"/>
	                </c:if>
                </c:forEach>
                  <button class="nerfBtn ${myBnSet }">         
                    너프
                    <ion-icon name="caret-down-circle-outline" class="bnIcon"></ion-icon>
                  </button>
                  <p class="contentBlack">
                    <fmt:formatNumber value="${comment.nerfCount }" type="number" />
                  </p>
                </div>
              </div>
            </div>

            <div class='replyDiv'>
              <form id="${comment.mpcNo }" class="replyForm" method="post"
                onsubmit="return fn_insertComment(${nowWeek}, event);">
                <textarea type="text" class="insertComment contentBlack fs-20" style="resize: none;"></textarea>
                <div class="countBtnDiv">
                  <div class="countBtn">
                    <span id="letterSpan" class="contentBlack fs-20">0/150</span>
                  </div>
                  <div class="iconBtn">
                    <div class="emoDiv">
                      <ion-icon name="happy-outline"></ion-icon>
                      <div class="emo">
                        <ul class="emoSort">
                          <c:forEach var="emo" items="${myEmo }">
                            <li><button class="emoBtn" type="button">
                                <img id="${emo.emoticon.emoNo }"
                                  src="${path }/resources/images/emoticon/${emo.emoticon.emoFilename}" width="65px"
                                  height="65px"></li>
                          </c:forEach>
                          </button>
                        </ul>
                      </div>
                    </div>
                    <button class="commentBtn content">등록</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <hr class="hr-1Black hr-op">
        <!-- 댓글 한 개 끝 -->

        <div class="replyAllDiv">
          <c:forEach var="reply" items="${commentList }">
            <c:if test="${reply.mpcRefNo != 0 && comment.mpcNo == reply.mpcRefNo}">
              <!-- 대댓글 한 개 시작 -->
              <div class="commentList">
                <div style="width: 80px;"></div>
                <div>
                  <img src="${path }/resources/upload/profile/${reply.mpcWriter.profile}"
                    style="width: 70px; height: 70px; border-radius: 70px;">
                </div>
                <div class="detaildetailDiv">
                  <div class="commentDetail">
                    <div class="commentInfo">
                      <p class="contentBlack fs-20 nickname">${reply.mpcWriter.nickname }</p>
                      <img src="${path }/resources/images/tier/${reply.mpcWriter.tier.tierRulesNo.tierRulesImage}"
                        class="tierImg">
                    </div>
                    <div class="optionDiv">
                      <button class="moreIconBtn">
                        <ion-icon class="moreIcon" name="ellipsis-horizontal" style="font-size: 28px;"></ion-icon>
                      </button>
                      <ul class="optionUl">
                        <li id="${reply.mpcNo}" >
                          <!-- 작성자 및 관리자 -->
                          <c:if
                            test="${reply.mpcWriter.email == loginMember.email || loginMember.authority.equals('관리자')}">
                            <button class="upBtn"><ion-icon class="optionIcon" name="create-outline"></ion-icon>수정</button>
                            <hr class="hr-1Black hr-op">
                            <button class="delBtn"><ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>삭제</button>
                          </c:if>
                          <!-- 작성자 x -->
                          <c:if test="${reply.mpcWriter.email != loginMember.email}">
                            <button class="repBtn">
                              <ion-icon class="optionIcon" name="remove-circle-outline"></ion-icon>
                              신고
                            </button>
                          </c:if>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div>
                    <p class="contentBlack fs-20 commentContent">${reply.mpcContent }</p>
                    <c:if test="${reply.mpcEmoNo.emoFilename != null}">
                      <img class="emoticon" src="${path }/resources/images/emoticon/${reply.mpcEmoNo.emoFilename}"
                        width="100px" height="100px">
                    </c:if>
                  </div>
                  <div class="dateBuffDiv">
                  <div class='insertReplyDiv'>
                    <span class="dateSpan">
		                <c:if test="${reply.mpcUpDate == null }">
		                	<fmt:formatDate value="${reply.mpcDate }" pattern="yyyy.MM.dd HH:mm" />
		                </c:if>
		                <c:if test="${reply.mpcUpDate != null }">
		                최근 수정일 <fmt:formatDate value="${reply.mpcUpDate }" pattern="yyyy.MM.dd HH:mm" />
		                </c:if>
	                </span>
                    </div>
                    <div id="${reply.mpcNo }" class="buffNerfDiv">
                      <div class="buffDiv">
                        <c:set var="myBnSet" value=""/>
                <c:forEach var="bn" items="${myBn }">
	                <c:if test="${bn.bnMpcNo == reply.mpcNo && bn.bnBn == 'B' }">
		                <c:set var="myBnSet" value="myBn"/>
	                </c:if>
                </c:forEach>
                  <button class="buffBtn ${myBnSet }">         
                          버프
                          <ion-icon name="caret-up-circle-outline" class="bnIcon"></ion-icon>
                        </button>
                        <p class="contentBlack">
                          <fmt:formatNumber value="${reply.buffCount }" type="number" />
                        </p>
                      </div>
                      <div class="nerfDiv">
                        <c:set var="myBnSet" value=""/>
                <c:forEach var="bn" items="${myBn }">
	                <c:if test="${bn.bnMpcNo == reply.mpcNo && bn.bnBn == 'N' }">
		                <c:set var="myBnSet" value="myBn"/>
	                </c:if>
                </c:forEach>
                  <button class="nerfBtn ${myBnSet }">         
                          너프
                          <ion-icon name="caret-down-circle-outline" class="bnIcon"></ion-icon>
                        </button>
                        <p class="contentBlack">
                          <fmt:formatNumber value="${reply.nerfCount }" type="number" />
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <hr class="hr-1Black hr-op">
              <!-- 대댓글 하나 끝 -->
            </c:if>
          </c:forEach>
        </div>
      </c:if>
    </c:forEach>
  </div>
			
						

					<!-- 페이지바 -->
					<!-- 데이터 10개 이하 페이지버튼 none처리 -->
					<div class="pageBar">
						<div class="pageAll">
							<ul class="page">
								<li><a href="#">&lt;</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#" class="nowPage">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&gt;</a></li>
							</ul>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
/* 로그인 세션값 */
const loginMember = "${sessionScope.loginMember}";

/* 댓글 권한 */
$(document).on("focus", ".insertComment", function(e){
	if(loginMember == ''){
		alert("로그인 후 이용할 수 있습니다.");
		$(".insertComment").blur();
	}
});

/* 승부예측 */
$(document).on("click", ".mpMatchDiv", function(e) {
	if(loginMember != ''){
		if($(e.target).hasClass('homeDiv') || $(e.target).parents('.homeDiv').hasClass('homeDiv')){
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("background-color", "#0D0063");
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').removeClass('ingAway');
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').removeClass('outlineAway');
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("background-color", "transparent");
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("outline", "3px solid var(--lol-teamblue)");
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("outline", "3px solid var(--lol-teamblue)");
			let choiceNo = $(e.target).parents('.mpMatchDiv').find('.homeDiv').attr('id');
			let team = 'home';
			$.ajax({
				type: "POST",
				url: "matchprediction/choice",
				data:{
					"choiceNo": choiceNo,
					"team": team,
					"email": '${loginMember.email}'
				},
				dataType: "json",
				success: function(data){
					console.log(data);
				},
				error: function(err){
	    			console.log("요청 실패", err);
	    		}
			})
		} else if($(e.target).hasClass('awayDiv') || $(e.target).parents('.awayDiv').hasClass('awayDiv')){
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("background-color", "#490000");
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').removeClass('ingHome');
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').removeClass('outlineHome');
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("background-color", "transparent");
			$(e.target).parents('.mpMatchDiv').find('.homeDiv').css("outline", "3px solid var(--lol-teamred)");
			$(e.target).parents('.mpMatchDiv').find('.awayDiv').css("outline", "3px solid var(--lol-teamred)");
			let choiceNo = $(e.target).parents('.mpMatchDiv').find('.homeDiv').attr('id');
			let team = 'away';
			$.ajax({
				type: "POST",
				url: "matchprediction/choice",
				data:{
					"choiceNo": choiceNo,
					"team": team,
					"email": '${loginMember.email}'
				},
				dataType: "json",
				success: function(data){
					console.log(data);
				},
				error: function(err){
	    			console.log("요청 실패", err);
	    		}
			})
		}
	} else {
		alert("로그인 후 이용하실 수 있습니다.");
	}
		
});	


/* 댓글 글자 수 제한 */
$(document).on("keyup", ".insertComment", function(e) {
	let content = $(e.target).val();
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('#letterSpan').text('0/150');
    } else {
    	$('#letterSpan').text(content.length + '/150');
    }
    
    // 글자수 제한
    if (content.length > 150) {
        $(e.target).val($(e.target).val().substring(0, 150));
        alert('댓글은 150자 이하로 작성해주세요.');
    };
});

/* 댓글 - 수정, 삭제 버튼 토글 */
$(document).on("click", ".moreIconBtn", function(e) {
    const optionUl = $(e.target).closest(".optionDiv").find(".optionUl");
    optionUl.toggle();
});

/* 댓글 수정 */
$(document).on("click", ".cUpBtn", function(e) {
	const qaNo = $(e.target).attr('id');
	console.log($(e.target).closest("ul").attr('id'));
});

/* 대댓글 입력창 */
function insertReply(e) {
    const replyDiv = $(e.target).parent().parent().siblings('.replyDiv');
    replyDiv.toggle(300);
}

/* 이모티콘 추가창 */
if(loginMember != ''){
	$(".emoDiv").on("click", function(e){
	     const emo = $(e.target).siblings('.emo');
	     emo.toggle();
	});
}
 
/* 이모티콘 선택 */
$(document).on("click", ".emoBtn", function(e) {
	/* console.log($(e.target).attr('id')); */
	
	const comEmo = $(e.target).parents('.insertCommentDiv').find('.commentDiv');
	const repEmo = $(e.target).parents('.replyForm').find('.commentDiv');
	console.log(comEmo);
	console.log(repEmo);
	$(".insertEmoDiv").remove();
	
    const emoDiv = $("<div>").addClass("insertEmoDiv");
    const xButton = $("<button>").attr("type", "button").addClass("emoXIcon");
    const xIcon = $("<img>").attr("src", "${path}/resources/images/matchprediction/xicon.png");
    xButton.append(xIcon);
    emoDiv.append(xButton);
    comEmo.append(emoDiv);
    repEmo.append(emoDiv);
	
    emoDiv.show();
	const imgUrl = $(e.target).attr('src');
	const imgId = $(e.target).attr('id');
	emoDiv.attr('id', imgId);
	emoDiv.css("background-image", "url('" + imgUrl + "')");
	
});

/* 이모티콘 취소 */
$(document).on("click", ".emoXIcon", function(e) {
	const emoDiv = $(e.target).parent().parent('.insertEmoDiv');
	emoDiv.remove();
});

 
/* 답글 토글 */
$(document).on("click", ".replyCount", function(e) {
	const reply = $(e.target).parent().parent().parent().parent().next().next('.replyAllDiv');
	reply.toggle(100);
});

/* 베스트 댓글 답글 토글 */
$(document).on("click", ".replyCount", function(e) {
	const reply = $(e.target).parent().parent().parent().parent().next().next('.replyBestAllDiv');
	reply.toggle(100);
});

/* chart */
if(loginMember != ''){
	let myMpSuccess = '${myMpSuccess}';
	if(myMpSuccess != null){
		let options = {
		    cutoutPercentage: 85,
		    rotation: Math.PI,
		
		    legend: {
		        display: false,
		    },
		    tooltips: {
		        enabled: true,
		    },
		
		};
		
		let totalPlay = [${myMpSuccess[0].successPlay}, ${myMpSuccess[0].failPlay}];
		let doughnutData = {
		    labels: [
		        "예측성공", "예측실패"
		    ],
		    datasets: [{
		        data: totalPlay,
		        backgroundColor: [
		        "#6454ED", "#ccc"
		        ],
		        hoverBackgroundColor: [
		        "#6454ED", "#ccc"
		        ],
		        borderWidth: 0,
		    }]
		};
		
		$('#riskFactorChartLoading').hide("fast");
		let ctx = $("#riskFactorChart").get(0).getContext("2d");
		
		let riskFactorChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: doughnutData,
		    options: options
		});
	}
} 

/* 댓글 등록 ajax */
const fn_insertComment=(week, e)=>{

	if (loginMember == '') {
      alert( '로그인 후 이용할 수 있습니다.' );
      return false;
    } else {
    	const writer = '${loginMember.email}';
    	const content = $(e.target).find('.insertComment').val();
    	const emoticon = $(e.target).find('.insertEmoDiv').attr('id');
    	const refNo = $(e.target).attr('id');
    	// console.log(week); // nowWeek
    	
    	$.ajax({
    		type: "POST",
    		url: "/matchprediction/insertComment",
    		data:{
    			"writer": writer,
    			"content": content,
    			"emoticon": emoticon,
    			"refNo": refNo,
    			"week": week
    		},
    		dataType: "json",
    		success : function(data){
				location.reload();
    		},
    		error: function(err){
    			console.log("요청 실패", err);
    		}
    	});
    	return false;
    }
}

/* 댓글 삭제 */
$(document).on("click", ".delBtn", function(e) {
	$(e.target).parents('.optionUl').css('display', 'none');

	const mpcNo = $(e.target).parents('li').attr('id');
	const removeDiv = $(e.target).parents('.commentList');
	const hr = $(e.target).parents('.commentList').next('hr');
	
	/* 베스트 댓글일 경우 둘 다 삭제되어야 함 */
	const mpcNoId = $('[id="' + mpcNo + '"].insertReply');
	const remove = mpcNoId.parents('.commentList');
	
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: "POST",
			url: "/matchprediction/deleteComment",
			data:{
				"mpcNo": mpcNo
			},
			dataType: "json",
			success : function(data){
				if(data > 0){
					alert("삭제 완료");
					remove.next('hr').remove();
					remove.remove();
				} else {
					alert("다시 한 번 시도해주세요.");
				}
			},
			error : function(err){
				console.log("요청 실패", err);
			}
		});
	} else {
		
	}
});

/* 댓글 수정 */
$(document).on("click", ".upBtn", function(e) {
	/* 댓글 번호 */
	const mpcNo = $(e.target).parents('li').attr('id');
	
	/* 수정 폼 열기 */
	$(e.target).parents('.optionUl').css('display', 'none');
	const updateDiv = $(e.target).parents('.commentList').find('.commentDetail').next();
	const oriContent = updateDiv.find('p').text();
	const emoImage = updateDiv.find('img').attr('src');
	
	updateDiv.addClass('replyDiv');
	updateDiv.css({'display':'block', 'margin-bottom':'15px'});
	updateDiv.html('');	
	
	let replyDiv = $('<div>').addClass('replyDiv');
	
	let form = $('<form>').attr({
		class: 'replyForm',
		method: 'post'
	});
		  
	let insertCommentDiv = $('<div>').addClass('insertCommentDiv');
	
	let commentDiv = $('<div>').addClass('commentDiv');
	
	let textarea = $('<textarea>').attr({
		type: 'text',
		class: 'insertComment contentBlack fs-20',
		style: 'resize: none;'
	});
	textarea.val(oriContent);
	commentDiv.append(textarea);
	
	if(emoImage != undefined){
		let insertEmoDiv = $('<div>').addClass('insertEmoDiv');
		insertEmoDiv.css({
		    'display': 'block',
		    'backgroundImage': 'url(${path}' + emoImage + ')'
		}).attr('id', mpcNo);
		let button = $('<button>').addClass('emoXIcon').attr('type', 'button');
		let img = $('<img>').attr('src', '${path}/resources/images/matchprediction/xicon.png');
		
		button.append(img);
		insertEmoDiv.append(button);
		commentDiv.append(insertEmoDiv);
	}
		  
	insertCommentDiv.append(commentDiv);

	let countBtnDiv = $('<div>').addClass('countBtnDiv');
	
	let countBtn = $('<div>').addClass('countBtn');
	
	let letterSpan = $('<span>').attr({
	  id: 'letterSpan',
	  class: 'contentBlack fs-20'
	}).text('0/150');
		  
	countBtn.append(letterSpan);
	
	let iconBtn = $('<div>').addClass('iconBtn');
	iconBtn.css('width', '150px');
	// let emoDiv = $('<div>').addClass('emoDiv');
	
	// let ionIcon = $('<ion-icon>').attr('name', 'happy-outline');
	
	// let emo = $('<div>').addClass('emo');
	
	/* let ul = $('<ul>').addClass('emoSort');
		  
		var li = $('<li>').append(
			$('<button>').addClass('emoBtn').attr('type', 'button').append(
				$('<img>').attr({
					src: '${path }/resources/images/emoticon/${emo.emoticon.emoFilename}',
					width: '65px',
					height: '65px'
				})
			)
		);
		ul.append(li); */
	
	// emo.append(ul);
		  
	// emoDiv.append(ionIcon, emo);
	
	let submitBtn = $('<button>').attr('type', 'button').addClass('commentBtn content').text('등록').on('click', fn_updateComment);
	
	let cancelBtn = $('<button>').attr('type', 'button').addClass('commentBtn content').text('취소');
	
	iconBtn.append(submitBtn, cancelBtn);
	countBtnDiv.append(countBtn, iconBtn);
	form.append(insertCommentDiv, countBtnDiv);

	updateDiv.append(form);
	
	/* 최근 수정일로 변경 */
	const date = commentDiv.parents('.replyDiv').siblings('.dateBuffDiv').find('.dateSpan');
	
	/* 이모티콘 삭제 */
	let emoDelete = 'N';
	if(emoImage == undefined){
		let emoDelete = 'Y'; 
	}
	
	/* 댓글 수정 ajax */
	function fn_updateComment(){
		$.ajax({
			type: "POST",
			url: "/matchprediction/updateComment",
			data:{
				"mpcNo" : mpcNo,
				"email" : '${loginMember.email}',
				"content" : textarea.val(),
				"emoDelete" : emoDelete
			},
			dataType: "json",
			success : function(data){
				/* 날짜  */
				function getDateFormat() {
				    let d = new Date(data.mpcDate);
				    return d.getFullYear() + '.' + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : '0' + (d.getMonth() + 1)) + '.' + (d.getDate() > 9 ? d.getDate().toString() : '0' + d.getDate().toString());
				}
				
				const mpcUpDate = data.mpcUpDate;
				const newDate = new Date(mpcUpDate);
				const mpcUpDateTime = new Intl.DateTimeFormat('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: false }).format(newDate);
				
				commentDiv = $(e.target).parents('.detailDiv').find('.replyDiv:first');
				commentDiv.find('.replyForm').css('display', 'none');
				commentDiv.removeClass('replyDiv');
				let updateContent = $("<p>").addClass('contentBlack fs-20 commentContent').text(data.mpcContent);
				
				console.log(${data.mpcEmoNo.emoFilename});
				commentDiv.append(updateContent);
				if(data.mpcEmoNo != null){
					let updateEmo = $('<img>').addClass('emoticon').attr({
										src: "${path }/resources/images/emoticon/" + data.mpcEmoNo.emoFilename,
										width: '100px',
										height: '100px'
									});
					commentDiv.append(updateEmo);
				}
				date.text('최근 수정일 ' + getDateFormat(data.mpcUpDate) + ' ' + mpcUpDateTime);
			},
			error : function(err){
				console.log("요청 실패", err);
			}
		});
	}
	
	
});


/* 댓글 버프 */
$(document).on("click", ".buffBtn", function(e) {
	const mpcNo = $(e.target).parents('.buffNerfDiv').attr('id');
	
	if (loginMember == '') {
		alert( '로그인 후 이용할 수 있습니다.' );
	} else {
		$.ajax({
			type: "POST",
			url: "/matchprediction/commentBn",
			data:{
				"bn" : 'B',
				"mpcNo" : mpcNo,
				"email" : '${loginMember.email}'
			},
			dataType: "json",
			success : function(data){
				const buffBtn = $(e.target).closest('.buffBtn');
				const nerfBtn = buffBtn.parent().siblings('.nerfDiv').find('.nerfBtn');
				buffBtn.css('border', '3px solid var(--lol-mainblue)');
				nerfBtn.css('border', '2px solid #ccc');
				buffBtn.siblings('.contentBlack').text(data.buffCount);
				nerfBtn.siblings('.contentBlack').text(data.nerfCount);
			},
			error : function(err){
				console.log("요청 실패", err);
			}
		});
	}
});

/* 댓글 너프 */
$(document).on("click", ".nerfBtn", function(e) {
	const mpcNo = $(e.target).parents('.buffNerfDiv').attr('id');
	
	if (loginMember == '') {
		alert( '로그인 후 이용할 수 있습니다.' );
	} else {
		$.ajax({
			type: "POST",
			url: "/matchprediction/commentBn",
			data:{
				"bn" : 'N',
				"mpcNo" : mpcNo,
				"email" : '${loginMember.email}'
			},
			dataType: "json",
			success : function(data){
				const nerfBtn = $(e.target).closest('.nerfBtn');
				const buffBtn = nerfBtn.parent().siblings('.buffDiv').find('.buffBtn');
				nerfBtn.css('border', '3px solid var(--lol-mainblue)');
				buffBtn.css('border', '2px solid #ccc');
				buffBtn.siblings('.contentBlack').text(data.buffCount);
				nerfBtn.siblings('.contentBlack').text(data.nerfCount);
			},
			error : function(err){
				console.log("요청 실패", err);
			}
		});
	}
});



/* 주차 변경하기 */
function weekChoice(week){
	/* 버튼에 클래스 추가 weekChoice, 버튼에 삭제? */
	
	$.ajax({
	    type: "POST",
	    url: "/matchPrediction/week",
	    data: { week: week },
	    dataType: "json",
	    success: function(data) {
			const mpDiv = $(".mpDiv");
			mpDiv.html('');
			let html = '';
			
			console.log(data);
			
			data[0].forEach(function(item) {
				
				/* 날짜  */
				function getDateFormat() {
				    let d = new Date(item.msDate);
				    return d.getFullYear() + '.' + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : '0' + (d.getMonth() + 1)) + '.' + (d.getDate() > 9 ? d.getDate().toString() : '0' + d.getDate().toString()) + '(' + '일월화수목금토'.charAt(d.getDay()) + ')';
				}
				
				/* 시간 */
				const msDate = item.msDate;
				const date = new Date(msDate);
				const msTime = new Intl.DateTimeFormat('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: false }).format(date);
				const today = new Date();
				
				let mpDateDiv = $('<div>').addClass('mpDateDiv');

				let dateSpan = $('<span>').addClass('content fs-20').text(getDateFormat(item.msDate));
				let dateHr = $('<hr>').addClass('dateHr');

				mpDateDiv.append(dateSpan, dateHr);

				let statusTimeDiv = $('<div>').addClass('statusTimeDiv');
				
				let statusDiv;
				if (date < today) {
					statusDiv = $('<div>').addClass('statusDiv');
					let statusP = $('<p>').addClass('content fs-16').text('종료');
				    statusDiv.append(statusP);
				} else if (item.msHome == null || item.msAway == null) {
					statusDiv = $('<div>').addClass('statusDiv');
					let statusP = $('<p>').addClass('content fs-16').text('예정');
				    statusDiv.append(statusP);
				} else {
					statusDiv = $('<div>').addClass('statusDiv nowRec');
					let statusP = $('<p>').addClass('content fs-16').text('진행중');
				    statusDiv.append(statusP);
				}

				let msTimeP = $('<p>').addClass('content fs-20').text(msTime);
				statusTimeDiv.append(statusDiv, msTimeP);
	
				let mpMatchDiv = $('<div>').attr('id', '${m.msNo }').addClass(date < today ? 'mpMatchDiv pointerEvents' : 'mpMatchDiv');

				let homeDiv = $('<div>').addClass('homeDiv');
				let logoDiv = $('<div>').addClass('logoDiv');
				let logoImgDiv = $('<div>').addClass('logoImgDiv');

				let homeLogoImg = (item.msAway != null) ? $('<img>').attr('src', '${path}/resources/images/logo/' + item.msHome + '_big.png') : '';

				logoImgDiv.append(homeLogoImg);
				logoDiv.append(logoImgDiv);

				let homeStatusDiv = $('<div>').addClass('homeStatusDiv');
				let homeStatusP1 = $('<p>').addClass('content').text((item.msHome != null) ? (item.msHome + ' ' + item.team.homeRank + '위') : 'TBD');
				let homeStatusP2 = $('<p>').addClass('content fs-40 fw-bold').text('100%');
				homeStatusDiv.append(homeStatusP1, homeStatusP2);

				let homeScoreDiv = $('<div>').addClass('homeScoreDiv');
				let homeScoreP = $('<p>').addClass('title fs-45').text(item.msHomeScore);
				homeScoreDiv.append(homeScoreP);

				homeDiv.append(logoDiv, homeStatusDiv, homeScoreDiv);
				/*  */
				let awayDiv = $('<div>').addClass('awayDiv');
				let awayScoreDiv = $('<div>').addClass('awayScoreDiv');
				let awayScoreP = $('<p>').addClass('title fs-45').text(item.msAwayScore);
				awayScoreDiv.append(awayScoreP);
				
				let awayStatusDiv = $('<div>').addClass('awayStatusDiv');
				let awayStatusP1 = $('<p>').addClass('content awaySort').text((item.msAway != null) ? (item.msAway + ' ' + item.team.awayRank + '위') : 'TBD');
				let awayStatusP2 = $('<p>').addClass('content fs-40 fw-bold awaySort').text('100%');
				awayStatusDiv.append(awayStatusP1, awayStatusP2);
				
				let awayLogoDiv = $('<div>').addClass('awayLogoDiv');
				let awayLogoImgDiv = $('<div>').addClass('logoImgDiv');
				let awayLogoImg = (item.msAway != null) ? $('<img>').attr('src', '${path}/resources/images/logo/' + item.msAway + '_big.png') : '';
				awayLogoImgDiv.append(awayLogoImg);
				awayLogoDiv.append(awayLogoImgDiv);
				
				awayDiv.append(awayScoreDiv, awayStatusDiv, awayLogoDiv);

				mpMatchDiv.append(homeDiv, awayDiv);
				
				let finishHome = "";
				let finishAway = "";
				let ingHome = "";
				let ingAway = "";
				let outlineHome = "";
				let outlineAway = "";

				data[1].forEach(function(mp) {
					console.log(mp);
					console.log(item);
					if(item.msNo == mp.mpMsNo){
					    if (date < today && mp.mpTeam == item.msHome) {
					        finishHome = 'finishHome';
					        finishAway = '';
					    } else if (date < today && mp.mpTeam == item.msAway) {
					        finishAway = 'finishAway';
					        finishHome = '';
					    } else if (date > today && mp.mpTeam == item.msHome) {
					        outlineAway = 'outlineAway';
					        ingHome = 'ingHome';
					        outlineHome = '';
					        ingAway = '';
					    } else if (date > today && mp.mpTeam == item.msAway) {
					        outlineHome = 'outlineHome';
					        ingAway = 'ingAway';
					        outlineAway = '';
					        ingHome = '';
					    } else {
					    	outlineHome = '';
					        ingAway = '';
					        outlineAway = '';
					        ingHome = '';
					    }
				    }
				});

				homeDiv.addClass(finishHome + ' ' + ingHome + ' ' + outlineHome);
				awayDiv.addClass(finishAway + ' ' + ingAway + ' ' + outlineAway);
				mpDiv.append(mpDateDiv);
				mpDiv.append(statusTimeDiv);
				mpDiv.append(mpMatchDiv);
			});
			
			$(".weekDiv").removeClass("weekChoice");
			$(".weekDiv").each(function() {
				const weekChoice = $(this).attr('id')
				if(weekChoice == week){
					$(this).addClass("weekChoice");
				}
			});
			
	    },
	    error: function(err) {
	        console.log("요청 실패", err);
	    }
	});
}

</script>
	<!-- icon -->
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<!-------------------------------------------->
</body>
</html>
