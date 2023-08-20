/*회원가입*/
//(이메일)
	//이메일 인증
	const mailCheck = document.querySelector('#mail-Check-btn');
	mailCheck.addEventListener("click", () => {
		alert("인증메일이 전송되기까지 수 초가 소요됩니다.")
	    const $email = document.querySelector('#email');
	    const email = $email.value ;
	    $email.readOnly = true;
	    const user = {
	        username: email
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
	            alert("입력하신 메일에 인증번호가 전송 되었습니다. 메일을 확인하여 인증번호를 입력해주세요.");
	            authNum = json;
	            console.log("authNum");
	            document.querySelector('.mail-check-input').removeAttribute('disabled');
	            document.querySelector('.mail-check-input').removeAttribute('style');
	        } else {
	            alert("인증메일 전송에 실패 하였습니다.");
	        }
	    })
	    .catch((error) => {
	        console.error("Fetch error:", error);
	        alert("에러가 발생하였습니다. 이메일을 다시 확인해주세요.");
	    });
	});

	//인증번호 입력
	var authResult = false;
	function checkAuthNumFn() {
	    const mailCheckInput = document.querySelector('.mail-check-input').value;
	    const mailCheckWarn = document.getElementById('mail-check-warn');
	/*     console.log(mailCheckInput);
	    console.log(mailCheckWarn);
	    console.log(authNum); */
	    if (mailCheckInput != authNum) {
	        mailCheckWarn.textContent = "  인증번호가 다릅니다.";
	        mailCheckWarn.style.color = 'red';
	        mailCheckWarn.style.fontSize = '0.75em';
	        authResult = false;
	        return;
	    } else {
	        mailCheckWarn.textContent = "  인증되었습니다.";
	        mailCheckWarn.style.color = 'green';
	        mailCheckWarn.style.fontSize = '0.75em';
	        authResult = true;
	        return;
	    }
	}
	
	//ajax중복확인_이메일
	var duplicatecheck_email=false;
    function checkEmail(){
        var email = $('#email').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'./emailCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{email:email},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                   /*  $('.email_ok').css("display","inline-block");  */
                    $('#mail-Check-btn').css("display","inline-block");
                    $('.email_already').css("display", "none");
                    duplicatecheck_email=true;
                    /*console.log(duplicatecheck_email);*/
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.email_already').css("display","inline-block");
					$('#mail-Check-btn').css("display", "none");
                   /*  $('.email_ok').css("display", "none"); */
                    duplicatecheck_email=false;
                    /*console.log(duplicatecheck_email);*/
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
	};
	
//(닉네임)	
	//ajax중복확인_닉네임
	var duplicatecheck_nickName=false;
    function checkNickName(){
        var nickName = $('#nickName').val(); 
		var regexNickname =  /^[가-힣a-zA-Z0-9]{2,8}$/;
		if(!regexNickname.test(nickName)) {
			/* alert("닉네임은 한글, 숫자, 영어로 2자 이상 8자 이내 입력 가능합니다."); */
            $('.nickName_already').css("display", "none");
            $('.nickName_ok').css("display", "none");
		}else{
			$.ajax({
	            url:'./nickNameCheck', 
	            type:'post',
	            data:{nickName:nickName},
	            success:function(cnt){ 
	                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 닉네임 
	                    $('.nickName_ok').css("display","inline-block"); 
	                    $('.nickName_already').css("display", "none");
	                    duplicatecheck_nickName=true;
	                    /*console.log(duplicatecheck_nickName);*/
	                } else { // cnt가 1일 경우 -> 이미 존재하는 닉네임
	                    $('.nickName_already').css("display","inline-block");
	                    $('.nickName_ok').css("display", "none");
	                    duplicatecheck_nickName=false;
	                    /*console.log(duplicatecheck_nickName);*/
	                }
	            },
	            error:function(){
	                alert("에러입니다");
	            }
	        });
		}       
	};
	
//(프로필이미지)
	// '이미지 선택' 버튼 클릭을 통한 숨겨진 input[Id='file'] 클릭
	function onClickUpload() {
		let myInput = document.getElementById("file");
		myInput.click();
		/*console.log($("input[name=file]"))*/
	}
	
	// 클라이언트가 프로필 이미지 파일 선택 시 선택한 파일명을 화면에 나타내는 이벤트 
	$("input[name=file]").on("change", function() {
		var file = this.files[0],
			fileName = file.name,
			fileSize = file.size;
		// alert("Uploading: " + fileName + " @ " + fileSize + "bytes");
		//CustomFileHandlingFunction(file);
		$(".fileValue").val(fileName);
	});
	
	// 클라이언트가 프로필 이미지 파일 선택시 선택한 파일을 미리보기로 나타내는 이벤트
	const inputImage = document.getElementById("file")
	inputImage.addEventListener("change", e => {
		readImage(e.target)
	})
	function readImage(input) {
		// 인풋 태그에 파일이 있는 경우
		if (input.files && input.files[0]) {
			// FileReader 인스턴스 생성
			const reader = new FileReader()
			// 이미지가 로드가 된 경우
			reader.onload = e => {
				const previewImage = document.getElementById("preview-image")
				previewImage.src = e.target.result
			}
			// reader가 이미지 읽도록 하기
			reader.readAsDataURL(input.files[0])
		}
	}
	
	//추천 이미지 선택 기능
	const recommendImages = document.querySelectorAll('.recommend-image');
	const fileValueInput = document.querySelector('.fileValue');
	const fileInput = document.getElementById('file');
	recommendImages.forEach(image => {
	    image.addEventListener('click', () => {
	        const imagePath = image.src;
	        const imageName = imagePath.substring(imagePath.lastIndexOf('/') + 1);
	        fileValueInput.value = imageName;
	        if (fileInput.value) {
	            fileInput.value = ''; // 파일 선택 해제
	        }
	    });
	});
	//추천 이미지 클릭 시 미리보기에 반영
	function setPreviewImage(imageSource) {
	    var previewImage = document.getElementById('preview-image');
	    previewImage.src = imageSource;
	}
	
