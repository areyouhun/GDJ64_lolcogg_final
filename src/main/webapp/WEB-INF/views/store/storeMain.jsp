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
	    cursor: pointer;
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
	
	#mask {
	  position: absolute;
	  left: 0;
	  top: 0;
	  z-index: 9999;
	  background-color: #000;
	  display: none;
	  }
	.storeModal {
	  border: 2px solid var( --lol-mainblue);
	  width:600px;
	  height:400px;
	  display: none;
	  position: absolute;
	  z-index: 10000;
	  background-color: var(--lol-black);
	  font-family: "SUIT-Regular";
	  color:var(--lol-white);
	}
	#modalContent{
		display:flex;
		flex-direction: column;
   		align-items: center;
	}
	#modalImg{
		width:14rem;
		height:14rem;
	}
	#modalItemDetail{
		display: flex;
		width: 90%;
	}
	#modalContent>p{
		font-family: EF_MACHO;
		font-size: 20px;
		margin-top: 1rem;
		margin-bottom: 1rem;
	}
	#modalItemDetail>div>table>tbody>tr:first-child {
		height:3rem;
	}
	#modalItemDetail>div>table>tbody>tr:nth-child(2) {
		display:flex;
		
		height:10rem;
	}
	#moadlButton{
		width:100%;
	    display: flex;
	    margin-top: 2rem;
	    justify-content: center;
	}
	#moadlButton>button{
		width:6rem;
		height:2rem;
		border: none;
		color: var(--lol-black);
		font-size: 16px;
	}
	#moadlButton>button:first-child {
		background-color: var(--lol-white);
		margin-right: 1rem;
	}
	#moadlButton>button:last-child {
		background-color: var(--lol-teamblue);
		margin-left: 1rem;
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
	                        <img class="checkBuyItem" src="${path}/resources/images/store/DK,DRX,KDF,KT_10.png">
	                        <h4>프리미엄 선수팩 10장</h4>
	                        <div>
	                            <img src="${path}/resources/images/store/pointImg.png">
	                            <h5>975</h5>
	                        </div>
                    	</div>
                    	<div class="item">
	                        <img class="checkBuyItem" src="${path}/resources/images/store/PRM_10.png">
	                        <h4>프리미엄 선수팩 10장</h4>
	                        <div>
	                            <img src="${path}/resources/images/store/pointImg.png">
	                            <h5>975</h5>
	                        </div>
                    	</div>
                	</div>
                </div>
                <hr class="storeLine">
                <div>
                	<div class="storeTheme">
                		<h3 id="hotItem">LCK 랜덤선수팩</h3>
	                    <a href="${path}/store/playerPack">전체보기></a>
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
                <hr class="storeLine">
                <c:if test="${not empty items}">
            		<c:forEach var="i" items="${items }">
		                <div>
		                	<div class="storeTheme">
		                		<h3 id="hotItem">이모티콘 랜덤팩</h3>
			                    <a href="">전체보기></a>
		                	</div>
		                	<div class="itemArray">
		                		<div class="item">
			                        <img class="checkBuyItem" src="${path}/resources/images/emoticon/${i.itemFilename}">
			                        <h4>${i.itemName }</h4>
			                        <div>
			                            <img src="${path}/resources/images/store/pointImg.png">
			                            <h5>${i.itemPrice }</h5>
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
	                </c:forEach>
	            </c:if>
                <hr class="storeLine">
                <div>
                	<div class="storeTheme">
                		<h3 id="hotItem">잡화</h3>
	                    <a href="">전체보기></a>
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
		<!-- 모달팝업 영역 -->
		<div class="storeModal">
			<div id="modalContent">
				<p>상품정보</p>
				<div id="modalItemDetail">
					<img id="modalImg">
					<div>
						<table>
							<tr>
								<td>상품명</td>
								<td id="modaltemName"></td>
							</tr>
							<tr>
								<td>상세 설명</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<p>위 아이템을 구매하시겠습니까?</p>
					
				</div>
				<div id="moadlButton">
					<button id="modalClose">취소</button>
					<button id="modalPurchase">확인</button>
				</div>
			</div>
 		</div>
		<!-- 페이드 영역-->
		<div id="mask"></div>
    </section>
    
    



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
	/*center 함수 재정의*/
	jQuery.fn.center = function () {
		this.css('top', Math.max(0,(($(window).height()-$(this).outerHeight())/2) + $(window).scrollTop())+'px');
		this.css('left', Math.max(0,(($(window).width()-$(this).outerWidth())/2) + $(window).scrollLeft())+'px');
		return this;
	}

	/*모달 활성화 및 팝업 활성화*/
	function wrapWindowByMask (){
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		$('#mask').css({'width':maskWidth, 'height':maskHeight});
		$('#mask').fadeTo(10,0.8);
		
		$('.storeModal').show();
		$('.storeModal').center();
	}

	/*버튼 클릭시 위 함수 콜*/
	$(function () {
		$('.checkBuyItem').click(function(e) {
			console.log($(e.target).next('h4').text());
			$('#modalImg').attr("src",$(e.target).attr("src"));
			$('#modaltemName').text($(e.target).next('h4').text());
			document.body.style.overflow = 'hidden';
			e.preventDefault();
			wrapWindowByMask();
		});
		$('#modalClose').click(function(e){
			document.body.style.overflow = "scroll";
			$('#modalImg').attr("src","")
			$('#mask').hide();
			$('.storeModal').hide();
		})
		$('#modalPurchase').click(function(e){
			location.href='${path}/store/purchase'
		})
	});

</script>
<!-------------------------------------------->
</body>
</html>
