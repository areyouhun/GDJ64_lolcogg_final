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
<title>글작성</title>
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
							action="${path}/community/insertCommunityEnd" method="post">
							<select class="insert-select-div" name="boardCategories">
								<option hidden="hidden">카테고리</option>
								<option value="정보">정보</option>
								<option value="자유">자유</option>
								<option value="유머">유머</option>
							</select>
							<div class="insert-title">

								<div>
									<input type="text" placeholder="제목" name="title" maxlength="30"> <input
										type="text" id="myInput" placeholder="유튜브동영상만 가능합니다. 주소를 입력해주세요(선택)"
										oninput="fetchVideoData()" name="video" maxlength="250">

								</div>
								<div class="insert-video content"></div>
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
	  window.addEventListener('beforeunload', (event) => {
	        deleteFile();
	    });

	
	    //글쓰기 조건
	document.getElementById('contentForm').addEventListener('submit', function(e) {
    const category = this.boardCategories.value;
    const title = this.title.value;
    const content = this.content1.value;
    const videoUrl = this.video.value;

    if (category === '카테고리' || title === '' || content === '') {
        e.preventDefault();
        alert('카테고리, 제목, 내용을 모두 작성해주세요.');
        return;
    }
    if (videoUrl && !isValidYouTubeUrl(videoUrl)) {
        e.preventDefault();
        alert('유효하지 않은 YouTube 주소입니다. 다시 확인해주세요.');
    }
});
	
	    //유튜브주소 유효성 검사 정규표현식
	function isValidYouTubeUrl(url) {
	    const pattern = /^(https?:\/\/)?(www\.youtube\.com|youtu\.?be|music\.youtube\.com)\/.+$/;
	    return pattern.test(url);
	}
	
	  


        // 유튜브 api 제목과 썸네일만가져옴
        function fetchVideoData() {
            // 사용자가입력한uri주소 저장변수
            const videoUrlInput = document.getElementById('myInput').value;
            // 유튜브영상 id저장 변수
            var videoId = '';

            // 사용자가 입력한값이 youtu.be를 포함하는지 확인
            // youtu.be는 유튜브이 짧은 uri주소
            if (videoUrlInput.includes('youtu.be')) {
                videoId = videoUrlInput.split('youtu.be/')[1];
            }

            // youtu.be를 포함하지않을경우 
            //유튜브영상 id저장
            else if (videoUrlInput.includes('watch?v=')) {
                videoId = videoUrlInput.split('watch?v=')[1];
                var ampersandPosition = videoId.indexOf('&');
                if (ampersandPosition !== -1) {
                    videoId = videoId.substring(0, ampersandPosition);
                }
            }

            //사용자가 유효한 YouTube 동영상 URL을 입력하지 않은 경우
            if (videoId === '') {
                document.getElementsByClassName('insert-video')[0].innerHTML = '';
                return;
            }

            //youTube oEmbed API의 URL을 생성하고, 이를 apiUrl에 저장한다.
            //영상에대한 정보제공
           var apiUrl = 'https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=' + videoId + '&format=json';

            //apiUrl에서 데이터를 가져옵니다. 이는 JavaScript의 비동기 함수
            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error("HTTP error " + response.status);
                    }
                    return response.json()
                })
                .then(data => {
                	console.log(data);
                    var videoDiv = document.getElementsByClassName('insert-video')[0];
                    //유튜브 제목, 썸네일
                    videoDiv.innerHTML = '<h3>' + data.title + '</h3>' +
                    '<img src="' + data.thumbnail_url + '" alt="' + data.title + ' 썸네일">';
            })
                // 에러발생시 insert-video 내용지움
                .catch(error => {
                    document.getElementsByClassName('insert-video')[0].innerHTML = '';
                });
        }

        //myInput 입력이벤트가발생할때마다 함수실행
        document.getElementById('myInput').addEventListener('input', fetchVideoData);





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
            fetch('${path}/community/renamefile', {
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


      
         
        //동영상주소 호버시 value에'http:// 
        var input = document.getElementById('myInput');

        input.addEventListener('mouseover', function () {
            this.placeholder = 'https://';
        });

        input.addEventListener('mouseout', function () {
            this.placeholder = '유튜브동영상만 가능합니다. 주소를 입력해주세요(선택)';
        });
        see1 = function () {
        	
            console.log(editor.getHTML());
        }


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
