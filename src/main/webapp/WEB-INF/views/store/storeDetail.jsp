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
	.storeChoice{
		display: flex;
		justify-content: center;
	}
	.storeChoice>a{
	    color: var(--lol-white);
	    font-family: EF_MACHO;
	    font-size: 30px;
	    margin: 1rem;
	}
	.storeLine{
	    width: 1280px;
	    margin-top: 1rem;
	    margin-bottom: 2rem;
	}
	.arrayPoint>a{
		color: var(--lol-white);
	    font-family: EF_MACHO;
	    font-size: 17px;
	    margin: 0.5rem;
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
		justify-content: flex-start;
	    margin-top: 2rem;
    	margin-bottom: 3rem;
    	flex-wrap: wrap;
	}
	.item>img{
	    width: 17rem;
    	height: 17rem;
	    background-color: var(--bg-gray);
	    border: 1px solid var(--lol-mainblue);
	}
	.item{
		color: var(--lol-white);
    	font-family: "SUIT-Regular";
    	margin-bottom: 3rem;
    	width: 25%;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	.item>div{
		display:flex;
		align-items: center;
	    width: 100%;
    	margin-left: 3rem;
	}
	.item>div>img{
		margin-right: 1rem;
	}
	.item>h4{
		margin-top: 0.5rem;
		margin-bottom: 0.5rem;
		display: flex;
	    width: 100%;
	    margin-left: 3rem;
	    justify-content: flex-start;
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
<title>롤코지지-포인트 상점</title>
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
                <div class="storeChoice">
                    <a href="">선수 랜덤팩</a>
                    <a href="">이모티콘 랜덤팩</a>
                    <a href="">잡화</a>
                </div>
                <hr class="storeLine">
                <div>
                	<div class="storeTheme">
                		<div class="arrayPoint">
	                        <a href="">높은 포인트순</a>
	                        <a href="">낮은 포인트순</a>
	                        <a href="">이름순</a>
	                    </div>
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
