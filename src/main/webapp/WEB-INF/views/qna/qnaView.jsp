<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/qna/insertQna.css">
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
                <hr class="hr-3">
                <c:if test="${qb != null || qb != '' }">
                    <div class="tableTitle">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">제목</p>
                            <div class="qnaViewInput">
                                <p id="qnaTitle" class="color-white content fs-20 tableTitle">${qb.qaTitle }</p>
                                <p class="color-white content fs-20 tableTitle">${qb.qaDate }</p>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">작성자</p>
                            <div class="qnaViewInput">
                                <p class="color-white content fs-20 tableTitle">${qb.qaWriter.email == null ? "탈퇴한 회원" : qb.qaWriter.nickname }</p>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">문의내용</p>
                            <div class="qnaViewContent">
                                <p class="color-white content fs-20 tableTitle preText">${qb.qaContent }</p>
                                <c:forEach var="f" items="${qb.qaFile }">
                                	<c:if test="${f.qaOriFilename != null }">
	                                    <img src="${path }/resources/upload/qna/${f.qaRnmFilename}" width="800px" style="margin-top:10px"><br>
	                                </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">첨부파일</p>
                            <div class="qnaViewInput">
                                <div>
                                <c:forEach var="f" items="${qb.qaFile }">
                                	<c:if test="${f.qaOriFilename != null }">
	                                    <p class="color-white content fs-20 tableTitle">${f.qaOriFilename }</p>
	                                </c:if>
	                                <c:if test="${f.qaOriFilename == null }">
	                                	<p class="color-white content fs-20 tableTitle">첨부파일 없음</p>
	                                </c:if>
                                </c:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
                  </c:if>
                    <hr class="hr-3">
                    <div class="insertBtnDiv">
                    <c:if test="${loginMember.email == qb.qaWriter.email || loginMember.authority == '관리자' }">
                        <button id="updateQna" type="submit" class="insertBtn insertBtnOk content">수정</button>
                        <button id="deleteQna" type="reset" class="insertBtn insertBtnNo content">삭제</button>
					</c:if>
                    </div>

                <!-- 댓글 -->
                <div class="qnaCommentDiv">
                    <div class="qnaCommentDivSize">
                        <p class="title qnaCommentTitle fs-20">댓글</p>
                        <!-- 댓글 작성 -->
                        <form id="commentForm" method="post" onsubmit="return fn_insertComment();">
                            <div class="insertCommentDiv">
                            	<div class="commentDiv">
	                                <textarea type="text" class="insertComment content fs-20"
	                                    style="resize: none;"></textarea>
                                </div>
                                <div class="countBtnDiv">
                                    <div class="countBtn">
                                        <span id="letterSpan" class="content fs-20">0/150</span>
                                    </div>
                                    <div class="iconBtn">
									<div class="emoDiv">
									</div>
									<button class="commentBtn content">등록</button>
								</div>
                                </div>
                            </div>
                        </form>
                        <!-- 댓글 목록 -->
                        <div class="qnaCommentListDiv">
                            <hr class="hr-1 hr-op">
		                    <c:if test="${not empty qbc }">
		                    	<c:forEach var="c" items="${qbc }">
		                    <div class="commentListDiv">
		                    	<div class="commentList">
                                <div class="">
                                    <img src="${path}/resources/upload/profile/${c.qaCommentWriter.profile}"
                                        style="width: 70px; height: 70px; border-radius: 70px; border:1px solid var(--lol-white)">
                                </div>

                                <div class="commentDetail">
                                    <div class="commentInfo">
                                        <p class="content nickname">${c.qaCommentWriter.nickname == null ? '탈퇴한 회원' : c.qaCommentWriter.nickname}</p>
                                    </div>
                                    <div>
                                        <p class="content fs-20 commentContent">${c.qaCommentContent}</p>
                                        <span class="dateSpan content">${c.qaCommentDate}</span>
                                    </div>
                                </div>

                                <div class="optionDiv">
                                <c:if test="${loginMember.authority == '관리자'}">
                                    <button class="moreIconBtn">
                                        <ion-icon class="moreIcon" name="ellipsis-horizontal"
                                            style="font-size: 28px;"></ion-icon>
                                    </button>
                                    <ul id="${c.qaCommentNo }" class="optionUl">
                                        <li>
                                         <label class="cDelBtn">
                                            <button><ion-icon class="optionIcon"
                                                    name="trash-bin-outline"></ion-icon>삭제</button>
                                         </label>          
                                        </li>
                                    </ul>
                                </c:if>
                                </div>
                            </div>
                            <hr class="hr-1 hr-op">
                                </c:forEach>
                               </c:if>
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
 <!-- icon -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script>
