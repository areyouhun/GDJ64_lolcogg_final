<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" href="${path}/resources/css/member/member.css">
<!------------------------------------>
<title>회원가입</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                <!--------------------------------- Code below --------------------------------->
                <!-- 작업영역 -->
                <div>
                    <p class="enrollTitle color-white ff-macho fs-25 ">회원가입</p>
                </div>
                <form action="${path }/member/insertMember.do" method="post" onsubmit="return checkForm();" enctype="multipart/form-data">
                    <div class="divFlex">
                        <div class="enrollBox ">
                            <div class="line">
								<p class="color-white ff-suit fw-bold">*이메일(ID)</p>
                                <input type="text" class ="ff-suit" placeholder="ex. abc@abc.com" name="email" id="email" oninput = "checkEmail()" required>
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">*비밀번호</p>
                                <input type="password" class ="ff-suit" placeholder="영문, 숫자, 특수문자 포함 8자 이상 입력" name="password_1" id="password_1" required>
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">*비밀번호 확인</p>
                                <input type="password" class ="ff-suit" placeholder="영문, 숫자, 특수문자 포함 8자 이상 입력" name="password_2" id="password_2" required>
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">*닉네임</p>
                                <input type="text" class ="ff-suit" placeholder="2자 이상 8자 이내 입력 가능(한글, 영어, 숫자)" name="nickName" id="nickName" oninput = "checkNickName()"  required>
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">응원팀</p>
                                <div class="abbrCheckBox">
                                    <div class="abbrCheckBoxRows">
                                        <div class="abbrCheckBoxRow">
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/dplus_logo_white.png" alt="" width="35px" height="35px">
											    <label class="line">
											        <input type="radio" name="abbr" value="DK" >
											        <span class="color-white ff-suit abbrName">DK</span>
											    </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/brion_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="BRO" >
                                                    <span class="color-white ff-suit abbrName">BRO</span>
                                                </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/redforce_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="NS" >
                                                    <span class="color-white ff-suit abbrName">NS</span>
                                                </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/geng_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="GEN" >
                                                    <span class="color-white ff-suit abbrName">GEN</span>
                                                </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/t1_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="T1" >
                                                    <span class="color-white ff-suit abbrName">T1</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="abbrCheckBoxRow">
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/hanwha_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="HLE" >
                                                    <span class="color-white ff-suit abbrName">HLE</span>
                                                </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/freecs_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="KDF" >
                                                    <span class="color-white ff-suit abbrName">KDF</span>
                                                </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/drx_logo_small.png" alt="" width="33px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="DRX" >
                                                    <span class="color-white ff-suit abbrName">DRX</span>
                                                </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/kt_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="KT" >
                                                    <span class="color-white ff-suit abbrName">KT</span>
                                                </label>
                                            </div>
                                            <div class="abbrCheckBox">
                                                <img src="${path}/resources/images/member/enroll_logo/sandbox_logo_small.png" alt="" width="35px" height="35px">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="LSB" >
                                                    <span class="color-white ff-suit abbrName">LSB</span>
                                                </label>
                                            </div>
                                            <!-- 미선택 오류 방지용 -->
                                            <div class="abbrCheckBox" style="display:none">
                                                <label class="line">
                                                    <input type="radio" name="abbr" value="" checked="checked" >
                                                    <span class="color-white ff-suit abbrName" >미선택시 오류 방지용</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p class="color-white fs-10 info" >[*응원팀 선택 시 응원팀 랜덤 카드 + 응원팀 대표 이모티콘 지급]</p>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">프로필이미지</p>
                                <input type="file" name="file" id="file" accept="image/*"  style="display:none" /> 
                                <input type="text" name="file" class ="ff-suit fileValue" placeholder="이미지를 선택해주세요" readonly>
                            </div>
                            <div class="line">
                                <div class="previewBox1">
                                    <p class="color-white ff-macho fs-10">미리보기</p>
                                    <img src="${path}/resources/images/common/favicon-original.png" alt="" width="55px" height="55px" style="border-radius: 27.5px;" id="preview-image">
                                </div>
                                <div class='v-line'></div>
                                <div class="previewBox2">
                                    <p class="color-white ff-macho fs-10">추천 이미지</p>
								    <img src="${path}/resources/images/member/sad.png" alt="" width="50px" height="50px" style="border-radius: 25px;" class="recommend-image" onclick="setPreviewImage('${path}/resources/images/member/sad.png')">
								    <img src="${path}/resources/images/member/smile.png" alt="" width="50px" height="50px" style="border-radius: 25px;" class="recommend-image" onclick="setPreviewImage('${path}/resources/images/member/smile.png')">
								    <img src="${path}/resources/images/member/run.png" alt="" width="50px" height="50px" style="border-radius: 25px;" class="recommend-image" onclick="setPreviewImage('${path}/resources/images/member/run.png')">
                                </div>
                            </div>
                            <div class="line">
                                <p class="color-white ff-suit fw-bold">추천인 코드 입력</p>
                                <input type="text" class ="ff-suit" placeholder="추천인 코드를 입력해주세요" name="myReferralCode" id="myReferralCode" oninput = "checkMyReferralCode()">
                            </div>
                            <p class="color-white fs-10 info" >[*추천인 코드 입력 시 웰컴 포인트 지급]</p>
                            <div class='h-line1'></div>
                        </div>
                        <div class="buttonBox">
                        	<div>
	                            <div class="duplicationCheck ff-suit" id="mail-Check-btn"  >이메일 인증</div>
	                           	<input class="duplicationCheck mail-check-input" placeholder="인증번호 " disabled="disabled" maxlength="7" onkeyup="checkAuthNumFn()" style="display:none" >
	                            <span id="mail-check-warn" class="mb-2"></span>
	                            <!-- <span class="email_ok">사용 가능한 이메일입니다.</span> -->
								<span class="email_already">사용중인 이메일</span>	
	                        	<div style="width:200px; position:absolute; top:283px">
									<span class="nickName_ok">사용가능 닉네임</span>
									<span class="nickName_already">사용중 닉네임</span>
	                        	</div>
                        	</div>
                        	<div>
	                            <div class="duplicationCheck ff-suit" onclick="onClickUpload();">이미지 선택</div>
	                            <div class="myReferralCode_ok">입력 가능</div>
                        	</div>
                        </div>
                    </div>
                    <div class="container d-flex flex-column" style="padding-top:1rem;text-align: center; ">
                        <p class="color-white ff-suit fw-bold fs-20" style="margin-right:13em;"> 약관 동의</p>
                        <span class="color-white ff-suit fs-15"  style="margin-right:0em;">* 아래 약관 확인 후 동의 가능</span>
                        <div class="flex-center" style="padding-top:1rem;">
                            <textarea id="privacy_scroll" style="resize:none; width:25%; height:5rem; padding:0.5rem; background-color: #505050; color: #eeeeee;" readonly>
