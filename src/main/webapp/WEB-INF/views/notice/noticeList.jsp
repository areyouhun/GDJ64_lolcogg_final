<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/notice/notice.css">
<!------------------------------------>
<title>공지사항</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="center-1280 background-img mainpage mainHeight">
			<div class="width-1280 page-margin">
				<div>
					<p class="subTitle fs-20">Notice</p>
					<p class="mainTitle fs-35 mainTitleMargin">공지사항</p>
				</div>
				<div class="report-categpries">
					<div>
						<div class="categories">
							<span onclick="categories(1);">커뮤니티</span>
						</div>
						<div class="categories">
							<span onclick="categories(3);">플레이</span>
						</div>
						<div class="categories">
							<span onclick="categories(2);">포인트 상점</span>
						</div>

					</div>

					<c:if
						test="${ loginMember.email.equals('v/9KW8XkKWoi3J+frCQCdg==')}">
						<div class="remove-button-div">
							<button class="remove-button"
								onclick="location.assign('${path}/notice/insertNotice')">
								<p>글작성</p>
							</button>
						</div>
					</c:if>
				</div>
				<table class="report-board content">
					<tr>
						<th>유형</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					
					<c:forEach var="s" items="${selectNotice }">
							<tr>
								<td class="noticeType c"><c:choose>
										<c:when test="${s.noticeCategories == 1}">[커뮤니티]</c:when>
										<c:when test="${s.noticeCategories == 2}">[포인트상점]</c:when>
										<c:when test="${s.noticeCategories == 3}">[플레이]</c:when>
									</c:choose></td>

								<td class="ca"><a href="${path }/notice/noticeDetails?noticeNo=${s.noticeNo}">${s.noticeTitle}</a></td>

								<td class="c"><a href="${path }/notice/noticeDetails?noticeNo=${s.noticeNo}">${s.noticeWriter.nickname }</a></td>
								<td class="c"><a href="${path }/notice/noticeDetails?noticeNo=${s.noticeNo}">${s.noticeDate }</a></td>
							</tr>

						</c:forEach>
					

				</table>
				<div class="pageBar">
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
	<!-- Your own script tag or JavaScript file -->
	<script>
		

		$(".noticeType").each(function(e) {
			const type = $(this).text().trim();
			

			switch (type) {
			case '[커뮤니티]':
				$(this).css("color", "#6454ED");
				break;
			case '[포인트상점]':
				$(this).css("color", "orange");
				break;
			case '[플레이]':
				$(this).css("color", "yellow");
				break;
			}
		});
		function categories(e) {

			const path = "${path}/notice/selectCategorie?categorie=" + e;
			location.assign(path);

		}
	</script>
	<!-------------------------------------------->
</body>
</html>
