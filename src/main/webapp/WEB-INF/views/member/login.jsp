<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" href="${path}/resources/css/member.css">
<!------------------------------------>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

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
                        <p class=" fs-15 ff-suit color-white">아이디 저장</p>
                    </div>
                    <div class="loginButton">
                        <input type="submit" class ="ff-suit fw-bold" value="로그인">
                    </div>
                </form>
                <div class="memberCheckBox">
                    <a href="${path }/member/enrollMember.do" class="ff-suit">회원가입</a>
                    <p class="color-white">&nbsp;&nbsp;|&nbsp;&nbsp;</p>
                    <a href="${path }/lolco/find-password.html" class="ff-suit">비밀번호 찾기</a>
                </div>
                <div class="socialLoginBox">
                    <a href="${path }/login/naver/callback"><img src="${path}/resources/images/member/naver_logo_icon.png" ></a>
                    <div></div>
                    <img src="${path}/resources/images/member/kakaotalk_logo_icon.png" onclick="return kakaologin();">
                    <div></div>
                </div>
        		<!------------------------------------------------------------------------------>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<%-- <script src="${path}/resources/js/member/member.js"></script>
 --%><script>
    // 카카오 SDK 초기화
    Kakao.init('5e6bb71a42bd433b177e7105d219f644');
    const kakaologin=()=>{
        console.log(Kakao.isInitialized()); 
         let email,nickname,image;
            Kakao.Auth.login({
               scope:'profile_nickname,account_email,profile_image',
               success:function(authObj){
                  console.log(authObj);
                  Kakao.API.request({
                     url:'/v2/user/me',
                     success:function(res){
                        const kakao_account=res.kakao_account;
                        console.log(kakao_account);
                        email=kakao_account.email;
                        nickname=kakao_account.profile.nickname;
                        image=kakao_account.profile.thumbnail_image_url;
                        console.log(email,nickname,image);
                           $.ajax({
                              type:"get",
                              url:"../login/KakaoLoginCheck",
                              data:{"memberEmail":email,"memberNickname":nickname,"memberImage":image},
                              dataType:"text",
                              success: data=>{
                                 console.log(data, typeof data);
                                 console.log(data=='')
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
</script>
<!-------------------------------------------->
</body>
</html>