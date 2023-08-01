<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/qna/insertQna.css">
<!------------------------------------>
<title>QnA</title>
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
                <c:if test="${qb != null || qb != '' }">
                    <div class="tableTitle">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">제목</p>
                            <div class="qnaViewInput">
                                <p class="color-white content fs-20 tableTitle">${qb.qaTitle }</p>
                                <p class="color-white content fs-20 tableTitle">${qb.qaDate }</p>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">작성자</p>
                            <div class="qnaViewInput">
                                <p class="color-white content fs-20 tableTitle">${qb.qaWriter.email == null ? "탈퇴한 회원" : qb.qaWriter.nickname }</p>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">문의내용</p>
                            <div class="qnaViewContent">
                                <p class="color-white content fs-20 tableTitle preText">${qb.qaContent }</p>
                                <c:forEach var="f" items="${qb.qaFile }">
                                	<c:if test="${f.qaOriFilename != null }">
	                                    <img src="${path }/resources/upload/qna/${f.qaRnmFilename}" width="500px"><br>
	                                </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">첨부파일</p>
                            <div class="qnaViewInput">
                                <div>
                                <c:forEach var="f" items="${qb.qaFile }">
                                	<c:if test="${f.qaOriFilename != null }">
	                                    <p class="color-white content fs-20 tableTitle">${f.qaOriFilename }</p>
	                                </c:if>
	                                <c:if test="${f.qaOriFilename == null }">
	                                	<p class="color-white content fs-20 tableTitle">첨부파일 없음</p>
	                                </c:if>
                                </c:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
                  </c:if>
                    <hr class="hr-3">
                    <div class="insertBtnDiv">
                        <button type="submit" class="insertBtn insertBtnOk content">수정</button>
                        <button type="reset" class="insertBtn insertBtnNo content">삭제</button>
                    </div>

                <!-- 댓글 -->
                <div class="qnaCommentDiv">
                    <div class="qnaCommentDivSize">
                        <p class="title qnaCommentTitle fs-20">댓글</p>
                        <!-- 댓글 작성 -->
                        <form id="commentForm" method="post">
                            <div class="insertCommentDiv">
                                <textarea type="text" class="insertComment content fs-20"
                                    style="resize: none;"></textarea>
                                <div class="countBtnDiv">
                                    <div class="countBtn">
                                        <span class="content fs-20">0/150</span>
                                    </div>
                                    <div class="iconBtn">
                                        <ion-icon name="happy-outline"></ion-icon>
                                        <button class="commentBtn content" onclick="fn_insertComment();">등록</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- 댓글 목록 -->
                        <div class="qnaCommentListDiv">
                            <hr class="hr-1 hr-op">
                            <c:if test="${not empty qb.qaComment }">
	                            <c:forEach var="c" items="${qb.qaComment }">
		                            <div class="commentList">
		                                <div class="">
		                                <!-- 탈퇴한 회원 분기처리 필요 -->
		                                    <img src="${path }/resources/upload/"
		                                        style="width: 70px; height: 70px; border-radius: 70px;">
		                                </div>
		
		                                <div class="commentDetail">
		                                    <div class="commentInfo">
		                                        <p class="content fs-20 nickname">${c.qaCommentWriter != null ? c.qaCommentWriter.nickname : '탈퇴한 회원' }</p>
		                                    </div>
		                                    <div>
		                                        <p class="content commentContent">${c.qaCommentContent }</p>
		                                        <span class="dateSpan content">${c.qaCommentDate }</span>
		                                    </div>
		                                </div>
		
		                                <div class="optionDiv">
		                                    <button class="moreIconBtn">
		                                        <ion-icon class="moreIcon" name="ellipsis-horizontal"
		                                            style="font-size: 28px;"></ion-icon>
		                                    </button>
		                                    <ul class="optionUl">
		                                        <li>
		                                            <button><ion-icon class="optionIcon" name="create-outline"></ion-icon>수정</button>
		                                            <hr class="hr-op">
		                                            <button><ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>삭제</button>
		                                        </li>
		                                    </ul>
		                                </div>
		                            </div>
                            <hr class="hr-1 hr-op">
                            	</c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
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
/* 댓글 - 수정, 삭제 버튼 토글 */
$(".moreIconBtn").click(e => {
    const optionUl = $(e.target).closest(".optionDiv").find(".optionUl");
    optionUl.toggle();
});

/* 댓글 - 등록 */
const fn_insertComment=()=>{
	$.ajax({
		type: 'POST',
		url: ${path} + '/qna/insertComment',
		dataType: "json"
		data: $("#commentForm").serialize(),
		success: data => {
			if(data == "success"){
				getCommentList();
				$(".insertComment").val("");
			}
		},
		error: alert("댓글 등록 실패");
	})
}

/* 페이지 로딩 시 댓글 불러오기 */
$(function(){ 
    getCommentList();
});

function getCommentList(){
	$.ajax({
		type: 'GET',
		url: ${path} + '/qna/selectCommentAll',
		dataType: "json"
		data: $("#commentForm").serialize(),
		contentType: "application/json; charset=UTF-8",
		success: data => {
			
			let html = "";
			let commentCount = data.length;
			
			if(commentCount > 0){
				
				for(i=0; i<commentCount; i++){
					
				}
				
			} else {
				html += "<p class='content'>등록된 댓글이 없습니다.<p>";
				html += "<hr class='hr-1 hr-op'>";
			}
		},
		error: alert("댓글 등록 실패");
	})
}
</script>
<!-------------------------------------------->
</body>
</html>
