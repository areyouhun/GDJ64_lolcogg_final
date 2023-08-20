<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" href="${path}/resources/css/member/member.css">
<!------------------------------------>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<title>로그인</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navsBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <!--------------------------------- Code below --------------------------------->
                <!-- 작업영역 -->
                <p class="loginTitle color-white ff-macho fs-30 ">로그인</p>
                <form action="${path }/member/loginCheck" method="post" onsubmit="return frm_check();" >
                    <div class="loginBox">
                        <input type="text" id="logId" class =" ff-suit" placeholder="이메일" name="email">
                        <input type="password" class ="ff-suit" placeholder="비밀번호" name="password">
                    </div>
                    <div class="autoLoginBox">
						<input id="saveId" type="checkbox" value="">
						<p class="fs-15 ff-suit color-white">
						    <label for="saveId">아이디 저장</label>
						</p>
                    </div>
                    <div class="loginButton">
                        <input type="submit" class ="ff-suit fw-bold" value="로그인">
                    </div>
                </form>
                <div class="memberCheckBox">
                    <a href="${path }/member/enrollMember.do" class="ff-suit">회원가입</a>
                    <p class="color-white">&nbsp;&nbsp;|&nbsp;&nbsp;</p>
					<p class="color-white ff-suit" id="passwordSearchModalButton" style="cursor: pointer;">비밀번호 찾기</p>
                </div>
                <div class="socialLoginBox">
                    <img src="${path}/resources/images/member/naver_logo_icon.png" onclick="naverLogin();"  > <!-- REST API -->
                    <div></div>
                    <img src="${path}/resources/images/member/kakaotalk_logo_icon.png" onclick="return kakaologin();"> <!-- JAVASCRIPT -->
                    <div></div>
                </div>
        		<!------------------------------------------------------------------------------>
            </div>
        </div>
    </section>
    <!-- 비밀번호 변경 모달 -->
<div class="modal-background" id="passwordCheckModalBackground">
    <div class="modal" id="passwordModal">
        <div class="modal-header">
            <h5 class="ff-suit fs-20 fw-bold">비밀번호 찾기</h5>
        </div>
        <div class="modal-body">
        	<br>
        	<!-- step 1 : 이메일 확인 -->
			<label for="inputEamil">이메일:</label>
			<input type="email" id="inputEamil" name="inputEamil" placeholder="이메일 입력" required>
			<button type="button" class="btn duplicationCheck ff-suit fs-15" id="passwordModalConfirmButton">이메일 조회</button>
            <h5 class="ff-suit ff-20" style="color : red ; display:none" id="passwordCheck"></h5>
            
            <!-- step 2 : 인증번호 확인 -->
            <label for="inputCertification" style = "display : none;">인증번호:</label>
			<input type="text" id="inputCertification" name="inputCertification" placeholder="인증번호 입력" style = "display : none;" required>
			<button type="button" class="btn duplicationCheck ff-suit " id="certificationModalConfirmButton" style = "display : none;">인증번호 전송</button>
            <h5 class="ff-suit ff-20 color-white" style="display:none;" id="certificationCheck">'인증번호 전송' 클릭 시 메일이 발송됩니다.</h5>
            
            <!-- step 3 : 비밀번호 변경 -->
            <label for="newPassword" style = "display : none;">새 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="영문, 숫자, 특수문자 포함 8자" style = "display : none;" required ><br>
            <label for="confirmNewPassword" style = "display : none;">비밀번호 확인&nbsp;</label>
            <input type="password" id="confirmNewPassword" name="confirmNewPassword" placeholder="영문, 숫자, 특수문자 포함 8자" style = "display : none;" required >
            <h5 class="ff-suit ff-20" style="color : red ;  display:none;" id="passwordCheck2"></h5>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="passwordModalConfirmButton3" style = "display : none;">확인</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="passwordModalConfirmButton2" style = "display : none;">변경</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="closeModalButton2">닫기</button>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script src="${path}/resources/js/member/login.js"></script>
