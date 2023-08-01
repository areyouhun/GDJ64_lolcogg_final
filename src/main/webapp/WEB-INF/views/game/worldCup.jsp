<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<style>
.worldcupModal {
	width: 600px;
	height: 400px;
	position: absolute;
	z-index: 1000;
	background-color: var(--lol-white);
	margin-top: 60px;
}
.worldcupModal>img{
	margin-top: 3rem;
}
.worldcupModal>h2{
	color:var(--lol-black);
	font-family: EF_MACHO;
	margin-top: 1rem;
}

.worldcupModal>div>p{
	color: var(--lol-black);
	font-family: "SUIT-Regular";
}
.worldcupModal>div{
	margin-top: 1rem;
	width:90%;
}
.worldcupModal>div>*{
	margin-bottom: 0.5rem;
}
.worldcupModal>div>select{
	width: 33rem;
    height: 2.5rem;
	background-color: #D9D9D9;
    text-indent: 1rem;
}
.worldcupModal>div>button:first-child {
	width: 25rem;
	height: 2.8rem;
	border: none;
	background-color: var(--lol-mainblue);
	color: var(--lol-white);
}
.worldcupModal>div>button:last-child {
	width: 8rem;
	height: 2.8rem;
}
.worldcupModal>form>div:last-child>button {
	font-size: 16px;
}


</style>
<!------------------------------------>
<title>롤코지지-${gameName }</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section style="height:700px">
    	<div style="display:flex;justify-content:center;">
	    	<div class="worldcupModal" style="display: flex; flex-direction: column; align-items: center;">
					<img src="${path }/resources/images/game/worldcup/trophy.png">
					<h2>${gameName }</h2>
					<div>
						<p>총 라운드를 선택하세요</p>
						<select id="round">
							<option value="32">32강</option>
							<option value="16">16강</option>
							<option value="8">8강</option>
							<option value="4">4강</option>
						</select>
						<p>총 55명의 후보 중 무작위 32명이 대결합니다.</p>				
					</div>
					<div>
						<button onclick="startWorldCup();">시작하기</button>
						<button onclick="location.replace('${path }/game/choice')">돌아가기</button>
					</div>
	 		</div>
 		</div>
		<!-- 페이드 영역-->
    </section>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
	const startWorldCup=()=>{
		console.log($('#round').val())
		$('.worldcupModal').hide();
		
	}
</script>
<!-------------------------------------------->
</body>
</html>
