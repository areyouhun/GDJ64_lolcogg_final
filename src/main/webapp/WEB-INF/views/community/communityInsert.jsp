<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->

<!------------------------------------>
<title>SAMPLE</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">sub title</p>
                    <p class="mainTitle fs-35 mainTitleMargin">메인 타이틀</p>
                </div>
                <!--------------------------------- Code below --------------------------------->
				<article style="color: white; font-size: 1.5rem;">
				<h1>article 태그 지워도 됨</h1>
				<a href="${path}/sampleAll">샘플 테스트 (클릭)</a><br>
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE WRITE YOUR CODE HERE
        		</article>
        		<!------------------------------------------------------------------------------>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->

<!-------------------------------------------->
</body>
</html>
