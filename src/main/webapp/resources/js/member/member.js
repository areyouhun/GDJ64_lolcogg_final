/* 아이디 저장 */
$(function() {
	fnInit();
});

function frm_check() {
	saveid();
}

function fnInit() {
	var cookieid = getCookie("saveid");
	console.log(cookieid);
	if (cookieid != "") {
		$("input:checkbox[id='saveId']").prop("checked", true);
		$('#logId').val(cookieid);
	}
}
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setTime(todayDate.getTime() + 0);
	if (todayDate > expiredays) {
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
	} else if (todayDate < expiredays) {
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	console.log(document.cookie);
}
function getCookie(Name) {
	var search = Name + "=";
	console.log("search : " + search);

	if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
		offset = document.cookie.indexOf(search);
		console.log("offset : " + offset);
		if (offset != -1) { // 쿠키가 존재하면 
			offset += search.length;
			// set index of beginning of value
			end = document.cookie.indexOf(";", offset);
			console.log("end : " + end);
			// 쿠키 값의 마지막 위치 인덱스 번호 설정 
			if (end == -1)
				end = document.cookie.length;
			console.log("end위치  : " + end);

			return unescape(document.cookie.substring(offset, end));
		}
	}
	return "";
}
function saveid() {
	var expdate = new Date();
	if ($("#saveId").is(":checked")) {
		expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
		setCookie("saveid", $("#logId").val(), expdate);
	} else {
		expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
		setCookie("saveid", $("#logId").val(), expdate);
	}
}

/*회원가입*/
// '이미지 선택' 버튼 클릭을 통한 숨겨진 input[Id='file'] 클릭
function onClickUpload() {
	let myInput = document.getElementById("file");
	console.log($("input[name=file]"))
	myInput.click();
	console.log($("input[name=file]"))
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