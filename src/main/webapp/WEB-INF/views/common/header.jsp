<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<header>
    <div class="nav nav-default <c:out value='${param.navBgColor}'/>">
        <div class="header-sort">
            <a href="${path}/" class="img-aTag"><img src="${path}/resources/images/common/header_logo.png" style="height: 40px;"></a>
            <nav>
                <ul class="nav-ul">
                    <li>
                        <a href="" class="nav-a">LCK</a>
                        <ul class="nav-ul-ul">
                            <li><a href="">일정</a></li>
                            <li><a href="${path}/teamdata">팀 데이터</a></li>
                            <li><a href="${path }/matchprediction">승부예측</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="nav-a">커뮤니티</a>
                        <ul class="nav-ul-ul">
                            <li><a href="${path}/card/selectboardList">게시판</a></li>
                            <li><a href="">공지사항</a></li>
                            <li><a href="${path }/qna/qnaList">문의하기</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${path}/store/main"  class="nav-a">포인트상점</a>
                    </li>
                    <li>
                        <a href="" class="nav-a">플레이</a>
                        <ul class="nav-ul-ul">
                            <li><a href="${path}/card/selectCardById">카드</a></li>
                            <li><a href="">챔피언 예측</a></li>
                            <li><a href="">롤 퀴즈</a></li>
                            <li><a href="${path }/game/choice">밸런스/이상형</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
			<!-- script_common.js - /*프로필 호버*/ 참조 -->
			<c:if test="${loginMember!=null }">
				<div class="myProfileLogo">
					<span>	
						<a href="${path }/member/mypage.do?email=${loginMember.email}" class="img-aTag">
							<img src="${path}/resources/images/common/${loginMember.profile}"
		                    	style="width: 40px; height: 40px;">
		            	</a>
					</span>
					
					<div class="myProfileBox color-white center-1280" style="display: none;">
                    	<div class="ff-macho fs-25" >
	                    	<c:out value="${loginMember.nickname }" />
	                    	<img src="${path}/resources/images/tier/${loginMember.tier.tierRulesNo.tierRulesImage}"
		                    	style="width: 35px; height: 25px; margin-left:0.5em">
                    	</div>
						<a href="${path }/member/mypage.do" >
							내 정보
		            	</a>
						<a href="${path }/member/myCard.do?email=${loginMember.email}" >
							내 카드관리
		            	</a>
						<a href="${path }/member/logout.do">
								로그아웃
						</a>
						<hr style="border: none; height: 1px;  background-color: #EEEEEE">
						<h3>알림</h3>
						<p>알림1</p>
						<p>알림2</p>
					</div>
				</div>
			</c:if>
			<c:if test="${loginMember==null }">
	            <a href="${path }/member/loginPage" class="img-aTag">
	            	<img src="${path}/resources/images/common/icon_profile.png"
	                    style="width: 40px; height: 40px;">
	            </a>
			</c:if>
        </div>
    </div>
</header>