/* 로그인 세션값 */
const loginMember = "${sessionScope.loginMember}";

/* 글 번호 */
const qaNo = '${qb.qaNo}';

/* 댓글 글자 수 제한 */
$(document).on("keyup", ".insertComment", function(e) {
	let content = $(e.target).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('#letterSpan').text('0/150');
    } else {
    	$('#letterSpan').text(content.length + '/150');
    }
    
    // 글자수 제한
    if (content.length > 150) {
        $(e.target).val($(e.target).val().substring(0, 150));
        alert('댓글은 150자 이하로 작성해주세요.');
    };
});

/* 댓글 권한 */
$(".insertComment").focus(e=>{
	if('${loginMember.authority}' != '관리자'){
		alert("문의하기 댓글은 관리자만 작성할 수 있습니다.");
		$(".insertComment").blur();
	}
});

/* 댓글 등록 ajax */
const fn_insertComment=()=>{
	const auth = '${loginMember.authority}'; // 로그인 회원 권한
	const qaNo = '${qb.qaNo}'; // 문의글 번호
	
    if (auth != '관리자') {
      alert( '문의하기 댓글은 관리자만 작성할 수 있습니다.' );
      return false;
    } else {
    	const writer = '${loginMember.email}';
    	const content = $(".insertComment").val();
    	
    	$.ajax({
    		type: "POST",
    		url: "${path}/qna/insertComment",
    		data:{
    			"qaCommentWriter": writer,
    			"qaCommentContent": content,
    			"qaNo": qaNo
    		},
    		dataType: "json",
    		success : function(data){
    			const commentList = $(".commentListDiv");
    			commentList.html('');
    			$("#letterSpan").text('0/150');
    			let html = '';
    			data.forEach(function(item) {
    				html += "<div class='commentList'>";
    				html += "<div class='profileImg'>";
    				html += "<img src='" + "${path}/resources/upload/profile/" + item.qaCommentWriter.profile
    						+ "' style='width: 70px; height: 70px; border-radius: 70px; border: 1px solid var(--lol-white);'>";
    				html += "</div>";
    				
    				html += "<div class='commentDetail'>";
    				html += "<div class='commentInfo'>";
    				html += "<p class='content fs-20 nickname'>";
    				html += (item.qaCommentWriter.nickname != null) ? item.qaCommentWriter.nickname : "탈퇴한 회원";
    				html += "</p>";
    				html += "</div>";
    				html += "<div>";
    				html += "<p class='content commentContent'>" + item.qaCommentContent + "</p>";
                    html += "<span class='dateSpan content'>" + item.qaCommentDate + "</span>";
                    html += "</div></div>";
                    
    				html += "<div class='optionDiv'>";
    				html += "<button class='moreIconBtn'>";
    				html += "<ion-icon class='moreIcon' name='ellipsis-horizontal' style='font-size: 28px;'></ion-icon>";
    				html += "</button>";
    				
    				html += "<ul id='" + item.qaCommentNo + "' class='optionUl'><li>";
    				html += "<label class='cDelBtn'><button id='" + item.qaCommentNo + "' class='cDelBtn'><ion-icon class='optionIcon cDelBtn' name='trash-bin-outline'></ion-icon>삭제</button></label>";
    				html += "</li></ul></div></div>";
    				html += "<hr class='hr-1 hr-op'>";
    			});
    			commentList.append(html);
    			$(".insertComment").val('');
    		},
    		error: function(err){
    			console.log("요청 실패", err);
    		}
    	});
    	return false;
    }
}

/* 문의글 삭제 */
$("#deleteQna").click(e=>{
	if(confirm("정말 삭제하시겠습니까?")) { 
		location.replace('${path}/qna/deleteQna?no=${qb.qaNo}');
	}
})

/* 댓글 - 수정, 삭제 버튼 토글 */
/* 동적 태그에 이벤트 위임해줘야 함 */
$(document).on("click", ".moreIconBtn", function(e) {
    const optionUl = $(e.target).closest(".optionDiv").find(".optionUl");
    optionUl.toggle();
});

