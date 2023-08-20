<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="d" value="${noticeDetails}" />

<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet"
	href="${path }/resources/css/community/communityMain.css">
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<!------------------------------------>
<title>${d.noticeTitle }</title>
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
								<p class="board-details-top fs-25 content">${d.noticeTitle }</p>
									<c:if
										test="${ loginMember.nickname.equals(d.noticeWriter.nickname)}">
								<div class="optionDiv">
									<button class="moreIconBtn">
										<ion-icon class="moreIcon" name="ellipsis-horizontal"
											style="font-size: 28px;"></ion-icon>
									</button>
									<!-- 작성자 및 관리자 -->
										<ul class="optionUl">
											<li>
												<button
													onclick="location.assign('${path}/notice/noticeModify?noticeNo=${d.noticeNo }')">
													<ion-icon class="optionIcon" name="create-outline"></ion-icon>
													수정
												</button>
												<hr class="hr-1Black hr-op">
												<button onclick="removeCheck()">
													<ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>
													삭제
												</button>
											</li>
										</ul>
									</c:if>
								</div>
							</div>

							<div class="board-bottom">
								<div>
									<span> <c:choose>
											<c:when test="${d.noticeCategories == 1}">[커뮤니티]</c:when>
											<c:when test="${d.noticeCategories == 2}">[포인트상점]</c:when>
											<c:when test="${d.noticeCategories == 3}">[플레이]</c:when>
										</c:choose>
									</span><span class="Backslash">|</span> <input type="hidden"
										value="${d.noticeNo }" class="boardNo"> <span>
										<c:if test="${d.noticeWriter.titleName !=null}">
											<span class="designation">[${d.noticeWriter.titleName }]</span>
										</c:if> ${d.noticeWriter.nickname }
									</span> <span class="Backslash">|</span><span>${d.noticeDate }</span>
								</div>
							</div>
							<hr class="hr-1">
							<div class="board-content no_content">${d.noticeContent }</div>
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
				location.assign('${path}/notice/noticrRemove?boardNo=${d.noticeNo}');

			} else {

				return false;

			}

		}

		// .moreIconBtn에 대한 클릭 이벤트 위임
		$(document).on('click', '.moreIconBtn', function(e) {
			const ul = $(this).closest('.optionDiv').find(".optionUl");
			ul.toggle();
		});
	</script>


	<!-------------------------------------------->
</body>
</html>
