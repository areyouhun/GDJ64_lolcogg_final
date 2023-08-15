<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
<!-- Your own style tag or CSS file -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/theme/toastui-editor-dark.css" />
<link rel="stylesheet"
	href="${path }/resources/css/community/communityMain.css">
<!------------------------------------>
<title>게시글작성</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="navBgColor" value="nav-black" />
	</jsp:include>
	<section>
		<div class="center-1280 background-img mainpage mainHeight">
			<div class="width-1280 page-margin community-centent">
				<div class="insert-board-center">
					<div class="community-center-size">
						<div class="board-categories-div">
							<p class="board-categories fs-35">글쓰기</p>
						</div>
						<form id="contentForm"
							action="${path}/notice/insertNoticeEnd" method="post">
							<select class="insert-select-div" name="boardCategories">
								<option hidden="hidden">카테고리</option>
								<option value="1">커뮤니티</option>
								<option value="2">포인트상점</option>
								<option value="3">플레이</option>
							</select>
							<div class="insert-title">
									<div>
									<input type="text" placeholder="제목" name="title" maxlength="20">

								</div>
							
							</div>
							<div class="content1"></div>
							<input type="hidden" id="content1" name="content1" value="">
							<div class="insert-button-div">
								<button type="submit" class="writing-button insert-board">작성완료</button>
								<button type="button" class="writing-button remove-board"
									onclick="deleteFile(); location.replace('${path}/community/selectboardList');">취소</button>
							</div>
						</form>


					</div>
				</div>
				
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
	<script src="${path}/resources/js/script_common.js"></script>
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<!-- Your own script tag or JavaScript file -->
	<script>
	
	

	let isSubmitButtonClicked = false;

	document.querySelector(".insert-board").addEventListener("click", function() {
	    isSubmitButtonClicked = true;
	});

	function deleteFile() {
	    if (isSubmitButtonClicked) {
	        // 작성완료 버튼이 클릭된 경우 함수를 종료
	        return;
	    }
	    var content = document.querySelector('.content1').innerHTML;
	    var imgTag = content.match(/<img src="\/resources\/upload\/community\/([^"]+)"/);
	    if (imgTag) {
	        var filename = imgTag[1];
	        fetch('${path}/community/deletefile?filename=' + filename, {
	            method: 'DELETE'
	        }).then(response => {
	            if (response.ok) {
	                console.log('파일이 성공적으로 삭제되었습니다.');
	            } else {
	                console.log('파일을 삭제하는데 실패했습니다.');
	            }
	        }).catch(error => {
	            console.error('Error:', error);
	        });
	    }
	}

	
	    //글쓰기 조건
	document.getElementById('contentForm').addEventListener('submit', function(e) {
    const category = this.boardCategories.value;
    const title = this.title.value;
    const content = this.content1.value;
   

    if (category === '카테고리' || title === '' || content === '') {
        e.preventDefault();
        alert('카테고리, 제목, 내용을 모두 작성해주세요.');
        return;
    }
    
});
	
        //글쓰기에디터
        

      const editor = new toastui.Editor({
    el: document.querySelector('.content1'),
    height: '800px',
    initialEditType: 'wysiwyg',
    previewStyle: 'vertical',
    theme: 'dark',
    hooks: {
        addImageBlobHook: (blob, callback) => {
            const formData = new FormData();
            formData.append('image', blob);
            fetch(`${path}/community/renamefile`, {
                method: 'POST',
                body: formData
            }).then((response) => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error('업로드실패');
                }
            }).then((jsonResponse) => {
                callback("${path}/resources/upload/community/"+jsonResponse.fileName, 'alt text' , 'width 300px','height 300px');
            }).catch((error) => {
                console.log('업로드실패', error.message);
            });
        }
    }
      
});
      editor.on('change', function() {
    	    document.getElementById('content1').value = editor.getHTML();
    	});


      
         
     


    </script>


	<script>


        // 헤더 세부카테고리
        $("nav").mouseenter(e => {
            const navContainer = $("div.nav");
            $(navContainer).addClass("nav-hover");
            $(navContainer).removeClass("nav-default");
            $(".nav-ul-ul").css("display", "block");
            $("nav").css("height", "290px");
        }
        )

        $("nav").mouseleave(e => {
            const navContainer = $("div.nav");
            $(navContainer).removeClass("nav-hover");
            $(navContainer).addClass("nav-default");
            $(".nav-ul-ul").css("display", "none");
            $("nav").css("height", "60px");
        }
        )
    </script>

	<!-------------------------------------------->
</body>
</html>
