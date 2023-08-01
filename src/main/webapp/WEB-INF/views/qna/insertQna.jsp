<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/qna/insertQna.css">
<!------------------------------------>
<title>QnA 등록하기</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <div>
                    <p class="subTitle fs-20">Q&A</p>
                    <p class="mainTitle fs-35 mainTitleMargin">문의하기</p>
                </div>
                <hr class="hr-3">
                <form action="${path }/qna/insertQnaEnd" method="post" enctype="multipart/form-data">
                    <div class="tableTitle">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">제목</p>
                            <input type="text" name="qaTitle" class="qnaInput inputFont" placeholder="최대 30자">
                            <input type="hidden" name="qaWriter" value="">
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">문의내용</p>
                            <textarea name="qnaContent" cols="30" rows="40" value="qaContent" style="resize: none;"
                                class="qnaInput inputFont" placeholder="최대 1000자"></textarea>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">첨부파일</p>
                            <div class="addFile">
	                            <label for="qnaFile" class="inputFont fileBtn">파일 추가하기</label>
	                            <input type="file" id="qnaFile" name="qaFile" accept="image/*" onchange="addFile();" multiple>
	                            <p class="content fileName"></p>
                            </div>
                        </div>
                        <div>
                            <p class="color-white content fs-20 tableTitle qnaPwdMargin"></p>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">비밀번호</p>
                            <div class="qnaInputPwdDiv"><input type="password" name="qaPwd"
                                    class="qnaInputPwd inputFont" placeholder="비밀번호 4자리"></div>
                        </div>
                    </div>
                    <hr class="hr-3">
                    <div class="insertBtnDiv">
                        <button type="submit" class="insertBtn insertBtnOk content">등록</button>
                        <button type="reset" class="insertBtn insertBtnNo content">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<!-- icon -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script>
$(()=>{
	$("[name=qaFile]").change(e=>{
		const fileName = e.target.files[0].name;
		const xIcon = $("<ion-icon name='close-circle-outline' class='content fs-20'>");
		$(e.target).next(".fileName").text(fileName);
	})
})

/* const addFile=()=>{
	let maxFile = 5; // 첨부파일 최대 개수
	var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
} */
</script>
<!-------------------------------------------->
</body>
</html>