/* 댓글 삭제 */
$(document).on("click", ".cDelBtn", function(e) {
	e.stopPropagation(); 
	$(e.target).parents('.optionUl').css('display', 'none');
	const qaNo = $(e.target).parents('ul').attr('id');
	const removeDiv = $(e.target).parents('.commentList');
	const hr = $(e.target).parents('.commentList').next('hr');
	
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: "POST",
			url: "${path}/qna/deleteComment",
			data:{
				"qaNo": qaNo
			},
			dataType: "json",
			success : function(data){
				if(data > 0){
					alert("삭제 완료");
					removeDiv.next('hr').remove();
					removeDiv.remove();
				} else {
					alert("다시 한 번 시도해주세요.");
				}
			},
			error : function(err){
				console.log("요청 실패", err);
			}
		});
	} else {
		
	}
});

/* 게시물 수정 시 */
$(document).on("click", "#updateQna", function(e) {
	const title = $('#qnaTitle').text();
	const content = $('.qnaViewContent p').text();
	
	const file = $('.qnaViewInput>div>p').map(function() {
	    return $(this).text();
	}).get();
	
	/* 파일 소스 */	
	let fileSrc = $(e.target).parent('.insertBtnDiv').siblings('.tableTitle').find('.qnaViewContent img');
	
	/* 삭제버튼 이벤트 삭제 및 이벤트 생성 */
	$('#deleteQna').off('click').text('취소');
	$(document).on("click", "#deleteQna", function(e) {
		location.assign('${path}/qna/qnaView?no=${qb.qaNo}');
	});
	
	/* form태그 */
	let form = $('<form>', {
		id: 'updateForm',
        action: '${path}/qna/updateQna',
        method: 'post',
        enctype: 'multipart/form-data'
    });
	
	$('.tableTitle').html('');
	$('.qnaCommentDiv').html('');
	
	let tableTitleDiv = $('<div>').addClass('tableTitle'); 
	
	/* 글 번호 */
	let noInput = $('<input>', { name : 'qaNo', type : 'hidden' , value: qaNo});
	tableTitleDiv.append(noInput);
	
	/* 제목 */
	let qaTitleDiv = $('<div>').addClass('insertqna');
	let titleP = $('<p>').addClass('color-white content fs-20 tableTitle').text('제목');
	qaTitleDiv.append(titleP);
	
	let qaTitleInputDiv = $('<div>').addClass('qaTitleDiv');
	let qaTitleInput = $('<input>', { type: 'text', name: 'qaTitle', class: 'qnaInput inputFont', placeholder: '최대 30자' }).val(title);
	qaTitleInputDiv.append(qaTitleInput);
	
	qaTitleInputDiv.append($('<div>').append($('<p>', { class: 'color-white content fs-20 tableTitle' }).text(title.length + '/30')));
	qaTitleDiv.append(qaTitleInputDiv);
	qaTitleDiv.append($('<input>', { type: 'hidden', name: 'qaWriter', value: '${loginMember.email}' }));
	
	tableTitleDiv.append(qaTitleDiv);
	
	tableTitleDiv.append($('<hr>').addClass('hr-1'));
	
	/* 문의내용 */
	let qaContentDiv = $('<div>').addClass('insertqna');
	let contentP = $('<p>').addClass('color-white content fs-20 tableTitle').text('문의내용');
	qaContentDiv.append(contentP);
	
	let qaContentInputDiv = $('<div>').addClass('qaContentDiv');
	let qaContentText = $('<textarea>', { name: 'qaContent', cols: '30', rows: '40', class: 'qnaInput inputFont', placeholder: '최대 1000자' , value: 'qaContent'}).css({'resize': 'none', 'margin-top': '5px'}).val(content);
	qaContentInputDiv.append(qaContentText)
	
	let div = $('<div>');
	div.append($('<p>', { class: 'color-white content fs-20 tableTitle' }).text(content.length));
	div.append($('<p>', { class: 'color-white content fs-20 tableTitle' }).text('/1000'));
	qaContentInputDiv.append(div);
	qaContentDiv.append(qaContentInputDiv);
	
	tableTitleDiv.append(qaContentDiv);
	tableTitleDiv.append($('<hr>').addClass('hr-1'));
	
	/* 첨부파일 */
	let qaFileDiv = $('<div>').addClass('insertqna');
	let fileP = $('<p>').addClass('color-white content fs-20 tableTitle').text('첨부파일');
	qaFileDiv.append(fileP);
	
	let qaFileInputDiv = $('<div>').addClass('addFile');
	let qaFileLabel = $('<label>', { for: 'qnaFile', class: 'inputFont fileBtn'}).text('파일 추가하기');
	let qaFileInput = $('<input>', { type: 'file', id: 'qnaFile', name: 'qaFile', accept: 'image/*', multiple: 'multiple' });
	
	let qaFileBoxDiv = '';
	if(file == '첨부파일 없음'){
		qaFileBoxDiv = $('<div>').addClass('fileBox').css('display', 'none');
	} else {
		qaFileBoxDiv = $('<div>').addClass('fileBox').css('display', 'block');
		
		let img = '';
		$.each(fileSrc, (i, f)=>{
			let img = $("<img>").attr({
				src: f.src, "width" : "80px", "height" : "80px"
			}).css({
				"margin-right":"10px", "border" : "1px solid white"
			});
			qaFileBoxDiv.append(img);
		});
	}
	
	qaFileInputDiv.append(qaFileLabel, qaFileInput, qaFileBoxDiv);
	qaFileDiv.append(qaFileInputDiv);
	
	tableTitleDiv.append(qaFileDiv);
	tableTitleDiv.append($('<hr>').addClass('hr-1'));
	
	form.append(tableTitleDiv);

	$('.tableTitle').after(form);
	
	$('#updateQna').removeAttr('id').addClass('updateOkBtn');
});

