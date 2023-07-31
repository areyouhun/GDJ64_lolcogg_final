<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" href="${path}/resources/css/member.css">
<!------------------------------------>
<title>회원가입</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <!--------------------------------- Code below --------------------------------->
                <!-- 작업영역 -->
                <div>
                    <p class="enrollTitle color-white ff-macho fs-25 ">회원가입</p>
                </div>
                <form action="" method="post">
                    <div class="divFlex">
                        <div class="enrollBox">
                            <div class="line">
                                <form action="#" method="get">
                                    <p class="color-white ff-suit fw-bold">*이메일</p>
                                    <input type="text" class ="ff-suit" placeholder="ex. abc@lolcogg.com" name="email">
                                </form>
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">*비밀번호</p>
                                <input type="password" class ="ff-suit" placeholder="영문, 숫자, 특수문자 포함 8자 이상 입력" name="password_1">
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">*비밀번호 확인</p>
                                <input type="password" class ="ff-suit" placeholder="영문, 숫자, 특수문자 포함 8자 이상 입력" name="password_2">
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">*닉네임</p>
                                <div class="">
                                    <input type="password" class ="ff-suit" placeholder="영문, 숫자, 특수문자 포함 8자 이상 입력" name="password_2">
                                </div>
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">응원팀</p>
                                <input type="text" class ="ff-suit" placeholder="(개발중)" name="nickname">
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">프로필이미지</p>
                                <input type="text" class ="ff-suit" placeholder="파일을 선택하세요." name="nickname">
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">추천인 코드 입력력</p>
                                <input type="text" class ="ff-suit" placeholder="추천인 코드를 입력하세요." name="nickname">
                            </div>
                            
                        </div>
                        <div class="">
                            <button type="submit" class="duplicationCheck ff-suit">중복 확인</button>
                        </div>
                    </div>
                </form>
        		<!------------------------------------------------------------------------------>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script src="${path}/resources/js/member/member.js"></script>

<!-------------------------------------------->
</body>
</html>