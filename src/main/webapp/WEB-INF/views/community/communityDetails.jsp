<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="d" value="${boardDetails}" />

<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet"
	href="${path }/resources/css/community/communityMain.css">
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<!------------------------------------>
<title>SAMPLE</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="center-1280 background-img mainpage mainHeight">
			<div class="width-1280 board-page-margin community-centent">
				<div class="community-center">
					<div class="community-center-size">
						<div class="board-details-title">
							<div class="board-title-member">
								<p class="board-details-top fs-25 content">${d.cmBoardTitle }</p>
								<div class="optionDiv">
									<button class="moreIconBtn">
										<ion-icon class="moreIcon" name="ellipsis-horizontal"
											style="font-size: 28px;"></ion-icon>
									</button>
									<ul class="optionUl">
										<li>
											<!-- 작성자 및 관리자 --> <c:if
												test="${ loginMember.nickname.equals(d.cmBoardWriter.nickname)}">
												<button
													onclick="location.assign('${path}/community/boardModify?boardNo=${d.cmBoardNo }')">
													<ion-icon class="optionIcon" name="create-outline"></ion-icon>
													수정
												</button>
												<hr class="hr-1Black hr-op">
												<button onclick="removeCheck()">
													<ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>
													삭제
												</button>
											</c:if> <!-- 작성자 x --> <c:if
												test="${ !loginMember.nickname.equals(d.cmBoardWriter.nickname)}">
												<button>
													<ion-icon class="optionIcon" name="remove-circle-outline"></ion-icon>
													신고
												</button>
											</c:if>
										</li>
									</ul>
								</div>
							</div>

							<div class="board-bottom">
								<div>
									<span>${d.cmBoardCategories}</span><span class="Backslash">|</span>
									<input type="hidden" value="${d.cmBoardNo }" class="boardNo">
									<span><span class="designation">[${d.cmBoardWriter.titleName }]</span>${d.cmBoardWriter.nickname }</span>
									<span class="Backslash">|</span><span>${d.timeDifference }</span>
								</div>
								<div class="board-bottom-right">
									<div>
										<span>조회 ${d.cmBoardReadCount }</span><span class="Backslash">|</span>
										<span>댓글 ${d.replycut }</span><span class="Backslash">|</span><span>추천
											${d.b }</span>
									</div>
								</div>
							</div>
						</div>

						<hr class="hr-1">
						<div class="board-content">
							<c:if test="${d.cmVideoAddress!=null }">
								<iframe width="1000" height="500" src="${d.cmVideoAddress }"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
									allowfullscreen></iframe>
							</c:if>
							<p class="board_content_p">${d.cmBoardContent }</p>

						</div>
						<hr class="hr-1">
						<div class="buffNerfDiv board-buffNerfDiv">
							<div class="buffDiv">
								<button class="boardBuffBtn buffBtn">
									버프
									<ion-icon name="caret-up-circle-outline" class="bnIcon"></ion-icon>
								</button>
								<p class="content bf">${d.b }</p>
							</div>
							<div class="nerfDiv">
								<button class="buffBtn boardNerfBtn">
									너프
									<ion-icon name="caret-down-circle-outline" class="bnIcon"></ion-icon>
								</button>
								<p class="content nf">${d.n }</p>
							</div>
						</div>
						<div class="report-sharing">
							<div class="reportbtn">
								<svg xmlns="http://www.w3.org/2000/svg" width="21" height="25"
									viewBox="0 0 21 25" fill="none">
                                <path
										d="M12.1835 15.132V5.35798M12.1835 15.132L18.3876 19.3923C18.7942 19.6716 19.3002 19.3187 19.3002 18.7559V1.73414C19.3002 1.17128 18.7942 0.818413 18.3876 1.09767L12.1835 5.35798M12.1835 15.132H5.06672C2.82073 15.132 1 12.944 1 10.245C1 7.54597 2.82073 5.35798 5.06672 5.35798H12.1835"
										stroke="#EEEEEE" stroke-width="2" />
                                <path
										d="M5.8362 21.6082L5.06641 15.1328H9.13313L9.82162 20.9241C9.99486 22.3814 9.05382 23.6851 7.82889 23.6851C6.82715 23.6851 5.97786 22.7999 5.8362 21.6082Z"
										stroke="#EEEEEE" stroke-width="2" />
                            </svg>


								<span class="content">신고</span>
							</div>
							<div class="clip">
								<svg xmlns="http://www.w3.org/2000/svg" width="19" height="21"
									viewBox="0 0 19 21" fill="none" onclick="clip()">
                                <path
										d="M15.2992 13.7896C14.5481 13.7903 13.8273 14.1451 13.2915 14.7776L5.73868 10.7335C5.73868 10.5956 5.73868 10.4808 5.73868 10.3429C5.73868 10.205 5.73868 10.0901 5.73868 9.96375L13.2915 5.90814C13.7646 6.46537 14.3836 6.80865 15.0434 6.87966C15.7031 6.95067 16.3631 6.74504 16.911 6.29769C17.4589 5.85034 17.8611 5.18886 18.0493 4.42558C18.2374 3.66231 18.1999 2.84431 17.9431 2.11051C17.6863 1.37672 17.226 0.772363 16.6405 0.400099C16.0549 0.0278341 15.3802 -0.089389 14.7309 0.0683385C14.0816 0.226066 13.4978 0.649019 13.0785 1.26536C12.6593 1.88171 12.4305 2.65344 12.4311 3.44949V3.84012L4.87823 7.88424C4.47512 7.40831 3.964 7.08609 3.40903 6.95803C2.85407 6.82997 2.27998 6.90177 1.75885 7.16442C1.23772 7.42707 0.792771 7.86886 0.479854 8.43434C0.166937 8.99982 0 9.66379 0 10.3429C0 11.022 0.166937 11.6859 0.479854 12.2514C0.792771 12.8169 1.23772 13.2587 1.75885 13.5214C2.27998 13.784 2.85407 13.8558 3.40903 13.7277C3.964 13.5997 4.47512 13.2775 4.87823 12.8015L12.4311 16.8571V17.2363C12.4311 17.918 12.5993 18.5844 12.9144 19.1512C13.2296 19.718 13.6775 20.1597 14.2016 20.4206C14.7257 20.6815 15.3024 20.7497 15.8588 20.6167C16.4151 20.4838 16.9262 20.1555 17.3273 19.6735C17.7284 19.1914 18.0016 18.5773 18.1123 17.9087C18.2229 17.2401 18.1661 16.5471 17.949 15.9173C17.732 15.2875 17.3643 14.7492 16.8927 14.3705C16.421 13.9917 15.8665 13.7896 15.2992 13.7896ZM15.2992 2.30059C15.4883 2.30059 15.6731 2.36798 15.8304 2.49422C15.9876 2.62046 16.1101 2.79989 16.1825 3.00983C16.2548 3.21976 16.2738 3.45077 16.2369 3.67363C16.2 3.8965 16.1089 4.10121 15.9752 4.26189C15.8415 4.42256 15.6712 4.53198 15.4857 4.57632C15.3003 4.62065 15.108 4.59789 14.9333 4.51094C14.7586 4.42398 14.6093 4.27672 14.5043 4.08779C14.3992 3.89885 14.3432 3.67672 14.3432 3.44949C14.3432 3.14479 14.4439 2.85256 14.6232 2.6371C14.8025 2.42164 15.0456 2.30059 15.2992 2.30059ZM2.87052 11.4918C2.68143 11.4918 2.49659 11.4244 2.33937 11.2982C2.18215 11.1719 2.05961 10.9925 1.98725 10.7825C1.91489 10.5726 1.89595 10.3416 1.93284 10.1187C1.96973 9.89588 2.06079 9.69117 2.19449 9.53049C2.3282 9.36981 2.49855 9.26039 2.68401 9.21606C2.86946 9.17173 3.06169 9.19448 3.23639 9.28144C3.41109 9.3684 3.5604 9.51565 3.66545 9.70459C3.77051 9.89353 3.82658 10.1157 3.82658 10.3429C3.82658 10.6476 3.72585 10.9398 3.54656 11.1553C3.36726 11.3707 3.12408 11.4918 2.87052 11.4918ZM15.2992 18.3852C15.1101 18.3852 14.9253 18.3178 14.7681 18.1916C14.6108 18.0653 14.4883 17.8859 14.4159 17.6759C14.3436 17.466 14.3246 17.235 14.3615 17.0121C14.3984 16.7893 14.4895 16.5846 14.6232 16.4239C14.7569 16.2632 14.9272 16.1538 15.1127 16.1095C15.2981 16.0651 15.4904 16.0879 15.6651 16.1748C15.8398 16.2618 15.9891 16.409 16.0941 16.598C16.1992 16.7869 16.2553 17.009 16.2553 17.2363C16.2553 17.541 16.1545 17.8332 15.9752 18.0487C15.7959 18.2641 15.5528 18.3852 15.2992 18.3852Z"
										fill="#EEEEEE" />
                            </svg>
								<span class="content" onclick="clip()">공유</span>
							</div>

						</div>


					</div>

				</div>
			</div>
		</div>
		<!-- 댓글 목록 -->
		<div
			class="width-1280 background-img mainpage mainHeight board_comment">
			<div class="board-comment">
				<div class="board-comment-size">
					<!-- 댓글 -->
					<div class="qnaCommentDiv">
						<div class="qnaCommentDivSize">
							<p class="titleBlack qnaCommentTitle fs-20">댓글</p>
							<!-- 댓글 작성 -->

							<div class="insertCommentDiv">
								<div class="insertComment contentBlack fs-20"
									contenteditable="true" oninput="updateCount()"></div>
								<div class="countBtnDiv">
									<div class="countBtn">
										<span class="contentBlack fs-20" id="charCount">0/150</span>
									</div>
									<div class="iconBtn">
										<ul class="openIcon">
											<li><img
												src="${path}/resources/images/emoticon/Poro_sticker_angry.png"
												style="width: 50px; height: 40px; border-radius: 70px;"
												onclick="insertImage('${path}/resources/images/emoticon/Poro_sticker_angry.png')">
											</li>
										</ul>
										<ion-icon name="happy-outline" class="iconOpenBtn"></ion-icon>
										<button class="commentBtn content" onclick="">등록</button>
									</div>
								</div>
							</div>


							<!-- 댓글 목록 -->
							<c:if test="${not empty selectBoardComment}">
								<div class="commentSort">
									<p class="fs-18 newMargin">최신 순</p>
									<p class="fs-18">인기 순</p>
								</div>
								<div class="qnaCommentListDiv">
									<!-- 댓글 한 개 -->
									<c:forEach var="c" items="${selectBoardComment }">
										<c:if test="${c.cmCommentRefNo==0 }">
											
											<hr class="hr-2">
											<div class="commentList">
												<div class="profileImg">
													<img
														src="${path }/resources/images/upload/member/${c.cmCommentWriter.profile}"
														style="width: 50px; height: 50px; border-radius: 70px;">
												</div>
												<div class="detailDiv">
													<div class="commentDetail">
														<div class="commentInfo">
															<p class="contentBlack fs-20 nickname">${c.cmCommentWriter.nickname }</p>

															<img
																src="${path }/resources/images/tier/${c.cmCommentWriter.tier.tierRulesNo.tierRulesImage }"
																class="tierImg">
														</div>
														<div class="optionDiv">
															<button class="moreIconBtn">
																<ion-icon class="moreIcon" name="ellipsis-horizontal"
																	style="font-size: 28px;"></ion-icon>
															</button>

															<ul class="optionUl" style="z-index: 1;">
																<li>
																	<!-- 작성자 및 관리자 --> <c:if
																		test="${ loginMember.nickname.equals(c.cmCommentWriter.nickname)}">
																		<button class="updateCm">
																			<ion-icon class="optionIcon" name="create-outline"></ion-icon>
																			수정
																		</button>
																		<hr class="hr-1Black hr-op">
																		<button class="cmRemoveBtn">
																			<ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>
																			삭제
																		</button>
																	</c:if> <c:if
																		test="${ !loginMember.nickname.equals(c.cmCommentWriter.nickname)}">
																		<!-- 작성자 x -->
																		<button>
																			<ion-icon class="optionIcon"
																				name="remove-circle-outline"></ion-icon>
																			신고
																		</button>
																	</c:if>
																</li>
															</ul>
														</div>
													</div>


													<p class="contentBlack fs-20 commentContent">${c.cmCommentContent }</p>

													<div class="dateBuffDiv">
														<input type="hidden" value="${c.cmCommentNo }"
															class="commentNo"> <span class="dateSpan">${c.timeDifference }</span>
														<div class="buffNerfDiv">

															<button class="buffBtn reply">답글</button>

															<div class="buffDiv">
																<button class="buffBtn cb">
																	버프
																	<ion-icon name="caret-up-circle-outline" class="bnIcon"></ion-icon>
																</button>
																<p class="contentBlack buff">${c.cb }</p>
															</div>
															<div class="nerfDiv">
																<button class="buffBtn cn">
																	너프
																	<ion-icon name="caret-down-circle-outline"
																		class="bnIcon"></ion-icon>
																</button>
																<p class="contentBlack nerf">${c.cn }</p>
															</div>
														</div>
													</div>
												</div>
											</div>


											<!-- 답글작성-->
											<div class="insertCommentDiv insertReply">
												<input type="hidden" value="${c.cmCommentNo }"
													class="commentNo">
												<div class="replyContent contentBlack fs-20"
													contenteditable="true" oninput="updateCount1()"></div>
												<div class="countBtnDiv">
													<div class="countBtn">
														<span class="contentBlack fs-20" id="charCount1">0/150</span>
													</div>
													<div class="replyIconBtn">
														<ul class="replyOpenIcon">
															<li><img
																src="${path}/resources/images/emoticon/Poro_sticker_angry.png"
																style="width: 50px; height: 40px; border-radius: 70px;"
																onclick="insertImage1('${path}/resources/images/emoticon/Poro_sticker_angry.png')">
															</li>
														</ul>
														<ion-icon name="happy-outline" class="replyIconOpenBtn"></ion-icon>
														<button class="content replyBtn" onclick="">등록</button>
													</div>
												</div>
											</div>

											<!-- 수정작성 -->
											<div class="insertCommentDiv updateComment">
												<input type="hidden" value="${c.cmCommentNo }"
													class="commentNo">
												<div class="updateContent contentBlack fs-20 replyContent"
													"
													contenteditable="true"
													oninput="updateCount1(this)">${c.cmCommentContent}</div>
												<div class="countBtnDiv">
													<div class="countBtn">
														<span class="contentBlack fs-20" id="charCount1">0/150</span>
													</div>
													<div class="replyIconBtn">
														<ul class="replyOpenIcon">
															<li><img
																src="${path}/resources/images/emoticon/Poro_sticker_angry.png"
																style="width: 50px; height: 40px; border-radius: 70px;"
																onclick="insertImage1('${path}/resources/images/emoticon/Poro_sticker_angry.png')">
															</li>
														</ul>
														<ion-icon name="happy-outline" class="replyIconOpenBtn"></ion-icon>
														<button class="content updateBtn" onclick="">등록</button>
													</div>
												</div>
											</div>
										</c:if>




										<!-- 대댓글 한 개 -->
										<c:forEach var="b" items="${selectBoardComment }">
											<c:if test="${c.cmCommentNo==b.cmCommentRefNo }">
												<div class="commentList">
													<div style="width: 80px;"></div>
													<div class="">
														<img
															src="${path }/resources/images/upload/member/${c.cmCommentWriter.profile}.png"
															style="width: 50px; height: 50px; border-radius: 70px;">
													</div>
													<div class="detaildetailDiv">
														<div class="commentDetail">
															<div class="commentInfo">
																<p class="contentBlack fs-20 nickname">${b.cmCommentWriter.nickname }</p>
																<img
																	src="${path }/resources/images/tier/${b.cmCommentWriter.tier.tierRulesNo.tierRulesImage }"
																	class="tierImg">
															</div>
															<div class="optionDiv">
																<button class="moreIconBtn">
																	<ion-icon class="moreIcon" name="ellipsis-horizontal"
																		style="font-size: 28px;"></ion-icon>
																</button>
																<ul class="optionUl">
																	<li>
																		<!-- 작성자 및 관리자 --> <c:if
																			test="${ loginMember.nickname.equals(b.cmCommentWriter.nickname)}">
																			<button class="refUpdateBtn">
																				<ion-icon class="optionIcon" name="create-outline"></ion-icon>
																				수정
																			</button>
																			<hr class="hr-1Black hr-op">
																			<button class="removeBtn">
																				<ion-icon class="optionIcon"
																					name="trash-bin-outline"></ion-icon>
																				삭제
																			</button>
																		</c:if> <c:if
																			test="${ !loginMember.nickname.equals(b.cmCommentWriter.nickname)}">
																			<!-- 작성자 x -->
																			<button>
																				<ion-icon class="optionIcon"
																					name="remove-circle-outline"></ion-icon>
																				신고
																			</button>
																		</c:if>
																	</li>
																</ul>
															</div>
														</div>
														<p class="contentBlack fs-20 commentContent"
															style="display: inline-flex;">${b.cmCommentContent }</p>
														<div class="dateBuffDiv">
															<span class="dateSpan">${b.timeDifference}</span>
														</div>
													</div>
												</div>
												<!--대댓글수정  -->
												<div class="insertCommentDiv updateComment">
													<input type="hidden" value="${b.cmCommentNo }"
														class="commentNo">

													<div class="updateContent contentBlack fs-20 replyContent"
														contenteditable="true" oninput="updateCount1(this)">${ b.cmCommentContent}</div>

													<div class="countBtnDiv">
														<div class="countBtn">
															<span class="contentBlack fs-20" id="charCount1">0/150</span>
														</div>
														<div class="replyIconBtn">
															<ul class="replyOpenIcon">
																<li><img
																	src="${path}/resources/images/emoticon/Poro_sticker_angry.png"
																	style="width: 50px; height: 40px; border-radius: 70px;"
																	onclick="insertImage1('${path}/resources/images/emoticon/Poro_sticker_angry.png')">
																</li>
															</ul>
															<ion-icon name="happy-outline" class="replyIconOpenBtn"></ion-icon>
															<button class="content updateBtn" onclick="">등록</button>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</c:forEach>
								</div>



							</c:if>
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
	
	function updateCount1(target) {
	    const imgCount = target.querySelectorAll('img').length;
	    const textCount = target.innerText.length;
	    const count = textCount + imgCount;
	    const charCountEl = target.parentNode.querySelector('.countBtn .contentBlack');
	    charCountEl.textContent = count + "/150";
	    return count;
	}

	function insertImage1(target, imgSrc) {
	    const currentCount = updateCount1(target);
	    if (currentCount >= 150) {
	        alert('150자를 초과하였습니다.');
	        return;
	    }

	    const imgElem = document.createElement('img');
	    imgElem.src = imgSrc;
	    imgElem.style.width = '50px';
	    imgElem.style.height = '40px';
	    imgElem.style.borderRadius = '70px';
	    target.appendChild(imgElem);
	    updateCount1(target);
	    target.focus();

	    const selection = window.getSelection();
	    const range = document.createRange();
	    range.setStartAfter(imgElem);
	    range.setEndAfter(imgElem);
	    selection.removeAllRanges();
	    selection.addRange(range);
	}

	document.querySelectorAll('.replyContent').forEach(replyContent => {
	    replyContent.addEventListener('input', function(e) {
	        const currentCount = updateCount1(e.target);
	        if (currentCount > 150) {
	            const lastChild = e.target.lastChild;
	            if (lastChild.nodeName === "IMG") {
	                e.target.removeChild(lastChild);
	            } else {
	                e.target.innerText = e.target.innerText.slice(0, -1);
	            }
	            updateCount1(e.target);
	            alert('150자를 초과하였습니다.');

	            const selection = window.getSelection();
	            const range = document.createRange();
	            range.selectNodeContents(e.target);
	            range.collapse(false);
	            selection.removeAllRanges();
	            selection.addRange(range);
	        }
	    });
	});

	document.querySelectorAll('.replyOpenIcon img').forEach(img => {
	    img.addEventListener('click', function(e) {
	        const replyContent = e.target.closest('.insertCommentDiv').querySelector('.replyContent');
	        insertImage1(replyContent, e.target.src);
	    });
	});


	
	

		
	
		

		function updateCount() {
			const commentDiv = document.querySelector('.insertComment');
			const imgCount = commentDiv.querySelectorAll('img').length; // 이미지를 한 글자로 취급합니다.
			const textCount = commentDiv.innerText.length;
			const count = textCount + imgCount;
			const charCountEl = document.getElementById('charCount');
			charCountEl.textContent = count + "/150";
			return count;
		}

		function insertImage(imgSrc) {
			const currentCount = updateCount();
			if (currentCount >= 150) {
				alert('150자를 초과하였습니다.');
				return;
			}
			const commentDiv = document.querySelector('.insertComment');
			const imgElem = document.createElement('img');
			imgElem.src = imgSrc;
			imgElem.style.width = '50px';
			imgElem.style.height = '40px';
			imgElem.style.borderRadius = '70px';
			commentDiv.appendChild(imgElem);
			updateCount();
			commentDiv.focus();
		}

		document.querySelector('.insertComment').addEventListener('input',
				function(e) {
					const currentCount = updateCount();
					if (currentCount > 150) {
						const lastChild = this.lastChild;
						if (lastChild.nodeName === "IMG") {
							this.removeChild(lastChild);
						} else {
							this.innerText = this.innerText.slice(0, -1);
						}
						updateCount();
						alert('150자를 초과하였습니다.');

						// 맨 마지막 작성한 글자로 커서를 이동시킵니다.
						const selection = window.getSelection();
						const range = document.createRange();
						range.selectNodeContents(this);
						range.collapse(false); // true로 설정하면 커서가 맨 앞으로 이동합니다. false로 설정하면 커서가 맨 뒤로 이동합니다.
						selection.removeAllRanges();
						selection.addRange(range);
					}
				});
		function insertImage(imgSrc) {
			const currentCount = updateCount();
			if (currentCount >= 150) {
				alert('150자를 초과하였습니다.');
				return;
			}
			const commentDiv = document.querySelector('.insertComment');
			const imgElem = document.createElement('img');
			imgElem.src = imgSrc;
			imgElem.style.width = '50px';
			imgElem.style.height = '40px';
			imgElem.style.borderRadius = '70px';
			commentDiv.appendChild(imgElem);
			updateCount();
			commentDiv.focus();

			// Move the cursor to the right of the image
			const selection = window.getSelection();
			const range = document.createRange();
			range.setStartAfter(imgElem);
			range.setEndAfter(imgElem);
			selection.removeAllRanges();
			selection.addRange(range);
		}

		function clip() {
			var url = window.location.href;
			var textarea = document.createElement("textarea");
			document.body.appendChild(textarea);
			textarea.value = url;
			textarea.select();
			document.execCommand("copy");
			document.body.removeChild(textarea);
			alert("링크가 복사되었습니다.");
		};

		//삭제확인
		function removeCheck() {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				location
						.assign('${path}/community/boardRemove?boardNo=${d.cmBoardNo}');

			} else {

				return false;

			}

		}

		$(".moreIconBtn").click(function(e) {
			const ul=$(e.target).closest('.optionDiv').find(".optionUl");
			
			 ul.toggle();
		});
		$(".iconOpenBtn").click(function() {
			$(".openIcon").toggle();
		});

		$(".replyIconOpenBtn").click(function(e) {
			$(".replyOpenIcon").toggle();

		});
		var actions = true;
		$(".updateCm").click(function(e) {
			const cm = $(e.target).parent().parent().parent().parent().parent().parent().next().next()
			console.log(cm)
			if(actions){				
			cm.css("display","flex")
			}else {
			cm.css("display","none")
			}
			actions = !actions;
			
		});
		var actions = true;
		$(".refUpdateBtn").click(function(e) {
			const cm = $(e.target).parent().parent().parent().parent().parent().parent().next()
			console.log(cm)
			if(actions){				
			cm.css("display","flex")
			}else {
			cm.css("display","none")
			}
			actions = !actions;
			
		});

			
		var action = true;
		
		$(".reply").click(function(e) {
		 	const p = $(e.target).parent().parent().parent().parent().next();
		 	$(".insertReply").css("display", "none");
		 	$(".replyContent").innerText="";
			const loginMember = '${loginMember}';
			if (loginMember != "" && action) {
				p.css("display", "flex");
				$(".replyContent").text(" ");
				$(".replyOpenIcon").css("display","none")
			} else if (!action) {
				p.css("display", "none");
				$(".replyContent").text(" ");
				$(".replyOpenIcon").css("display","block")
			} else if (loginMember == "") {
				alert("로그인후 이용할수있습니다..");
			}
			action = !action;
			
		});


		
		const boardNo = $(".boardNo").val();

		$(".boardBuffBtn").click(function() {
			$.ajax({
				type : "get",
				url : "${path}/community/insertBuff",
				data : {
					boardNo : boardNo,
				},
				success : function(data) {
					$(".bf").text(data);
				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		});

		$(".boardNerfBtn").click(function() {
			$.ajax({
				type : "get",
				url : "${path}/community/insertNerf",
				data : {
					boardNo : boardNo,
				},
				success : function(data) {
					$(".nf").text(data);
				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		});
		
		$(".cb").click(function(e) {
			const commentNo =  $(e.target).closest('.dateBuffDiv').find(".commentNo").val();
			const buff =  $(e.target).next();
			
			 $.ajax({
				type : "get",
				url : "${path}/community/insertCb",
				data : {
					commentNo : commentNo,
				},
				success : function(data) {
				
					buff.text(data);
				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			}); 
		});
		
		$(".cn").click(function(e) {
			const commentNo =  $(e.target).closest('.dateBuffDiv').find(".commentNo").val();
			const nerf =  $(e.target).next();
			console.log(nerf)
			$.ajax({
				type : "get",
				url : "${path}/community/insertCn",
				data : {
					commentNo : commentNo,
				},
				success : function(data) {
					nerf.text(data);
				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		});
		

		/* $(".iconOpenBtn").click(function() {
			$.ajax({
				type : "post",
				url : "${path }/community/selectIcon",
				data : {
					boardNo : boardNo,
					
				},
				success : function(data) {
					$(".bf").text(data);
				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		}); */

		$(".commentBtn").click(function() {
		    const comment = $(".insertComment").html();
	
		    $.ajax({
		        type: "post",
		        url: "${path}/community/insertComment",
		        data: {
		            boardNo: boardNo,
		            comment: comment
		        },
		        success: function test(c) {
		           
		        },
		        error: function() {
		            alert("로그인후 이용가능합니다.");
		        },
		        complete: function() {
		        	function updateCount1(target) {
		        	    const imgCount = target.querySelectorAll('img').length;
		        	    const textCount = target.innerText.length;
		        	    const count = textCount + imgCount;
		        	    const charCountEl = target.parentNode.querySelector('.countBtn .contentBlack');
		        	    charCountEl.textContent = count + "/150";
		        	    return count;
		        	}

		        	function insertImage1(target, imgSrc) {
		        	    const currentCount = updateCount1(target);
		        	    if (currentCount >= 150) {
		        	        alert('150자를 초과하였습니다.');
		        	        return;
		        	    }

		        	    const imgElem = document.createElement('img');
		        	    imgElem.src = imgSrc;
		        	    imgElem.style.width = '50px';
		        	    imgElem.style.height = '40px';
		        	    imgElem.style.borderRadius = '70px';
		        	    target.appendChild(imgElem);
		        	    updateCount1(target);
		        	    target.focus();

		        	    const selection = window.getSelection();
		        	    const range = document.createRange();
		        	    range.setStartAfter(imgElem);
		        	    range.setEndAfter(imgElem);
		        	    selection.removeAllRanges();
		        	    selection.addRange(range);
		        	}

		        	document.querySelectorAll('.replyContent').forEach(replyContent => {
		        	    replyContent.addEventListener('input', function(e) {
		        	        const currentCount = updateCount1(e.target);
		        	        if (currentCount > 150) {
		        	            const lastChild = e.target.lastChild;
		        	            if (lastChild.nodeName === "IMG") {
		        	                e.target.removeChild(lastChild);
		        	            } else {
		        	                e.target.innerText = e.target.innerText.slice(0, -1);
		        	            }
		        	            updateCount1(e.target);
		        	            alert('150자를 초과하였습니다.');

		        	            const selection = window.getSelection();
		        	            const range = document.createRange();
		        	            range.selectNodeContents(e.target);
		        	            range.collapse(false);
		        	            selection.removeAllRanges();
		        	            selection.addRange(range);
		        	        }
		        	    });
		        	});

		        	document.querySelectorAll('.replyOpenIcon img').forEach(img => {
		        	    img.addEventListener('click', function(e) {
		        	        const replyContent = e.target.closest('.insertCommentDiv').querySelector('.replyContent');
		        	        insertImage1(replyContent, e.target.src);
		        	    });
		        	});
     	

		        		function updateCount() {
		        			const commentDiv = document.querySelector('.insertComment');
		        			const imgCount = commentDiv.querySelectorAll('img').length; // 이미지를 한 글자로 취급합니다.
		        			const textCount = commentDiv.innerText.length;
		        			const count = textCount + imgCount;
		        			const charCountEl = document.getElementById('charCount');
		        			charCountEl.textContent = count + "/150";
		        			return count;
		        		}

		        		function insertImage(imgSrc) {
		        			const currentCount = updateCount();
		        			if (currentCount >= 150) {
		        				alert('150자를 초과하였습니다.');
		        				return;
		        			}
		        			const commentDiv = document.querySelector('.insertComment');
		        			const imgElem = document.createElement('img');
		        			imgElem.src = imgSrc;
		        			imgElem.style.width = '50px';
		        			imgElem.style.height = '40px';
		        			imgElem.style.borderRadius = '70px';
		        			commentDiv.appendChild(imgElem);
		        			updateCount();
		        			commentDiv.focus();
		        		}

		        		document.querySelector('.insertComment').addEventListener('input',
		        				function(e) {
		        					const currentCount = updateCount();
		        					if (currentCount > 150) {
		        						const lastChild = this.lastChild;
		        						if (lastChild.nodeName === "IMG") {
		        							this.removeChild(lastChild);
		        						} else {
		        							this.innerText = this.innerText.slice(0, -1);
		        						}
		        						updateCount();
		        						alert('150자를 초과하였습니다.');

		        						// 맨 마지막 작성한 글자로 커서를 이동시킵니다.
		        						const selection = window.getSelection();
		        						const range = document.createRange();
		        						range.selectNodeContents(this);
		        						range.collapse(false); // true로 설정하면 커서가 맨 앞으로 이동합니다. false로 설정하면 커서가 맨 뒤로 이동합니다.
		        						selection.removeAllRanges();
		        						selection.addRange(range);
		        					}
		        				});
		        		function insertImage(imgSrc) {
		        			const currentCount = updateCount();
		        			if (currentCount >= 150) {
		        				alert('150자를 초과하였습니다.');
		        				return;
		        			}
		        			const commentDiv = document.querySelector('.insertComment');
		        			const imgElem = document.createElement('img');
		        			imgElem.src = imgSrc;
		        			imgElem.style.width = '50px';
		        			imgElem.style.height = '40px';
		        			imgElem.style.borderRadius = '70px';
		        			commentDiv.appendChild(imgElem);
		        			updateCount();
		        			commentDiv.focus();

		        			// Move the cursor to the right of the image
		        			const selection = window.getSelection();
		        			const range = document.createRange();
		        			range.setStartAfter(imgElem);
		        			range.setEndAfter(imgElem);
		        			selection.removeAllRanges();
		        			selection.addRange(range);
		        		}

		        		function clip() {
		        			var url = window.location.href;
		        			var textarea = document.createElement("textarea");
		        			document.body.appendChild(textarea);
		        			textarea.value = url;
		        			textarea.select();
		        			document.execCommand("copy");
		        			document.body.removeChild(textarea);
		        			alert("링크가 복사되었습니다.");
		        		};

		        		//삭제확인
		        		function removeCheck() {
		        			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
		        				location
		        						.assign('${path}/community/boardRemove?boardNo=${d.cmBoardNo}');

		        			} else {

		        				return false;

		        			}

		        		}

		        		$(".moreIconBtn").click(function(e) {
		        			const ul=$(e.target).closest('.optionDiv').find(".optionUl");
		        			 ul.toggle();
		        		});
		        		$(".iconOpenBtn").click(function() {
		        			$(".openIcon").toggle();
		        		});

		        		$(".replyIconOpenBtn").click(function(e) {
		        			$(".replyOpenIcon").toggle();

		        		});
		        		var actions = true;
		        		$(".updateCm").click(function(e) {
		        			const cm = $(e.target).parent().parent().parent().parent().parent().parent().next().next()
		        			console.log(cm)
		        			if(actions){				
		        			cm.css("display","flex")
		        			}else {
		        			cm.css("display","none")
		        			}
		        			actions = !actions;
		        			
		        		});
		        		var actions = true;
		        		$(".refUpdateBtn").click(function(e) {
		        			const cm = $(e.target).parent().parent().parent().parent().parent().parent().next()
		        			console.log(cm)
		        			if(actions){				
		        			cm.css("display","flex")
		        			}else {
		        			cm.css("display","none")
		        			}
		        			actions = !actions;
		        			
		        		});

		        			
		        		var action = true;
		        		
		        		$(".reply").click(function(e) {
		        		 	const p = $(e.target).parent().parent().parent().parent().next();
		        		 	$(".insertReply").css("display", "none");
		        		 	$(".replyContent").innerText="";
		        			const loginMember = '${loginMember}';
		        			if (loginMember != "" && action) {
		        				p.css("display", "flex");
		        				$(".replyContent").text(" ");
		        				$(".replyOpenIcon").css("display","none")
		        			} else if (!action) {
		        				p.css("display", "none");
		        				$(".replyContent").text(" ");
		        				$(".replyOpenIcon").css("display","block")
		        			} else if (loginMember == "") {
		        				alert("로그인후 이용할수있습니다..");
		        			}
		        			action = !action;
		        			
		        		});


		        		
		        		const boardNo = $(".boardNo").val();

		        		$(".boardBuffBtn").click(function() {
		        			$.ajax({
		        				type : "get",
		        				url : "${path}/community/insertBuff",
		        				data : {
		        					boardNo : boardNo,
		        				},
		        				success : function(data) {
		        					$(".bf").text(data);
		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			});
		        		});

		        		$(".boardNerfBtn").click(function() {
		        			$.ajax({
		        				type : "get",
		        				url : "${path}/community/insertNerf",
		        				data : {
		        					boardNo : boardNo,
		        				},
		        				success : function(data) {
		        					$(".nf").text(data);
		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			});
		        		});
		        		
		        		$(".cb").click(function(e) {
		        			const commentNo =  $(e.target).closest('.dateBuffDiv').find(".commentNo").val();
		        			const buff =  $(e.target).next();
		        			
		        			 $.ajax({
		        				type : "get",
		        				url : "${path}/community/insertCb",
		        				data : {
		        					commentNo : commentNo,
		        				},
		        				success : function(data) {
		        				
		        					buff.text(data);
		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			}); 
		        		});
		        		
		        		$(".cn").click(function(e) {
		        			const commentNo =  $(e.target).closest('.dateBuffDiv').find(".commentNo").val();
		        			const nerf =  $(e.target).next();
		        			console.log(nerf)
		        			$.ajax({
		        				type : "get",
		        				url : "${path}/community/insertCn",
		        				data : {
		        					commentNo : commentNo,
		        				},
		        				success : function(data) {
		        					nerf.text(data);
		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			});
		        		});
		        		$(".replyBtn").click(function(e) {
		        			const comment = $(e.target).parent().parent().parent().find(".replyContent").html();
		        			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();
		        			
		        			console.log(comment);
		        			console.log(commentNo);
		        			$.ajax({
		        				type : "post",
		        				url : "${path }/community/insertReply",
		        				data : {
		        					boardNo : boardNo,
		        					comment : comment,		
		        					commentNo : commentNo,
		        				},
		        				success : function(data) {
		        					
		        					location.reload();
		        					

		        					

		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			});
		        		});
		        		
		        		$(".updateBtn").click(function(e) {
		        			const comment = $(e.target).parent().parent().parent().find(".updateContent").html();
		        			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();
		        			console.log(comment);
		        			console.log(commentNo);
		        			$.ajax({
		        				type : "post",
		        				url : "${path }/community/updateReply",
		        				data : {
		        					boardNo : boardNo,
		        					comment : comment,		
		        					commentNo : commentNo,
		        				},
		        				success : function(data) {
		        					location.reload();

		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			});
		        		});
		        		
		        		
		        		$(".cmRemoveBtn").click(function(e) {
		        			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();
		        			console.log(commentNo);
		        			$.ajax({
		        				type : "post",
		        				url : "${path }/community/cmRemoveBtn",
		        				data : {
		        							
		        					commentNo : commentNo,
		        				},
		        				success : function(data) {
		        					console.log(data);
		        					location.reload();     	   
		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			});
		        		});
		        		
		        		$(".removeBtn").click(function(e) {
		        			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();		
		        			console.log(commentNo);
		        			$.ajax({
		        				type : "post",
		        				url : "${path }/community/removeBtn",
		        				data : {
		        				
		        					commentNo : commentNo,
		        				},
		        				success : function(data) {
		        					location.reload();

		        				},
		        				error : function() {
		        					alert("로그인후 이용가능합니다.");
		        				}
		        			});
		        		});
		        }
		    });
		});
		
		

		//답글작성
		$(".replyBtn").click(function(e) {
			const comment = $(e.target).parent().parent().parent().find(".replyContent").html();
			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();
			
			console.log(comment);
			console.log(commentNo);
			$.ajax({
				type : "post",
				url : "${path }/community/insertReply",
				data : {
					boardNo : boardNo,
					comment : comment,		
					commentNo : commentNo,
				},
				success : function(data) {
					
					location.reload();
					

					

				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		});
		
		$(".updateBtn").click(function(e) {
			const comment = $(e.target).parent().parent().parent().find(".updateContent").html();
			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();
			console.log(comment);
			console.log(commentNo);
			$.ajax({
				type : "post",
				url : "${path }/community/updateReply",
				data : {
					boardNo : boardNo,
					comment : comment,		
					commentNo : commentNo,
				},
				success : function(data) {
					location.reload();

				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		});
		
		
		$(".cmRemoveBtn").click(function(e) {
			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();
			console.log(commentNo);
			$.ajax({
				type : "post",
				url : "${path }/community/cmRemoveBtn",
				data : {
							
					commentNo : commentNo,
				},
				success : function(data) {
					console.log(data);
					location.reload();     	   
				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		});
		
		$(".removeBtn").click(function(e) {
			const commentNo =  $(e.target).parent().parent().parent().find(".commentNo").val();		
			console.log(commentNo);
			$.ajax({
				type : "post",
				url : "${path }/community/removeBtn",
				data : {
				
					commentNo : commentNo,
				},
				success : function(data) {
					location.reload();

				},
				error : function() {
					alert("로그인후 이용가능합니다.");
				}
			});
		});
	</script>
	<!-------------------------------------------->
</body>
</html>