/* 수정 내용 입력 후 버튼 클릭시 */
$(document).on("click", ".updateOkBtn", function(e) {
	$(e.target).attr('form', 'updateForm');
	
	const title = $('input[name=qaTitle]').val();
	const content = $('.qaContentDiv textarea').val();
	
	if($('input[name=qaTitle]').val() == '') {
		alert("제목을 입력해 주세요.");
		$('input[name=qaTitle]').focus();
		return false;
	} else if($('textarea[name=qaContent]').val() == '') {
		alert("문의내용을 입력해 주세요.");
		$('textarea[name=qaContent]').focus();
		return false;
	} else if($('input[name=qaPwd]').val() == '') {
		alert("비밀번호를 입력해 주세요.");
		$('input[name=qaPwd]').focus();
		return false;
	} else {
		return true;
	}
	
});



/* insertQna JS */
$(()=>{
	$("[name=qaFile]").change(e=>{
		console.log(e.target);
		const fileName = e.target.files[0].name;
		console.log(e.target.files[0]);
		console.log(fileName);
		const xIcon = $("<ion-icon name='close-circle-outline' class='content fs-20'>");
		$(e.target).next(".fileName").text(fileName);
		$('.fileBox').css('display', 'block');
	})
})

/* 이미지 추가 박스 */
$(document).on("change", "[name=qaFile]", function(e) {
	$(".fileBox").html('');
	
	$.each(e.target.files,(i,f)=>{
		const reader = new FileReader();
	reader.onload=e=>{
		const img = $("<img>").attr({
			src: e.target.result, "width" : "80px", "height" : "80px"
		}).css({
			"margin-right":"10px", "border" : "1px solid white"
		});
		$(".fileBox").append(img);
	}	
	reader.readAsDataURL(f);
	})
})

/* 제목, 내용 글자 수 제한 */
$(document).on("keyup", ".qaTitleDiv input", function(e) {
	let title = $(e.target).val();
    // 글자수 세기
    if (title.length == 0 || title == '') {
    	$(e.target).parents('.qaTitleDiv').find('p:first-child').text('0/30');
    } else {
    	$(e.target).parents('.qaTitleDiv').find('p:first-child').text(title.length + '/30');
    }
    
    // 글자수 제한
    if (title.length > 30) {
        $(e.target).val($(e.target).val().substring(0, 30));
        $(e.target).parents('.qaTitleDiv').find('p:first-child').text('30');
        alert('제목은 30자 이하로 작성해주세요.');
    };
});	

$(document).on("keyup", ".qaContentDiv textarea", function(e) {
	let content = $(e.target).val();
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$(e.target).parents('.qaContentDiv').find('p:first-child').text('0');
    } else {
    	$(e.target).parents('.qaContentDiv').find('p:first-child').text(content.length);
    }
    
    // 글자수 제한
    if (content.length > 1000) {
        $(e.target).val($(e.target).val().substring(0, 1000));
        $(e.target).parents('.qaContentDiv').find('p:first-child').text('1000');
        alert('문의글은 1000자 이하로 작성해주세요.');
    };
});	 



</script>
<!-------------------------------------------->
</body>
</html>