<script>
	/* 프로필 이미지 변경, 비밀번호 변경, 회원 탈퇴 기능(ajax) */
	setupModal('passwordSearchModalButton', 'passwordCheckModalBackground', 'closeModalButton2', 'passwordModalConfirmButton');
	function setupModal(showButtonId, modalBackgroundId, closeModalButtonId, confirmButtonId) {
	    const showModalButton = document.getElementById(showButtonId);
	    const modalBackground = document.getElementById(modalBackgroundId);
	    const closeModalButton = document.getElementById(closeModalButtonId);
	    const confirmButton = document.getElementById(confirmButtonId);
	    showModalButton.addEventListener('click', () => {
	        modalBackground.style.display = 'flex';
	    });
	    modalBackground.addEventListener('click', (event) => {
	        if (event.target === modalBackground) {
	            modalBackground.style.display = 'none';
	        }
	    });
	    closeModalButton.addEventListener('click', () => {
	        modalBackground.style.display = 'none';
	    });
	    
	    //비밀번호 찾기 step1
	  	var inputEamil=$("#inputEamil");
	  	var encryptionEamil = ""; //암호화 이메일 받는 용도
	    if (confirmButton==document.getElementById('passwordModalConfirmButton')) {
			/* alert 버블링 현상 있습니다. */
			/* 비밀번호 예외처리 - 빈값 */
	    	confirmButton.addEventListener('click', () => {
	    		if(inputEamil.val()==""){
	    			inputEamil.focus();	
	    			document.querySelector("#passwordCheck").style.display = "inline-block";
	    			document.querySelector("#passwordCheck").innerText = "이메일을 입력해주세요.";
	    			return false;
	    		}
				$.ajax({
					type : 'POST',
					url : '${path}/mypage/emailCheck',
					data : {
						"inputEmail" :$("input[name='inputEamil']").val()
					},
					success : function(response){ //컨트롤러에서 넘어온 cnt값을 받는다 
		                if(response.cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		        			inputEamil.focus();
		        			document.querySelector("#passwordCheck").innerText = "일치하는 이메일이 없습니다";
		        			document.querySelector("#passwordCheck").style.display = "inline-block";
		                } else if(response.cnt == 1){ // cnt가 1일 경우 -> 이미 존재하는 아이디, 비밀번호 일치
		                	document.querySelectorAll("label[for='inputEamil'], input[type='email'][name='inputEamil'], button[id='passwordModalConfirmButton'], h5[id='passwordCheck']")
		                		.forEach(function(element) {
		                	    element.style.display = "none"; 
		                	});
		                	document.querySelectorAll("label[for='inputCertification'], input[type='text'][name='inputCertification'], button[id='certificationModalConfirmButton'], h5[id='certificationCheck']")
		                		.forEach(function(element) {
		                	    element.style.display = "inline-block";
		                	});
		                } else if (response.cnt == -1){
		        			document.querySelector("#passwordCheck").innerText = "소셜로그인(카카오)에 사용된 계정입니다.(*실제 로그인 이메일과 다릅니다) ";
		        			document.querySelector("#passwordCheck").style.display = "inline-block";
		                } else if (response.cnt == -2){
		        			document.querySelector("#passwordCheck").innerText = "소셜로그인(네이버)에 사용된 계정입니다. (*실제 로그인 이메일과 다릅니다)";
		        			document.querySelector("#passwordCheck").style.display = "inline-block";
		                }
		                inputEamil = $("input[name='inputEamil']").val(); // 이메일 원형
		                encryptionEamil = response.email; // 암호화된 이메일로 값 넣기
		             },
					error : function(request, status, error) { 
				        console.log(error)
				    }
				})
			});
	    }
	    
	    //비밀번호 찾기 step2
	  	var inputCertification=$("#inputCertification");
	    /* console.log(inputCertification); */
	  	document.getElementById('certificationModalConfirmButton').addEventListener('click', () => {
			    const user = {
			        username: inputEamil
			    }
			    const url = "api/mailcheck";
	    		fetch(url, {
	    	        method: "POST",
	    	        body: JSON.stringify(user),
	    	        headers: {
	    	            "Content-Type": "application/json"
	    	        }
	    	    })
	    		.then((response) => {
	    		    if (response.status === 500) {
	    	    	    $email.readOnly = false;
	    	    	    $email.value="";
	    	    	    $email.focus();
	    		        throw new Error("이메일을 다시 확인해주세요.");
	    		    }
	    		    return response.json();
	    		})
	    	    .then((json) => {
	    	        if (json !== null) {
	    	        	alert("입력하신 메일에 인증번호가 전송 되었습니다.\n" + inputEamil + "에서 메일을 확인하여 인증번호를 입력해주세요.");
	    	            authNum = json;
	    	            console.log("authNum");
	    	            $("#certificationCheck").text("인증번호를 입력해주세요.");
		    			document.querySelector("#passwordModalConfirmButton3").style.display = "inline-block";
	    	        } else {
	    	            alert("인증메일 전송에 실패 하였습니다.");
	    	        }
	    	    })
	    	    .catch((error) => {
	    	        console.error("Fetch error:", error);
	    	        alert("에러가 발생하였습니다. 이메일을 다시 확인해주세요.");
	    	    });
	    		
	    		// 인증번호 검증 : 빈값, 일치여부
    	    	var inputCertification = $("#inputCertification");
	    	    $("#passwordModalConfirmButton3").click(function() {
	    	        if (inputCertification.val() === "") {
	    	            inputCertification.focus();
	    	            $("#certificationCheck").css("display", "inline-block");
	    	            $("#certificationCheck").text("인증번호를 입력해주세요.");
	    	            return false;
	    	        }
	    	    });
	    	    var authResult = false; //인증번호 확인 변수
	    	    inputCertification.on("input", function() {
	    	        // 인증번호 입력
	    	        var mailCheckInput = $(this).val();
	    	        var mailCheckWarn = $("#certificationCheck");

	    	        if (mailCheckInput != authNum) {
	    	            mailCheckWarn.text("인증번호가 다릅니다.");
	    	            mailCheckWarn.css("color", "red");
	    	            mailCheckWarn.css("fontSize", "0.75em");
	    	            authResult = false;
	    		        return;
	    	        } else {
	    	            mailCheckWarn.text("인증되었습니다.");
	    	            mailCheckWarn.css("color", "green");
	    	            mailCheckWarn.css("fontSize", "0.75em");
	    	            authResult = true;
	    		        return;
	    	        }
	    	    });
	    	    $("#passwordModalConfirmButton3").click(function(){
	    	    	if(authResult){
                		document.querySelectorAll("label[for='inputCertification'], input[type='text'][name='inputCertification'], button[id='certificationModalConfirmButton'], h5[id='certificationCheck'], button[id='passwordModalConfirmButton3']")
                		.forEach(function(element) {
                	    element.style.display = "none";
                		});
	                	document.querySelectorAll(" label[for='newPassword'], input[type='password'][name='newPassword'], label[for='confirmNewPassword'], input[type='password'][name='confirmNewPassword'], button[id='passwordModalConfirmButton2']")
                		.forEach(function(element) {
                	    element.style.display = "inline-block";
                		});
	    	    	}else{
	    	    		alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
	    	    	}
	    	    	
	    	    });
	    	    
			});
		
		//비밀번호 찾기 step3
		document.getElementById('passwordModalConfirmButton2').addEventListener('click', () => {
			/* alert 버블링 현상 있습니다. */
			/* 비밀번호 예외처리 - 빈값, 정규식, 기존비밀번호와 일치 */
			var newPassword=$("#newPassword");
			var confirmNewPassword=$("#confirmNewPassword");
			if(newPassword.val()==""){
				newPassword.focus();		
				document.querySelector("#passwordCheck2").style.display = "inline-block";
				document.querySelector("#passwordCheck2").innerText = "새 비밀번호를 입력해주세요.";
				return false;
			}
			if(confirmNewPassword.val()==""){
				confirmNewPassword.focus();		  
				document.querySelector("#passwordCheck2").style.display = "inline-block";
				document.querySelector("#passwordCheck2").innerText = "비밀번호 확인을 입력해주세요.";
				return false;
			}
			var regexPw =  /^.*(?=^.{8,99}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			if(!regexPw.test(newPassword.val())) {
				newPassword.focus();	
				document.querySelector("#passwordCheck2").style.display = "inline-block";
				document.querySelector("#passwordCheck2").innerText = "영문,숫자,특수문자 포함 8자 이상 입력해주세요.";
				return false;
			}
			if(newPassword.val()!=confirmNewPassword.val()) {
				confirmNewPassword.val("");
				confirmNewPassword.focus();	
				document.querySelector("#passwordCheck2").style.display = "inline-block";
				document.querySelector("#passwordCheck2").innerText = "비밀번호가 일치하지 않습니다.";
				return false;
			}
// 			if(newPassword.val()==currentPassword.val()) {
// 				newPassword.focus();	
// 				document.querySelector("#passwordCheck2").style.display = "inline-block";
// 				document.querySelector("#passwordCheck2").innerText = "기존비밀번호입니다.";
// 				return false;
// 			} /* 현재 비밀번호와 일치여부. 비로그인 상태라 ajax로 처리해야함. 가능하긴함  */
			$.ajax({
				type : 'POST',
				url : '${path}/mypage/updatePassword',
				data : {
					"email" : encryptionEamil,
					"updatePassword" :$("input[name='newPassword']").val()
				},
				success : function(){
					location.href='${path}/member/loginPage';
				},
				error : function(request, status, error) { 
			        console.log(error)
			    }
			})
		});
	}
</script>
<!-------------------------------------------->
</body>
</html>