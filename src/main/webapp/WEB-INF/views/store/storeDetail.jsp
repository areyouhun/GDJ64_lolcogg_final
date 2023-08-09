<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	background-color: #000;
	display: none;
}

.storeModal {
	border: 2px solid var(--lol-mainblue);
	width: 600px;
	height: 400px;
	display: none;
	position: absolute;
	z-index: 10000;
	background-color: var(--lol-black);
	font-family: "SUIT-Regular";
	color: var(--lol-white);
}

#modalContent {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#modalImg {
	width: 14rem;
	height: 14rem;
}

#modalItemDetail {
	display: flex;
	width: 90%;
}

#modalContent>p {
	font-family: EF_MACHO;
	font-size: 20px;
	margin-top: 1rem;
	margin-bottom: 1rem;
}

#modalItemDetail>div>table>tbody>tr:first-child {
	height: 3rem;
}

#moadlButton {
	width: 100%;
	display: flex;
	margin-top: 2rem;
	justify-content: center;
}

#moadlButton>button {
	width: 6rem;
	height: 2rem;
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

#modalTable>tbody>tr>td:first-child {
	width: 5rem;
}
#checkitem{
	color: var(--lol-mainblue);
}
	
</style>
<style>
	.nickName{
		border: 2px solid var(--lol-mainblue);
		width: 500px;
		height: 220px;
		display: none;
		position: absolute;
		z-index: 10000;
		background-color: var(--lol-black);
		font-family: "SUIT-Regular";
		color: var(--lol-white);
	}
	#nickCloseContainer{
		width: 100%;
    	display: flex;
    	margin-right: 2vh;
    	justify-content: flex-end;
	}
	#nickContent{
		height: 100%;
		display: flex;
   		flex-direction: column;
    	align-items: center;
	}
	.nickClose{
		width:3vh;
	    position: absolute;
    	top: -1.5vh;
    	right: -1.5vh;
	}
	#nickText{
		width: 100%;
	    height: 67%;
	    display: flex;
	    justify-content: space-between;
        align-items: center;
	}
	#nickText>input:first-child {
		width: 70%;
		height: 80%;
		border: 2px solid var(--lol-mainblue);
	    text-indent: 0.8rem;
	    background-color: var(--lol-black);
	    color: var(--lol-white);
	    outline: none;
	
	}
	#nickText>input:last-child {
		width: 20%;
		height: 80%;
		border: 2px solid var(--lol-white);
		background-color: var(--lol-black);
		color:var(--lol-white);
	}
	#nickChange{
	    width: 70%;
    	display: flex;
    	align-items: center;
   	    margin-bottom: 1vh;
	}
	#nickChange>input{
	    width: 2vh;
	    height: 2vh;
	    -webkit-appearance: none;
	    margin-right: 1vh;
	    border: 2px solid var(--lol-mainblue);
	    background-color: var(--lol-black);
	    poin: 
	}
	#nickChange>input:checked {
        border: 2px solid var(--lol-mainblue);
	    background-color: var(--lol-black);
	    color:var(--lol-white);

    }
	#nickChangeButton{
		width: 24%;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    opacity: 0.5;
	}
	#nickChangeButton>img{
	    position: absolute;
	    left: 44%;
	    z-index: 2;
	    width: 20px;
	}
	#nickChangeButton>button{
		width: 100%;
	    height: 4vh;
	    text-indent: 19%;
	    background-color: var(--lol-black);
	    color: var(--lol-white);
	    border: 2px solid var(--lol-white);
	    pointer-events:none;
	}
	#nickResult{
	    width: 70%;
	    display: flex;
	    font-size: 11px;
	}
	#nickResult>img{
        width: 1vh;
    	margin-right: 0.5vh;
	}
	#nickChange>input[type="checkbox"]{
        display: none;
      }
	#nickChange>input[type="checkbox"] + label{
        display: inline-block;
        position: relative;
        width: 2vh;
	    height: 2vh;
	    -webkit-appearance: none;
	    margin-right: 1vh;
	    border: 2px solid var(--lol-mainblue);
	    background-color: var(--lol-black);
	    cursor: pointer;
	    pointer-events:none;
      }
	#nickChange>input[id="check1"]:checked + label::after{
	        content:'✔';
	        font-size: 25px;
	        width: 30px;
	        height: 30px;
	        text-align: center;
	        position: absolute;
	        left: -3px;
	        top:-14px;
	        color:var(--lol-mainblue);
	      }
	  .clickclick{
	  	cursor: pointer;
	  }
}
</style>
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
	                        <a href="${path}/store/detail?sort=ITEM_PRICE&order=DESC&no=${no}" >높은 포인트순</a>
	                        <a href="${path}/store/detail?sort=ITEM_PRICE&order=ASC&no=${no}" >낮은 포인트순</a>
	                        <a href="${path}/store/detail?sort=ITEM_NAME&order=ASC&no=${no}" >가나다순</a>
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
									"price" : price
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
						addExpNum=Math.floor(Math.random() * 500)
					}else if(name.includes('서사')){
						addExpNum=Math.floor(Math.random() * 1000)
					}else if(name.includes('행운')){
						if(Math.floor(Math.random() * 2)==0){
							addExpNum=-Math.floor(Math.random() * 1000)
						}else{
							addExpNum=Math.floor(Math.random() * 1000)
						}
					}else{
						addExpNum=Math.floor(Math.random() * 2000)
					}
					$.ajax({
						type : 'POST',
						url : '${path}/store/addExp',
						data : {
							"exp" : addExpNum,
							"price" : price
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
