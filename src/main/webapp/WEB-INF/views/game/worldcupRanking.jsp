<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/game/worldcupRanking.css">
<!------------------------------------>
<title>롤코지지-${gameName }</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin" style="display:flex;flex-direction:column;align-items:center;">
                <div>
                    <p class="mainTitle fs-35 mainTitleMargin">${gameName }</p>
                </div>
                <div id="tableContainer">
                	<table>
                		<tr style="height: 7vh;">
                			<th>순위</th>
                			<th  style="width:20%;">이미지</th>
                			<th style="width:40%;">이름</th>
                			<th>우승비율</th>
                			<th>1:1승리 비율</th>
                		</tr>
                		<c:forEach var="r" items="${WCR }">
                		<tr>
                			<td>${r.rownum}</td>
                			<c:choose>
                				<c:when test="${number==4 }">
                					<c:set var="url" value="${r.wcImgFilename }" />
									<c:set var="lastPart" value="${fn:substringAfter(url, 'embed/')}" />
                					<td><img src="https://img.youtube.com/vi/${lastPart }/0.jpg" style="width:130px;height:130px;"></td>
                				</c:when>
                				<c:otherwise><td><img src="${path }/resources/images/game/worldcup/${r.wcImgFilename }" style="width:130px;height:130px;"></td></c:otherwise>
                			</c:choose>
                			<td>${r.wcImgName }</td>
                			<td>
                				<fmt:formatNumber var="num" value="${r.wcWinNo/(rate==0?1:rate)*100 }" pattern="0.00" />
                				<div class="graph">
                					<span style="width:${num }%">${num}%</span>
                				</div>
                			</td>
                			<td>
                				<fmt:formatNumber var="num" value="${r.wcOTOWinNo/(rateOTO==0?1:rateOTO)*100 }" pattern="0.00" />
                				<div class="graph">
                					<span style="width:${num}%">${num}%</span>
                				</div>
                			</td>
                		</tr>
                		</c:forEach>

                	</table>
                </div>
            	
            </div>
        </div>
         <c:out value="${pageBar }" escapeXml="false"/>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->

<!-------------------------------------------->
</body>
</html>