//(추천인 코드 입력)
	//ajax중복확인_추천인 코드
	var check_myReferralCode=true;
    function checkMyReferralCode(){
        var myReferralCode = $('#myReferralCode').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'./myReferralCode', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{myReferralCode:myReferralCode},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
			    if ($('#myReferralCode').val() == "") {
			        check_myReferralCode = true;
                    /*console.log(check_myReferralCode);*/
			    } else if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 존재하지 않는 추천인 코드
                    $('.myReferralCode_ok').css("display", "none");
                    check_myReferralCode=false;
                    /*console.log(check_myReferralCode);*/
                } else { // cnt가 1일 경우 -> 존재하는 추천인 코드
                    $('.myReferralCode_ok').css("display","inline-block");
                    check_myReferralCode=true;
                    /*console.log(check_myReferralCode);*/
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
	};

//(악관동의)
	// 약관동의 확인 처리
	$("#privacy_scroll").scroll(function() {
		var scrollTop = $(this).scrollTop();
		var scrollHeight = $(this).prop('scrollHeight');
	
		if (scrollTop + 350 >= scrollHeight) {
			$("#agree").removeAttr("disabled");
			$("#disagree").removeAttr("disabled");
			$("#privacy-text1").css("color", "white");
			$("#privacy-text2").css("color", "white");
			$("#privacy_submit").attr("disabled");
			$("#agree").css("border", "1px solid black");
			$("#disagree").css("border", "1px solid black");
	
			// privacy라는 name을 가진 radio input의 check css 변경
			$('input[name="privacy"]').each(function() {
				var checked = $(this).prop('checked');
				if (checked) {
					$(this).css("background-color", "black");
				} else {
					$(this).css("background-color", "white");
				}
			});
		}
	});   
	
	//(가입하기) 
	// 가입하기 체크1 - 비밀번호, 닉네임 정책에 따른 정규식 체크 
	function test(){
		var email=$("#email");
		var pw=$("#password_1");
		var pw2=$("#password_2");
		var nickName=$("#nickName");
		// 공란 확인 - 이메일, 비밀번호, 비밀번호 확인, 닉네임 
		if(email.val()==""){
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}
		if(pw.val()==""){
			alert("비밀번호를 입력해주세요.");
			pw.focus();		  	
			return false;
		}
		if(pw2.val()==""){
			alert("비밀번호 확인 입력해주세요.");
			pw2.focus();		  	
			return false;
		}
		if(nickName.val()==""){
			alert("닉네임 입력해주세요.");
			nickName.focus();		  	
			return false;
		}
		
		// 비밀번호 정규식 체크 
		var regexPw =  /^.*(?=^.{8,99}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!regexPw.test(pw.val())) {
			alert("비밀번호는 8자 이상 영문 대소문자, 숫자, 특수문자를 사용하세요.");
			pw.focus();	
			return false;
		}
		if(pw.val()!=pw2.val()) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 확인해주세요.");
			pw2.val("");
			pw2.focus();		  	
			return false;
		}
		
		// 닉네임 정규식 체크 
		var regexnickName=  /^[가-힣a-zA-Z0-9]{2,8}$/;
		if(!regexnickName.test(nickName.val())) {
			alert("닉네임은 한글, 숫자, 영어로 2자 이상 8자 이내 입력 가능합니다.");
			nickName.focus();		  	
			return false;
		}
		
		if(!authResult){
			alert("이메일 인증을 해주세요.");
		  	$("#email").focus();		  	
			return false;
		}
		
		// 중복&인증 여부 체크 
		/*console.log(duplicatecheck_email); // 이메일 중복 여부
		console.log(authResult); // 이메일 인증 여부
		console.log(duplicatecheck_nickName); // 닉네임 중복 여부
		console.log(check_myReferralCode); // 추천인 코드 확인*/
		if(!duplicatecheck_email){
			alert("중복되지 않는 이메일을 이용해주세요.");
		  	$("#email").focus();		  	
			return false;
		}
 		if(!authResult){
			alert("이메일 인증을 해주세요.");
		  	$("#email").focus();		  	
			return false;
		} 
		if(!duplicatecheck_nickName){
			alert("중복되지 않는 닉네임을 이용해주세요.");
		  	$("#nickName").focus();		  	
			return false;
		}
		if (check_myReferralCode == false) {
			/*console.log(check_myReferralCode);*/
			alert("이용가능한 추천인 코드를 입력해주세요.");
		  	$("#myReferralCode").focus();		  	
			return false;
		} 
		if (!$("#agree").prop('checked')) {
	        alert("약관을 동의해주세요");
	        return false;
	    }
		return true;
	}
	
	//onsubmit
	function checkForm() {
		return true;
	}