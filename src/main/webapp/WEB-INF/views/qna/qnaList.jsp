<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="url" value="${pageContext.request.requestURL}" />
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/qna/qnaList.css">
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
                <div>
                    <div class="qnaSort">
	                    <c:if test="${url} eq ${path }+'/qna/qnaList'">
	                        <a href="${path }/qna/qnaList"><span class="content fs-20 qnaSpan">전체</span></a>
	                        <a href="${path }/qna/myQnaList"><span class="content fs-20 qnaSpanNo">내가 쓴 글</span></a>
	                    </c:if>
	                    <c:if test="${url} == '${path }/qna/myQnaList'">
	                        <a href="${path }/qna/qnaList"><span class="content fs-20 qnaSpanNo">전체</span></a>
	                        <a href="${path }/qna/myQnaList"><span class="content fs-20 qnaSpan">내가 쓴 글</span></a>
	                    </c:if>
	                    <a href="${path }/qna/qnaList"><span class="content fs-20 qnaSpan">전체</span></a>
	                        <a href="${path }/qna/myQnaList"><span class="content fs-20 qnaSpanNo">내가 쓴 글</span></a>
                    </div>
                    <div class="tableContainer">
                        <table class="qnaTable">
                            <tr>
                                <th class="color-white content fs-20">번호</th>
                                <th class="color-white content fs-20">제목</th>
                                <th class="color-white content fs-20">작성자</th>
                                <th class="color-white content fs-20">등록일</th>
                                <th class="color-white content fs-20">상태</th>
                            </tr>
                            <c:if test="${not empty qb }">
                            	<c:forEach var="qna" items="${qb }">
		                            <tr>
		                                <td class="color-white content fs-20">${qna.qaNo }</td>
		                                <td class="color-white content fs-20 tableTitle">
		                                    <a href="${path }/qna/qnaView?no=${qna.qaNo}">${qna.qaTitle }</a>
		                                    <img src="${path }/resources/images/qna/lock.png" style="width: 15px; height: 15px;">
		                                </td>
		                                <td class="color-white content fs-20">${qna.qaWriter==null ? "탈퇴한 회원" : qna.qaWriter.nickname }</td>
		                                <td class="color-white content fs-20">${qna.qaDate }</td>
		                                <td class="color-white content fs-20">
		                               <%--  <p class='content'>${qna.qaComment}</p> --%>
		                               <c:set var="doneLoop" value="false" />
		                                	<c:forEach var="c" items="${qna.qaComment}" varStatus="status">
		                                		<%-- <p class='content'>${c.qaNo }</p> --%>
		                                		<c:if test="${not doneLoop}"> 
													<c:if test="${c.qaCommentNo != 0 }"> 
														<c:set var="doneLoop" value="true"/> 
				                                		<button class="qnaBtn comBtn" disabled>답변완료</button>
													</c:if> 
												</c:if> 
		                                		<c:if test="${c.qaCommentNo == 0 }">
		                                			<button class="qnaBtn" disabled>답변대기</button>
		                                		</c:if>
		                                	</c:forEach>
		                                </td>
		                            </tr>
	                            </c:forEach>
                            </c:if>
                            <c:if test="${empty qb }">
                            	<tr>
                            		<td class="color-white content fs-20" colspan="5" style="height:400px">조회된 문의내역이 없습니다.</td>
                            	<tr>
                            </c:if>
                        </table>
                        <div class="insertBtnDiv">
                            <button onclick="location.assign('${path}/qna/insertQna')" class="insertBtn insertBtnNo content">문의하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 페이지바 -->
        <c:out value="${pageBar }" escapeXml="false"/>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
	$(()=>{
		console.log(location.href);
		/* 전체, 내가 쓴글 */
	});
</script>
<!-------------------------------------------->
</body>
</html>