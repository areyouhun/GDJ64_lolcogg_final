<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/store/storeDetail.css">
<!------------------------------------>
<title>롤코지지-포인트 상점</title>
</head>
<body>
<fmt:formatNumber value="${buyer.totalPoints}"  var="point" pattern="0"/>
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
                    <a href="${path}/store/detail?no=1" id=${no==1?"checkitem":"" }>선수 랜덤팩</a>
                    <a href="${path}/store/detail?no=2" id=${no==2?"checkitem":"" }>이모티콘 랜덤팩</a>
                    <a href="${path}/store/detail?no=3" id=${no==3?"checkitem":"" }>잡화</a>
                </div>
                <hr class="storeLine">
                <div>
                	<div class="storeTheme">
                		<div class="arrayPoint">
	                        <a href="${path}/store/detail?sort=ITEM_PRICE&order=DESC&no=${no}" id=${order=='DESC'&&sort=='ITEM_PRICE'?"checkitem":"" } >높은 포인트순</a>
	                        <a href="${path}/store/detail?sort=ITEM_PRICE&order=ASC&no=${no}" id=${order=='ASC'&&sort=='ITEM_PRICE'?"checkitem":"" }>낮은 포인트순</a>
	                        <a href="${path}/store/detail?sort=ITEM_NAME&order=ASC&no=${no}" id=${order=='ASC'&&sort=='ITEM_NAME'?"checkitem":"" }>가나다순</a>
	                    </div>
	                    <div id="storeSearchMain">
	                        <img id="searchImg" src="${path}/resources/images/store/searchImg.png">
	                        <input id="storeSearch"type="text" placeholder="통합 검색">
	                        <button id="storeSearchButton">검색</button>
	                    </div>
                	</div>
                	<div class="itemArray">
                		<c:if test="${not empty items}">
				          		<c:forEach var="i" items="${items }">
				                		<div class="item">
					                        <img class="checkBuyItem clickclick" src="${path}/resources/images/store/${i.itemFilename}">
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
            </div>
        </div>
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
							<tr style="display:none">
								<td>가격</td>
								<td id="modalPrice"></td>
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
 		
 		<div class="nickName">
			<div id="nickContent" >
				<div id="nickCloseContainer">
					<img class="nickClose" src="${path}/resources/images/store/cancel.png" >
				</div>
				<p style="margin:1.5vh">닉네임 변경</p>
				<div style="height:36%;width:70%;">
					<div id="nickText">
						<input id="wantNick"type="text" placeholder="원하는 닉네임">
						<input id="nickCkeck" type="button" value="중복확인">
					</div>
					<div id="nickResult" style="visibility: hidden;">
						<img id="checkImg" src="${path}/resources/images/store/correct.png" >
						<p id="checkMsg">축하합니다. 선택한 닉네임을 사용할 수 있습니다!</p>
					</div>
				</div>
				<div id="nickChange">
					<input type="checkbox" id="check1">
        			<label for="check1"></label>변경하시겠습니까?
				</div>
				<div id="nickChangeButton">
					<img class="" src="${path}/resources/images/store/pointImg.png" >
					<button id="nickChangeButtonAccept">200</button>
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
		$('#modalImg').attr("src",$(e.target).attr("src"));
		$('#modaltemName').text($(e.target).next('h4').text());
		$('#modalExplain').text($(e.target).next().next().text());
		$('#modalPrice').text($(e.target).next().next().next().find('h5').text());
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
		let changename;
		const name=$('#modaltemName').text();
		const price=$("#modalPrice").text();
		if(${loginMember==null}){
			alert("로그인 후 구매가능합니다.");
			location.href='${path }/member/loginPage'
		}else if(${point}-price<0){
			alert("포인트가 부족합니다.");
		}else{
			if(name=="닉네임 변경권"){
					document.body.style.overflow = 'hidden';
					$('#modalImg').attr("src","")
					$('.storeModal').hide();
					$('.nickName').show();
					$('.nickName').center();
					$('#wantNick').keyup(function(){
						$('#nickCkeck').css({"background-color":"var(--lol-mainblue)","border":"none","cursor":"pointer",'pointer-events': 'auto'})
						if($('#wantNick').val().length==0){
							$('#nickCkeck').css({"background-color":"var(--lol-black)","border":"2px solid var(--lol-white)","cursor":"default",'pointer-events': 'none'});
							$('#nickResult').css("visibility","hidden");
							$('#check1+label').css('pointer-events','none');
							$('#check1').prop("checked",false);
							$('#nickChangeButton').css({"opacity":"0.5","cursor":"default",'pointer-events': 'none'})
							$('#nickChangeButtonAccept').css({"border":"2px solid var(--lol-white)"})
						}
					})
					$('#check1').click(function(){
						if($('#check1').is(':checked')){
							$('#nickChangeButton').css({"opacity":"1","cursor":"pointer",'pointer-events': 'auto'})
							$('#nickChangeButtonAccept').css({"border":"2px solid var(--lol-mainblue)"})
						}else{
							$('#nickChangeButton').css({"opacity":"0.5","cursor":"default",'pointer-events': 'none'})
							$('#nickChangeButtonAccept').css({"border":"2px solid var(--lol-white)"})
						}
					})
					$('#nickCkeck').click(function(){
							$.ajax({
								type : 'GET',
								url : '${path}/store/nickCkeck',
								dataType : 'text',
								data : {
									"name" : $('#wantNick').val()
								},
								success : function(data){
									if(data.length==0){
										const regex=new RegExp('^[가-힣a-zA-Z0-9]{2,8}$');
										if(regex.test($('#wantNick').val())){
											$('#checkImg').attr("src","${path}/resources/images/store/correct.png")
											$('#checkMsg').text("축하합니다. 선택한 닉네임을 사용할 수 있습니다!")
											$('#checkMsg').css("color","#63DD61")
											$('#nickResult').css("visibility","visible")
											$('#check1+label').css('pointer-events','auto');
											changename=$("#wantNick").val()
											$('#wantNick').keyup(function(){
												$('#nickResult').css("visibility","hidden");
												$('#check1+label').css('pointer-events','none');
												$('#check1').prop("checked",false);
												$('#nickChangeButton').css({"opacity":"0.5","cursor":"default",'pointer-events': 'none'})
												$('#nickChangeButtonAccept').css({"border":"2px solid var(--lol-white)"})
											})
										}else{
											$('#checkImg').attr("src","${path}/resources/images/store/reject.png")
											$('#checkMsg').text("2자 이상 8자 이내 한글,영어,숫자만 가능합니다.")
											$('#checkMsg').css("color","var(--lol-teamred)")
											$('#nickResult').css("visibility","visible")
											$('#check1+label').css('pointer-events','none');
											$('#check1').prop("checked",false);
											$('#nickChangeButton').css({"opacity":"0.5","cursor":"default",'pointer-events': 'none'})
											$('#nickChangeButtonAccept').css({"border":"2px solid var(--lol-white)"})
										}
									}else{
										$('#checkImg').attr("src","${path}/resources/images/store/reject.png");
										$('#checkMsg').text("중복된 닉네임이 있습니다.");
										$('#checkMsg').css("color","var(--lol-teamred)");
										$('#nickResult').css("visibility","visible");
									}
								},
							    error : function(request, status, error) { 
							        console.log(error)
							    }
							})
							

						})
					$('#nickChangeButton').click(function(){
						$.ajax({
							type : 'POST',
							url : '${path}/store/nickChange',
							data : {
								"name" : changename,
								"price" : 200
							},
							success : function(){
								alert("닉네임이 변경되었습니다.")
								location.href='${path}/store/main';
							},
							error : function(request, status, error) { 
						        console.log(error)
						    }
						})
					})
					$('.nickClose').click(function(e){
						document.body.style.overflow = "scroll";
						$('#modalImg').attr("src","")
						$('#mask').hide();
						$('.nickName').hide();
					})
					
			}else if(name.includes('물약')){
				let addExpNum;
				if(name.includes('일반')){
					addExpNum=Math.floor(Math.random() * 50)
				}else if(name.includes('서사')){
					addExpNum=Math.floor(Math.random() * 100)
				}else if(name.includes('행운')){
					if(Math.floor(Math.random() * 2)==0){
						addExpNum=-Math.floor(Math.random() * 200)
					}else{
						addExpNum=Math.floor(Math.random() * 200)
					}
				}else{
					addExpNum=Math.floor(Math.random() * 200)
				}
				$.ajax({
					type : 'POST',
					url : '${path}/store/addExp',
					data : {
						"exp" : addExpNum,
						"price" : price,
						"name" : name
					},
					success : function(){
						alert(addExpNum+"의 경험치를 얻었습니다.");
						location.href='${path}/store/main';
					},
					error : function(request, status, error) { 
				        console.log(error)
				    }
				})
			}else{
				location.replace('${path}/store/purchase?name='+name+"&price="+price);
			}
		}
	})
	$('#storeSearchButton').click(function(){
		location.href='${path}/store/detail?name='+$("#storeSearch").val()
	})
});

</script>
<!-------------------------------------------->
</body>
</html>
