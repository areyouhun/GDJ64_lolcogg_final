<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" href="${path}/resources/css/member.css">
<!------------------------------------>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<title>로그인</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navsBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <!--------------------------------- Code below --------------------------------->
                <!-- 작업영역 -->
                <p class="loginTitle color-white ff-macho fs-30 ">로그인</p>
                <form action="${path }/member/loginCheck" method="post" onsubmit="return frm_check();" >
                    <div class="loginBox">
                        <input type="text" id="logId" class =" ff-suit" placeholder="이메일" name="email">
                        <input type="password" class ="ff-suit" placeholder="비밀번호" name="password">
                    </div>
                    <div class="autoLoginBox">
						<input id="saveId" type="checkbox" value="">
						<p class="fs-15 ff-suit color-white">
						    <label for="saveId">아이디 저장</label>
						</p>
                    </div>
                    <div class="loginButton">
                        <input type="submit" class ="ff-suit fw-bold" value="로그인">
                    </div>
                </form>
                <div class="memberCheckBox">
                    <a href="${path }/member/enrollMember.do" class="ff-suit">회원가입</a>
                    <p class="color-white">&nbsp;&nbsp;|&nbsp;&nbsp;</p>
                    <a href="${path }/member/find-password.html" class="ff-suit">비밀번호 찾기</a>
                </div>
                <div class="socialLoginBox">
                    <img src="${path}/resources/images/member/naver_logo_icon.png" onclick="naverLogin();"  > <!-- REST API -->
                    <div></div>
                    <img src="${path}/resources/images/member/kakaotalk_logo_icon.png" onclick="return kakaologin();"> <!-- JAVASCRIPT -->
                    <div></div>
                </div>
        		<!------------------------------------------------------------------------------>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script src="${path}/resources/js/member/login.js"></script>
<!-------------------------------------------->
</body>
</html>