/* 아이디 저장 */
	$(function() {
		fnInit();
	});
	
	function frm_check() {
		saveid();
	}
	
	function fnInit() {
		var cookieid = getCookie("saveid");
		/*console.log(cookieid);*/
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
		/*console.log(document.cookie);*/
	}
	function getCookie(Name) {
		var search = Name + "=";
		/*console.log("search : " + search);*/
	
		if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
			offset = document.cookie.indexOf(search);
			/*console.log("offset : " + offset);*/
			if (offset != -1) { // 쿠키가 존재하면 
				offset += search.length;
				// set index of beginning of value
				end = document.cookie.indexOf(";", offset);
				/*console.log("end : " + end);*/
				// 쿠키 값의 마지막 위치 인덱스 번호 설정 
				if (end == -1)
					end = document.cookie.length;
				/*console.log("end위치  : " + end);*/
	
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

    // 카카오 SDK 초기화
    Kakao.init('5e6bb71a42bd433b177e7105d219f644');
    const kakaologin=()=>{
        /*console.log(Kakao.isInitialized()); */
         let email,nickname,image;
            Kakao.Auth.login({
               scope:'profile_nickname,account_email,profile_image',
               success:function(authObj){
                  /*console.log(authObj);*/
                  Kakao.API.request({
                     url:'/v2/user/me',
                     success:function(res){
                        const kakao_account=res.kakao_account;
                        /*console.log(kakao_account);*/
                        email=kakao_account.email;
                        nickname=kakao_account.profile.nickname;
                        image=kakao_account.profile.thumbnail_image_url;
                        /*console.log(email,nickname,image);*/
                           $.ajax({
                              type:"get",
                              url:"../login/KakaoLoginCheck",
                              data:{"memberEmail":email,"memberNickname":nickname,"memberImage":image},
                              dataType:"text",
                              success: data=>{
                                 /*console.log(data, typeof data);
                                 console.log(data=='')*/
                                    if(data==''){
                                         location.assign("../login/Kakaoenroll?memberEmail="+email+"&memberNickname="+nickname+"&memberImage="+image);
                                    }else{
                                       location.assign("../login/KakaoLogin?memberEmail="+email+"&memberNickname="+nickname+"&memberImage="+image);
                                    }
                                    },
                              error:(r,m,e)=>{
                                       console.log(r);
                                       console.log(m);
                                    }
                           });
                     }
                  });
               }
            });
        }
        
const CLIENT_ID = "dNio2a8IwW1bwAeDTYAA";
/*const redirectURI = "http://localhost:7070/login/naverLogin";*/
const redirectURI = "http://14.36.141.71:10005/GDJ64_lolcogg_final/login/naverLogin";
const state ="1";
const naverLogin=()=>{
	/*console.log("여기오니?");*/
	location.assign("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+CLIENT_ID+"&redirect_uri="+redirectURI+"&state="+state);
}