개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 개인정보 취급방침 동의하시면 됩니다. 
                            </textarea>			
                        </div>
                        <div style="margin: 1em 0 1em 0 ;">
                            <b class="color-white ff-suit fs-15" >개인정보 취급방침에 동의하십니까?</b> 
                            <div class="radio-wrapper" style="margin:0.5em 0 0 0">
                                <label id="privacy-text1" style="margin-left:0.5rem; color:#505050;">
                                    <input type="radio" id="agree" name="privacy" value="agree" style="border:1px solid #e3e3e3; background-color:#e3e3e3;" disabled> 동의함 
                                </label>
                                <label id="privacy-text2" style="margin-left:0.5rem; color:#505050;">
                                    <input type="radio" id="disagree" name="privacy" value="disagree" style="border:1px solid #e3e3e3; background-color:#e3e3e3;" checked="checked" disabled/> 동의안함 
                                </label>
                            </div>
                        </div>		
                        <!-- <input type="submit" value="가입하기" class="enrollButton"  > -->
                        <input type="submit" value="가입하기" class="enrollButton" onclick="return test();" >
               		</div>
                </form>
			</div>
		</div>    
    </section>
<!-- <img class="english" src="https://media3.giphy.com/media/l0Ex9w7OHj6M3ieK4/200w.webp?cid=ecf05e47zmh2rpyt75g2cuqh3fddl9zalpfnw5sk9j9cz13p&rid=200w.webp" alt="english" width="20px" height="20px"> -->


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script src="${path}/resources/js/member/enroll.js"></script>
<!-------------------------------------------->
</body>
</html>