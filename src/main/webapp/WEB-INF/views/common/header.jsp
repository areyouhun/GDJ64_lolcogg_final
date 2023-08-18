<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<header>
	<div class="header_div">
		<div class="nav nav-default <c:out value='${param.navBgColor}'/>">
			<!-- <div class="header-sort" style="position : relative"> -->
			<div class="header-sort">
				<a href="${path}/" class="img-aTag"><img
					src="${path}/resources/images/common/header_logo.png"
					style="height: 40px;"></a>
				<nav>
					<ul class="nav-ul">
						<li><a href="${path}/schedule" class="nav-a">LCK</a>
							<ul class="nav-ul-ul">
								<li><a href="${path}/schedule">일정</a></li>
								<li><a href="${path}/teamdata">팀 데이터</a></li>
								<li><a href="${path }/matchprediction">승부예측</a></li>
							</ul></li>
						<li><a href="${path}/community/selectboardList" class="nav-a">커뮤니티</a>
							<ul class="nav-ul-ul">
								<li><a href="${path}/community/selectboardList">게시판</a></li>
								<li><a href="${path}/notice/selectNotice">공지사항</a></li>
								<li><a href="${path }/qna/qnaList">문의하기</a></li>
							</ul></li>
						<li><a href="${path}/store/main" class="nav-a">포인트상점</a></li>
						<li><a href="${path}/card/selectCardById" class="nav-a">플레이</a>
							<ul class="nav-ul-ul">
								<li><a href="${path}/card/selectCardById">카드</a></li>
								<li><a href="">챔피언 예측</a></li>
								<li><a href="${path}/quiz">롤 퀴즈</a></li>
								<li><a href="${path }/game/choice">보너스 게임</a></li>
							</ul></li>
					</ul>
				</nav>
				<!-- script_common.js - /*프로필 호버*/ 참조 -->
				<c:if test="${loginMember!=null }">
					<!-- <div class="myProfileLogo" style="position:absolute ; top:0 ; right:0" > -->
					<div class="myProfileLogo">
						<span> <a href="${path }/mypage/mypage.do" class="img-aTag">
								<c:if
									test="${loginMember.profile != null && not empty loginMember.password && loginMember.password.contains('로그인')}">
									<!-- 소셜 로그인 -->
									<img src="${loginMember.profile}"
										style="width: 40px; height: 40px; border-radius: 20px;">
								</c:if> <c:if
									test="${loginMember.profile != null && not empty loginMember.password && !loginMember.password.contains('로그인')}">
									<!-- 일반 로그인 -->
									<img
										src="${path}/resources/upload/profile/${loginMember.profile}"
										style="width: 40px; height: 40px; border-radius: 20px;">
								</c:if> <c:if test="${loginMember.profile==null}">
									<!-- 프로필 미등록 -->
									<img src="${path}/resources/images/common/favicon-original.png"
										style="width: 40px; height: 40px; border-radius: 20px;">
								</c:if>
						</a>
						</span>
					</div>
				</c:if>
				<c:if test="${loginMember==null }">
					<a href="${path }/member/loginPage" class="img-aTag"> <img
						src="${path}/resources/images/common/icon_profile.png"
						style="width: 40px; height: 40px;">
					</a>
				</c:if>
			</div>
		</div>
	</div>
	<c:if test="${loginMember!=null }">
	<div class="hidden_header">
		<div class="myProfileBox color-white">
			<div class="ff-macho fs-25">
				<c:out value="${loginMember.nickname }" />
				<img
					src="${path}/resources/images/tier/${loginMember.tier.tierRulesNo.tierRulesImage}"
					style="width: 35px; height: 25px; margin-left: 0.5em">
			</div>
			<a href="${path }/mypage/mypage.do"> 내 정보 </a>
			<c:if test="${loginMember.authority=='관리자' }">
				<a href="${path }/admin"> 관리자 페이지 </a>
			</c:if>
			<a href="${path }/member/logout.do"> 로그아웃 </a>
			<hr style="border: none; height: 1px; background-color: #EEEEEE">
			<h3>정보</h3>
			<span><img src="${path }/resources/images/store/pointImg.png">
			</span> <span class="color-white">&nbsp;&nbsp;${loginMember.totalPoints}
				포인트</span>
		</div>
	</div>
	</c:if>
</header>
