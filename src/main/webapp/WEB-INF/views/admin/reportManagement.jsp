<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<link rel="stylesheet"
	href="${path}/resources/css/admin/style_adminReport.css">
<!-- CSS -->
<title>신고관리</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="center-1280 background-img mainpage mainHeight">
			<div class="width-1280 page-margin">
				<article class="admin-common-container">
					<div class="admin-common-upper">
						<p class="mainTitle fs-35 mainTitleMargin">신고관리</p>
						<div class="flex-grow"></div>
						<div class="admin-common-link">
							<a class="title" href="${path}/admin/memberManagement">회원관리</a> <a
								class="title" href="${path}/admin/storeManagement">상점관리</a>
						</div>
					</div>
					<div class="center-1280 background-img mainpage mainHeight">
						<div class="width-1280 reportPage-margin">
							<div class="report-categpries">

								<div class="categories">
									<a href="${path }/admin/reportManagement"><span>게시글</span></a>
								</div>


								<div class="categories">
									<a href="${path }/admin/reportCmList"><span>커뮤니티 댓글</span></a>
								</div>
								<div class="categories">
									<a href="${path }/admin/matchpredictionCmList"><span>승부예측
											댓글</span></a>
								</div>
							</div>
							<table class="report-board content">
								<tr>
									<th>제목</th>
									<th>작성자</th>
									<th>신고횟수</th>
									<th>처리상태</th>
								</tr>
								<c:forEach var="r" items="${reportList}">
									<tr>
										<c:if test="${r.cmCommentNo.cmCommentContent!=null }">
											<td class="r_title">${r.cmCommentNo.cmCommentContent }</td>
											<td>${r.cmCommentNo.cmCommentWriter.nickname }</td>
											<td>${r.reportCount }</td>
											<c:if
												test="${r.reportCount > 2&&r.reportState.equals('처리전')}">
												<td><a
													href="${path}/admin/reportCmRemove?reportNo=${r.reportNo}&cmCommentNo=${r.cmCommentNo.cmCommentNo}"><button
															class="report-content-button">제거하기</button></a></td>
											</c:if>
											<c:if test="${r.reportCount < 3}">
												<td><button class="before_report-content-button">처리전</button></td>
											</c:if>
											<c:if test="${r.reportState.equals('처리완료')}">
												<td><button class="before_report-content-button">처리완료</button></td>
											</c:if>
										</c:if>
										<c:if test="${r.cmBoardNo.cmBoardTitle!=null }">
											<td class="r_title"><c:if
													test="${r.reportState.equals('처리전')}">
													<a
														href="${path }/community/boardDetails?cmBoardNo=${r.cmBoardNo.cmBoardNo}">
														${r.cmBoardNo.cmBoardTitle } </a>
												</c:if> <c:if test="${r.reportState.equals('처리완료')}">
													${r.cmBoardNo.cmBoardTitle } 
											</c:if></td>
											<td>${r.cmBoardNo.cmBoardWriter.nickname }</td>
										<td>${r.reportCount }</td>
											<c:if
												test="${r.reportCount > 2&&r.reportState.equals('처리전')}">
												<td><a
														href="${path}/admin/reportRemove?reportNo=${r.reportNo}&cmBoardNo=${r.cmBoardNo.cmBoardNo}"><button
															class="report-content-button">제거하기</button></a></td>
											</c:if>
											<c:if test="${r.reportCount < 3}">
												<td><button class="before_report-content-button">처리전</button></td>
											</c:if>
											<c:if test="${r.reportState.equals('처리완료')}">
												<td><button class="before_report-content-button">처리완료</button></td>
											</c:if>
										</c:if>
										<c:if test="${r.mpCommentno.mpcContent!=null }">
											<td class="r_title">${r.mpCommentno.mpcContent }</td>
											<td>${r.mpCommentno.mpcWriter.nickname }</td>
											<td>${r.reportCount }</td>
											<c:if
												test="${r.reportCount > 2&&r.reportState.equals('처리전')}">
												<td><a
													href="${path}/admin/reportMpRemove?reportNo=${r.reportNo}&mpCommentNo=${r.mpCommentno.mpcNo}"><button
															class="report-content-button">제거하기</button></a></td>
											</c:if>
											<c:if test="${r.reportCount < 3}">
												<td><button class="before_report-content-button">처리전</button></td>
											</c:if>
											<c:if test="${r.reportState.equals('처리완료')}">
												<td><button class="before_report-content-button">처리완료</button></td>
											</c:if>
										</c:if>
										
										
										
									</tr>
								</c:forEach>
							</table>

							<div class="pageBar">
									<c:out value="${pageBar }" escapeXml="false" />
							</div>
						</div>
					</div>
				</article>
			</div>
		</div>


		<!-- WRITE YOUR CODE HERE -->


	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
	<script src="${path}/resources/js/script_common.js"></script>


</body>
</html>
