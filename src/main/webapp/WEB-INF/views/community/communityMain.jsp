<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="count" value="1" />
<c:set var="count1" value="1" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet"
	href="${path }/resources/css/community/communityMain.css">
<!------------------------------------>
<title>커뮤니티</title>
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
							
							
							<c:forEach var="r" items="${realTimePopularity }">
								<a href="${path }/community/boardDetails?cmBoardNo=${r.cmBoardNo}">
									<div class="realTime-popularity">
										<p class="num">${count}</p>
										<p>[${r.cmBoardCategories}]</p>
										<P>${r.cmBoardTitle }</P>
									</div>
								</a>
								<c:set var="count" value="${count + 1}" />
							</c:forEach>
						</div>
						<div>
							<div class="community-right-top">
								<p>주간 인기글</p>
								<p>최근 일주일 기준</p>
							</div>
						
							<c:forEach var="w" items="${weeklyPopularity }">
							<a href="${path }/community/boardDetails?cmBoardNo=${w.cmBoardNo}">
								<div class="realTime-popularity">
									<p class="num">${count1 }</p>
									<p>[${w.cmBoardCategories }]</p>
									<P>${w.cmBoardTitle }</P>
								</div>
							</a> 
							<c:set var="count1" value="${count1 + 1}" />
							</c:forEach>
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
								<button class="button" onclick="selectPopularityCategoriePage()">
									<p>인기글</p>
								</button>
								<button class="button" onclick="redirectToCategoriePage()">
									<p>최신글</p>
								</button>
							</div>

							<form action="${path }/community/searchBoard"
								id="searchBoardForm">
								<div>
									<select class="select-div" name="selectValue">
										<option value="titleContent">제목+내용</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">글쓴이</option>
									</select>
									<div class="board-search-div">
										<input placeholder="검색" name="search"> <img
											src="${path }/resources/images/community/돋보기.svg" alt="돋보기"
											id="submitImage">
									</div>
								</div>
							</form>
						</div>
						<hr class="hr-1">
						<div class="categories">
							<a href="${path}/community/selectboardList">
								<div class="categoriesName categoriesMain">
									<p>전체</p>
								</div>
							</a> <a href="${path}/community/selectBoradCategorie?categorie=정보">
								<div class="categoriesName info">
									<p>정보</p>
								</div>
							</a> <a href="${path}/community/selectBoradCategorie?categorie=자유">
								<div class="categoriesName free">
									<p>자유</p>
								</div>
							</a> <a href="${path}/community/selectBoradCategorie?categorie=유머">
								<div class="categoriesName puny">
									<p>유머</p>
								</div>
							</a>
						</div>
						<c:forEach var="b" items="${selectboardList }">
							<hr class="hr-1">
							<div class="cm_board-content">
								<a
									href="${path }/community/boardDetails?cmBoardNo=${b.cmBoardNo}">
									<div class="board-title-div">
										<input type="hidden" value="cmBoardNo"> <span
											class="board-title">${b.cmBoardTitle }</span>
										<c:if test="${b.cmBoardContent.contains('<img')}">
											<span><img class="attachmenOn"
												src="${path }/resources/images/community/사진.png" alt=""
												height="20px"></span>

										</c:if>
										<c:if
											test="${b.cmVideoAddress.contains('https://www.youtube.com/')}">
											<img class="attachmenOn"
												src="${path }/resources/images/community/영상.png" alt=""
												height="20px">
										</c:if>
										<c:if test="${b.c!=0 }">
											<span class="comment fs-25">[${b.c }]</span>
										</c:if>
									</div>
								</a>
								<div class="board-bottom">
									<div>
										<span>${b.cmBoardCategories }</span><span class="Backslash">|</span>
										<span>
										<c:if test="${b.cmBoardWriter.titleName !=null}">
										<span class="designation">[${b.cmBoardWriter.titleName }]</span>
										</c:if>
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
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			let params = new URLSearchParams(window.location.search);
			let categoryValue = params.get("categorie");

			// 카테고리 값에 따라 해당 div에 'active-category' 클래스 추가
			if (categoryValue === "정보") {
				document.querySelector(".info").classList
						.add("active-category");
				document.querySelector(".board-categories").innerText = "정보";
			} else if (categoryValue === "유머") {
				document.querySelector(".puny").classList
						.add("active-category");
				document.querySelector(".board-categories").innerText = "유머";
			} else if (categoryValue === "자유") {
				document.querySelector(".free").classList
						.add("active-category");
				document.querySelector(".board-categories").innerText = "자유";
			} else {
				document.querySelector(".categoriesMain").classList
						.add("active-category");
				document.querySelector(".board-categories").innerText = "전체";
			}
		});
		//주소값 벨류가져오기
		function getParameterByName(name, url) {
			if (!url)
				url = window.location.href;
			name = name.replace(/[\[\]]/g, '\\$&');
			var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'), results = regex
					.exec(url);
			if (!results)
				return null;
			if (!results[2])
				return '';
			return decodeURIComponent(results[2].replace(/\+/g, ' '));
		}

		//최신순 
		function redirectToCategoriePage() {
			const currentCategorieValue = getParameterByName('categorie');
			const path = "${path}/community/selectBoradCategorie?categorie="
					+ currentCategorieValue;
			location.assign(path);
		}

		//인기순
		function selectPopularityCategoriePage() {
			const currentCategorieValue = getParameterByName('categorie');
			const path = "${path}/community/selectPopularity?categorie="
					+ currentCategorieValue;
			location.assign(path);
		}

		//돋보기 클릭시 서밋
		document.getElementById("submitImage").addEventListener("click",
				function() {
					document.getElementById("searchBoardForm").submit();
				});
	</script>

	<!-------------------------------------------->
</body>
</html>
