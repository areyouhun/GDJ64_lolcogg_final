<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/store/store_main.css">
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
	                <div>
	                	<div class="storeTheme">
	                		<h3 id="hotItem">이모티콘 랜덤팩</h3>
		                    <a href="">전체보기></a>
	                	</div>
	                	<div class="itemArray">
				            <c:if test="${not empty items}">
				          		<c:forEach var="i" items="${items }">
				                		<div class="item">
					                        <img class="checkBuyItem" src="${path}/resources/images/store/${i.itemFilename}">
					                        <h4>${i.itemName }</h4>
					                        <p style="display:none">${i.itemExp }</p>
					                        <div>
					                            <img src="${path}/resources/images/store/pointImg.png">
					                            <h5>${i.itemPrice }</h5>
					                        </div>
				                    	</div>
				           		</c:forEach>
					        </c:if>

	                	</div>
	                </div>
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
						<table id="modalTable">
							<tr>
								<td>상품명</td>
								<td id="modaltemName"></td>
							</tr>
							<tr>
								<td>상세 설명</td>
								<td id="modalExplain"></td>
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
			console.log($(e.target).next().next().text());
			$('#modalImg').attr("src",$(e.target).attr("src"));
			$('#modaltemName').text($(e.target).next('h4').text());
			$('#modalExplain').text($(e.target).next().next().text());
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
			console.log($(e.target).parent().parent().find('#modaltemName').text())
			location.href='${path}/store/purchase?name='+$(e.target).parent().parent().find('#modaltemName').text();
		})
	});

</script>
<!-------------------------------------------->
</body>
</html>
