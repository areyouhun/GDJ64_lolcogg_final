<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<style>
	#tableContainer>table{
		width: 100%;
	    border-top: 3px solid var(--lol-white);
	    border-bottom: 3px solid var(--lol-white);
	    border-collapse: collapse;
	    color:var(--lol-white);
	    text-align: center;
	}
	#tableContainer{
		width:100%;
	}
	
	#tableContainer>table th{
		border-top: 3px solid var(--lol-white);
		border-bottom: 3px solid var(--lol-white);
	}
	#tableContainer>table td{
		border-bottom: 1px solid var(--lol-white);
	}
	.graph{
		background-color: gray;
		border-radius: 40px;
		width: 80%;
	}
	.graph>span{
		display:block;
		padding:0 10px;
		text-align: right;
		background-color: violet;
		border-radius: 40px
	}
	.page{
		height:5vh;
		list-style: none;
		justify-content: space-evenly;
		width: 20%;
    	font-size: 3vh;
   	    display: flex;
	}
	.pageAll{
        width: 100%;
    	display: flex;
    	justify-content: space-evenly;
	}
	
</style>
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
                			<td><img src="${path }/resources/images/game/worldcup/${r.wcImgFilename }" style="width:130px;height:130px;"></td>
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
<script>
	/* window.onload = function(){
		$.ajax({
			type : 'GET',
			url : '${path}/game/worldcupRank',
			dataType : 'json',
			data :{
				"num" : ${num}
			},success : function(data){
				for(let i=0;i<data.length;i+=4){
					
				}
			},error : (request, status, error) { 
		        console.log(error)
		    }
		})
	} */
</script>
<!-------------------------------------------->
</body>
</html>
