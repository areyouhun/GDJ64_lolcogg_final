<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<style>
	#storeMainImg{
	  width: 1280px;
	  height: 420px;
	  margin-bottom: 1rem;
	}
	.page-margin {
	    margin: 0px;
	}
	#storeMainName{
	    color: var(--lol-white);
	    font-family: EF_MACHO;
	    font-size: 40px;
	    text-align: center;
	}
	.storeLine{
	    width: 1280px;
	    margin-top: 1rem;
	    margin-bottom: 2rem;
	}
	#hotItem{
		color: var(--lol-white);
	    font-family: EF_MACHO;
	    font-size: 25px;
	}
	.storeTheme{
		display:flex;
		justify-content: space-between;
	}
	#searchImg{
		position: absolute;
	    margin-left: 7px;
	    width: 1.2rem;
	    height: 1.2rem;
        z-index: 1;
	}
	#storeSearch{
	    background-color: var(--lol-black);
	    border: 1px solid var( --lol-mainblue);
	    height: 2rem;
	    width: 20rem;
	    text-indent: 2.4rem;
	    color: white;
	    font-size: 18px;
	}
	#storeSearch:focus{
	    outline: var( --lol-mainblue);
	}
	#storeSearchMain{
		display:flex;
		align-items: center;
	}
	#storeSearchButton{
	    background-color: var( --lol-mainblue);
	    border: none;
	    height: 2rem;
	    width: 4rem;
	    margin-left: 1.5rem;
	    cursor: pointer;
	    color:var(--lol-white);
	    font-size: 16px;
	}
	.itemArray{
		display: flex;
		justify-content: space-evenly;
	    margin-top: 2rem;
    	margin-bottom: 3rem;
	}
	.item>img{
	    width: 16rem;
    	height: 16rem;
	    background-color: var(--bg-gray);
	    border: 1px solid var(--lol-mainblue);
	}
	.item{
		color: var(--lol-white);
    	font-family: "SUIT-Regular";
	}
	.item>div{
		display:flex;
		align-items: center;
	}
	.item>div>img{
		margin-right: 1rem;
	}
	.item>h4{
		margin-top: 0.5rem;
		margin-bottom: 0.5rem;
	}
	.item>div>h5{
		font-size: 18px;
	}
	.storeTheme>a{
		color: var( --lol-mainblue);
		text-decoration: underline;
		font-size: 18px;
	}
	
</style>
<!------------------------------------>
<title>포인트 상점</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
               <div>
                    <img id="storeMainImg" src="${path}/resources/images/store/storeMainImage.jpg">
                </div>
                <p id="storeMainName">포인트 상점</p>
                <hr class="storeLine">
                <div>
                	<div class="storeTheme">
                		<h3 id="hotItem">인기상품</h3>
	                    <div id="storeSearchMain">
	                        <img id="searchImg" src="${path}/resources/images/store/searchImg.png">
	                        <input id="storeSearch"type="text" placeholder="통합 검색">
	                        <button id="storeSearchButton">검색</button>
	                    </div>
                	</div>
                	<div class="itemArray">
                		<div class="item">
	                        <img src="${path}/resources/images/store/PRM_10.png">
	                        <h4>프리미엄 선수팩 10장</h4>
	                        <div>
	                            <img src="${path}/resources/images/store/pointImg.png">
	                            <h5>975</h5>
	                        </div>
                    	</div>
                    	<div class="item">
	                        <img src="${path}/resources/images/store/PRM_10.png">
	                        <h4>프리미엄 선수팩 10장</h4>
	                        <div>
	                            <img src="${path}/resources/images/store/pointImg.png">
	                            <h5>975</h5>
	                        </div>
                    	</div>
                    	<div class="item">
	                        <img src="${path}/resources/images/store/PRM_10.png">
	                        <h4>프리미엄 선수팩 10장</h4>
	                        <div>
	                            <img src="${path}/resources/images/store/pointImg.png">
	                            <h5>975</h5>
	                        </div>
                    	</div>
                    	<div class="item">
	                        <img src="${path}/resources/images/store/PRM_10.png">
	                        <h4>프리미엄 선수팩 10장</h4>
	                        <div>
	                            <img src="${path}/resources/images/store/pointImg.png">
	                            <h5>975</h5>
	                        </div>
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

<!-------------------------------------------->
</body>
</html>
