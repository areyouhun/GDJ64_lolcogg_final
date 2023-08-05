<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet"
	href="${path }/resources/css/community/communityMain.css">
<!------------------------------------>
<title>communityMain</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="center-1280 background-img mainpage mainHeight">
			<div class="width-1280 page-margin community-centent">
				<div class="popularity">
					<div class="community-right-size">
						<div>
							<div class="community-right-top">
								<p>실시간 인기글</p>
								<p>최근 24시간 기준</p>
							</div>
							<a href="">
								<div class="realTime-popularity">
									<p id="realTime1">1</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>2</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>3</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>4</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>5</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
						</div>
						<div>
							<div class="community-right-top">
								<p>주간 인기글</p>
								<p>최근 일주일 기준</p>
							</div>
							<a href="">
								<div class="realTime-popularity">
									<p id="realTime1">1</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>2</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>3</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>4</p>
									<p>[유머]</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a> <a href="">
								<div class="realTime-popularity">
									<p>5</p>
									<P>동제동이 우산을 놓고가는영상</P>
								</div>
							</a>
						</div>
					</div>


				</div>
				<div class="community-center-list">
					<div class="community-center-size">
						<div class="board-categories-div">
							<p class="board-categories fs-35">전체</p>
							<button type="button" class="writing-button"
								onclick="location.assign('${path}/community/insertCommunity')">글쓰기</button>
						</div>
						<div class="popular-latest-Button">
							<div>
								<button class="button">
									<p>인기글</p>
								</button>
								<button class="button">
									<p>최신글</p>
								</button>
							</div>

							<form action="">
								<div>
									<select class="select-div">
										<option value="제목+내용">제목+내용</option>
										<option value="제목">제목</option>
										<option value="내용">내용</option>
										<option value="글쓴이">글쓴이</option>
									</select>
									<div class="board-search-div">
										<input placeholder="검색"> <img
											src="${path }/resources/images/community/돋보기.svg" alt="돋보기">
									</div>
								</div>
							</form>
						</div>
						<hr class="hr-1">
						<div class="categories">
							<a href="">
								<div class="categoriesName categoriesMain">
									<p>전체</p>
								</div>
							</a> <a href="">
								<div class="categoriesName">
									<p>정보</p>
								</div>
							</a> <a href="">
								<div class="categoriesName">
									<p>자유</p>
								</div>
							</a> <a href="">
								<div class="categoriesName">
									<p>유머</p>
								</div>
							</a>
						</div>
						<c:forEach var="b" items="${selectboardList }">
							<hr class="hr-1">
							<div class="board-content">
								<input type="hidden" value="cmBoardNo"> <a href="">
									<div class="board-title-div">
										<span class="board-title">${b.cmBoardTitle }</span>
											<c:if test="${b.cmBoardContent.contains('<img')}">
												<span><img class="attachmenOn"
													src="${path }/resources/images/community/사진.png" alt=""
													height="20px"></span>
												
											</c:if>
										<c:if test="${b.cmVideoAddress.contains('https://youtu.be/') || b.cmVideoAddress.contains('https://music.youtube.com')}">
											<img class="attachmenOn"
												src="${path }/resources/images/community/영상.png" alt=""
												height="20px">
										</c:if>
										<c:if test="${b.replycut!=0 }">
											<span class="comment fs-25">[${b.replycut }]</span>
										</c:if>
									</div>
								</a>
								<div class="board-bottom">
									<div>
										<span>${b.cmBoardCategories }</span><span class="Backslash">|</span>
										<span><span class="designation">[${b.cmBoardWriter.titleName }]</span>
											${b.cmBoardWriter.nickname }</span> <span class="Backslash">|</span><span>${b.timeDifference}</span>
									</div>

									<div class="board-img">
										<div>
											<img src="${path }/resources/images/community/조회수.svg" alt=""><span>${b.cmBoardReadCount }</span>
										</div>

										<div>
											<img src="${path }/resources/images/community/버프.svg " alt=""><span>${b.b }</span>
										</div>

										<div>
											<img src="${path }/resources/images/community/너프.svg" alt="">
											<span>${b.n }</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="pageBar_div">
							<c:out value="${pageBar }" escapeXml="false" />
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

	<!-------------------------------------------->
</body>
</html>
