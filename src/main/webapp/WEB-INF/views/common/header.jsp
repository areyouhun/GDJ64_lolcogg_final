<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<header>
    <div class="nav nav-default <c:out value='${param.navBgColor}'/>">
        <div class="header-sort">
            <a href="" class="img-aTag"><img src="${path}/resources/images/common/header_logo.png" style="height: 40px;"></a>
            <nav>
                <ul class="nav-ul">
                    <li>
                        <a href="" class="nav-a">LCK</a>
                        <ul class="nav-ul-ul">
                            <li><a href="">일정</a></li>
                            <li><a href="">팀 데이터</a></li>
                            <li><a href="">승부예측</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="nav-a">커뮤니티</a>
                        <ul class="nav-ul-ul">
                            <li><a href="">게시판</a></li>
                            <li><a href="">공지사항</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="nav-a">포인트상점</a>
                    </li>
                    <li>
                        <a href="" class="nav-a">플레이</a>
                        <ul class="nav-ul-ul">
                            <li><a href="">카드</a></li>
                            <li><a href="">챔피언 예측</a></li>
                            <li><a href="">롤 퀴즈</a></li>
                            <li><a href="">밸런스/이상형</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <a href="" class="img-aTag"><img src="${path}/resources/images/common/icon_profile.png"
                    style="width: 40px; height: 40px;"></a>
        </div>
    </div>
</header>