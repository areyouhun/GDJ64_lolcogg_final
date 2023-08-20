<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path }/resources/css/qna/insertQna.css">
<!------------------------------------>
<title>QnA 등록하기</title>
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
                <form action="${path }/qna/insertQnaEnd" method="post" enctype="multipart/form-data" onsubmit="return check();">
                    <div class="tableTitle">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">제목</p>
                            <div class="qaTitleDiv">
	                            <input type="text" name="qaTitle" class="qnaInput inputFont" placeholder="최대 30자">
	                            <div>
	                            	<p class="color-white content fs-20 tableTitle">0/30</p>
	                            </div>
                            </div>
                            <input type="hidden" name="qaWriter" value="${loginMember.email }">
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">문의내용</p>
                            <div class="qaContentDiv">
                            	<textarea name="qaContent" cols="30" rows="40" value="qaContent" style="resize: none;"
                                class="qnaInput inputFont" placeholder="최대 1000자" style="margin-top:5px"></textarea>
                                <div>
                                	<p class="color-white content fs-20 tableTitle">0</p>
	                            	<p class="color-white content fs-20 tableTitle">/1000</p>
	                            </div>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="insertqna">
                            <p class="color-white content fs-20 tableTitle">첨부파일</p>
                            <div class="addFile">
	                            <label for="qnaFile" class="inputFont fileBtn">파일 추가하기</label>
	                            <input type="file" id="qnaFile" name="qaFile" accept="image/*" multiple>
	                            <div class="fileBox"></div>
                            </div>
                        </div>
                        <div>
                            <p class="color-white content fs-20 tableTitle qnaPwdMargin"></p>
                        </div>
                    </div>
                    <hr class="hr-3">
                    <div class="insertBtnDiv">
                        <button type="submit" class="insertBtn insertBtnOk content">등록</button>
                        <button type="reset" class="insertBtn insertBtnNo content">취소</button>
                    </div>
                </form>
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
$(()=>{
	$("[name=qaFile]").change(e=>{
		const fileName = e.target.files[0].name;
		const xIcon = $("<ion-icon name='close-circle-outline' class='content fs-20'>");
		$(e.target).next(".fileName").text(fileName);
		$('.fileBox').css('display', 'block');
	})
})

/* 이미지 추가 박스 */
$("[name=qaFile]").change(e=>{
	$(".fileBox").html('');
	const files = e.target.files;
	
	$.each(files,(i,f)=>{
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

$(document).on("click", ".insertBtnNo", function(e) {
	location.assign('${path}/qna/qnaList');
})

/* 필수값 확인 */
function check() {
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
	} else return true;
}

</script>
<!-------------------------------------------->
</body>
</html>
