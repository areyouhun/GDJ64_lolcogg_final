<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/member.css"><!-- 줄 간격 늘릴려면 아래줄로 -->
<link rel="stylesheet"	href="${path}/resources/css/admin/style_adminList.css">

<title>회원관리</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
				<article class="admin-common-container">
					<div class="admin-common-upper">
						<p class="mainTitle fs-35 mainTitleMargin">회원관리</p>
						<div class="flex-grow"></div>
						<div class="admin-common-link">
							<a class="title" href="${path}/admin/reportManagement">신고관리</a>
							<a class="title" href="${path}/admin/storeManagement">상점관리</a>
						</div>
					</div>

					<div class="center-1280 background-img mainpage mainHeight">
						<div class="width-1280 reportPage-margin">
							<%
							java.util.Date currentDate = new java.util.Date();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String formattedDate = sdf.format(currentDate);
							%>
							<p class="color-white fw-bold ff-suit">lolcogg 총 가입 계정 : ${totalData } (<%= formattedDate %> 기준)</p><br>
							<div class="report-categpries">
								<%-- <div class="categories">
									<a href="${path }/admin/reportManagement"><span>전체 회원</span></a>
								</div>
								<div class="categories">
									<a href="${path }/admin/reportCmList"><span>응원팀 별 보기</span></a>
								</div>
								<div class="categories">
									<a href="${path }/admin/matchpredictionCmList"><span>칭호 별 보기</span></a>
								</div>
								<div class="categories">
									<a href="${path }/admin/matchpredictionCmList"><span>티어(경험치) 순</span></a>
								</div>
								<div class="categories">
									<a href="${path }/admin/matchpredictionCmList"><span>보유 포인트 순</span></a>
								</div>
								<div class="categories">
									<a href="${path }/admin/matchpredictionCmList"><span>가입일 순</span></a>
								</div>
								<div class="categories">
									<a href="${path }/admin/matchpredictionCmList"><span>탈퇴 회원</span></a>
								</div> --%>
								<div class="categories" id="emailEncryption">
									<a href="${path }/admin/emailEncryption"><span style="color:#D93829">[이메일 나타내기]</span></a>
								</div>
								<div class="categories" id="memberManagement">
									<a href="${path }/admin/memberManagement"><span style="color:#D93829">[이메일 감추기]</span></a>
								</div>
							</div>
							<table class="report-board content">
								<tr>
									<th>이메일</th>
									<th>닉네임</th>
									<th>프로필이미지</th>
									<th>응원팀</th>
									<th>칭호</th>
									<th>티어(경험치)</th>
									<th>포인트</th>
									<th>추천인코드</th>
									<th>가입일자</th>
									<th>탈퇴일자</th>
									<th>기능</th>
								</tr>
								<c:forEach var="m" items="${memberList}">
									<tr>
										<td class="m_title">${m.email}</td>
										<c:if test="${not empty m.nickname and fn:length(m.nickname) > 7}">
										  <td class="m_title" style="font-size: 13px;">${m.nickname}</td>
										</c:if>
										<c:if test="${empty m.nickname or fn:length(m.nickname) <= 7}">
										  <td class="m_title">${m.nickname}</td>
										</c:if>
										<td class="m_title">
											<c:if test="${m.profile != null && not empty m.password && m.password.contains('로그인')}">
												<!-- 소셜 로그인 -->
												<img src="${m.profile}"
													style="width: 40px; height: 40px; border-radius: 20px;">
											</c:if> 
											<c:if test="${m.profile != null && not empty m.password && !m.password.contains('로그인')}">
												<!-- 일반 로그인 -->
												<img src="${path}/resources/upload/profile/${m.profile}"
													style="width: 40px; height: 40px; border-radius: 20px;">
											</c:if>
										</td>
											<!-- ${m.teamAbbr} 값이 없는 경우는 img태그 삭제 _ JS -->
											<td class="m_title teamAbbr fs-10">
											    <span class="teamAbbrText">${m.teamAbbr}</span>
											</td>
										<c:if test="${not empty m.titleName and fn:length(m.titleName) > 7}">
										  <td class="m_title" style="font-size: 13px;">${m.titleName}</td>
										</c:if>
										<c:if test="${empty m.titleName or fn:length(m.titleName) <= 7}">
										  <td class="m_title">${m.titleName}</td>
										</c:if>
										<td class="m_title">
											<img src="${path}/resources/images/tier/${loginMember.tier.tierRulesNo.tierRulesImage}" style="width: 35px; height: 25px; margin-right: 0.2em">
											(${m.totalExp})
										</td>
										<td class="m_title">
											<img src="${path }/resources/images/store/pointImg.png" style="width: 15px; height: 15px; margin-right: 0.2em">${m.totalPoints}
										</td>
										<td class="m_title">${m.myReferralCode}</td>
										<td class="m_title">${m.enrollDate}</td>
										<td class="m_title">${m.withdrawDate}</td>
										
										<c:if test="${empty m.withdrawDate}"><!-- 비탈퇴 회원 -->
										  <td class="m_title" style="font-size: 13px;">
										  	<button class="mypageButton ff-suit fs-15 withdrawModalButton"  style="color:red;">회원 탈퇴</button> 
										  </td>
										</c:if>
										<c:if test="${not empty m.withdrawDate}"><!-- 탈퇴 회원 -->
										  <td class="m_title">
										  	<button class="mypageButton ff-suit fs-15 restoreModalButton"  style="color:green;">회원 복구</button>
										  </td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
							<div class="pageBar">
									<c:out value="${pageBar }" escapeXml="false" />
							</div>
						</div>
					</div>
				</article>
            </div>
        </div>
    </section>
<!-- 회원탈퇴 모달 -->
<div class="modal-background" id="withdrawModalBackground">
    <div class="modal" id="withdrawModal">
        <div class="modal-header">
            <h5 class="ff-macho ff-20">회원탈퇴</h5>
        </div>
        <div class="modal-body">
            <p>회원탈퇴 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="closeModalButton">취소</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="withdrawModalConfirmButton">탈퇴하기</button>
        </div>
    </div>
</div>
<!-- 회원 복구 모달 -->
<div class="modal-background" id="restoreModalBackground">
    <div class="modal" id="withdrawModal">
        <div class="modal-header">
            <h5 class="ff-macho ff-20">회원복구</h5>
        </div>
        <div class="modal-body">
            <p>회원복구 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="closeModalButton">취소</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="restoreModalConfirmButton">복구하기</button>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script>
/* 응원팀 이미지 파일 추출 */
const abbrImgMap = new Map([
	  ["DK", "dplus_logo_white.png"],
	  ["BRO", "brion_logo_small.png"],
	  ["NS", "redforce_logo_small.png"],
	  ["GEN", "geng_logo_small.png"],
	  ["T1", "t1_logo_small.png"],
	  ["HLE", "hanwha_logo_small.png"],
	  ["KDF", "freecs_logo_small.png"],
	  ["DRX", "drx_logo_small.png"],
	  ["KT", "kt_logo_small.png"],
	  ["LSB", "sandbox_logo_small.png"] 
	]);
$(document).ready(function() {
    $(".teamAbbr").each(function() {
        var abbr = $(this).find(".teamAbbrText").text().trim();
        var abbrImgFile = abbrImgMap.get(abbr);
        if (abbrImgFile != null) {
            var imgElement = $("<img>").attr({
                "src": "${path}/resources/images/member/enroll_logo/" + abbrImgFile,
                "alt": "",
                "width": "30px",
                "height": "30px",
                "style": "margin-right: 0.2em"
            });
            $(this).prepend(imgElement);
        }
    });
});
  
/* 세트 : 회원 탈퇴, 회원 복구 기능(ajax) */
// 회원 탈퇴
// 회원 탈퇴 모달 설정
setupModal('withdrawModalButton', 'withdrawModalBackground', 'closeModalButton', 'withdrawModalConfirmButton', true);
// 회원 복구 모달 설정
setupModal('restoreModalButton', 'restoreModalBackground', 'closeModalButton', 'restoreModalConfirmButton', false);
function setupModal(showButtonId, modalBackgroundId, closeModalButtonId, confirmButtonId, isWithdrawalModal) {
    const showModalButtons = document.getElementsByClassName(showButtonId);
    const modalBackground = document.getElementById(modalBackgroundId);
    const closeModalButton = document.getElementById(closeModalButtonId);
    
    for (let i = 0; i < showModalButtons.length; i++) {
        const showModalButton = showModalButtons[i];
        
        var email =""; // 탈퇴/복구할 이메일 임시 저장용 변수
        showModalButton.addEventListener('click', function() {
            modalBackground.style.display = 'flex';
            if (isWithdrawalModal) {
                email = $(this).closest("tr").find(".m_title").eq(0).text(); // 회원 이메일 가져오기
                $("#withdrawModal .modal-body p").text(`회원탈퇴 하시겠습니까?<br> 이메일 : `+email);
            } else {
                email = $(this).closest("tr").find(".m_title").eq(0).text(); // 회원 이메일 가져오기
                $("#restoreModal .modal-body p").text(`회원복구 하시겠습니까?<br> 이메일 :`+email);
            }
        });
    }

    modalBackground.addEventListener('click', (event) => {
        if (event.target === modalBackground) {
            modalBackground.style.display = 'none';
        }
    });

    closeModalButton.addEventListener('click', () => {
        modalBackground.style.display = 'none';
    });

    const confirmButton = document.getElementById(confirmButtonId);
    
    if (confirmButton) {
        confirmButton.addEventListener('click', () => {
            // 탈퇴 처리 또는 복구 처리
            console.log("보내는 이메일 : " + email)
            const url = isWithdrawalModal ? '${path}/mypage/withdrawalEmail' : '${path}/mypage/restoreEmail';
            
            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    "email": email,
                },
                success: function () {
                    if (isWithdrawalModal) {
                        alert("탈퇴처리가 완료 되었습니다.");
                    } else {
                        alert("복구 처리가 완료 되었습니다.");
                    }
                    location.href = '${path}/admin/memberManagement';
                },
                error: function (request, status, error) {
                    console.log(error);
                }
            });
        });
    }
}

//이메일이 복호화되어있는 상태에서는 회원 탈퇴/복구 버튼 감추기 by url주소
document.addEventListener("DOMContentLoaded", function() {
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("emailEncryption") !== -1) {
        var restoreButtons = document.getElementsByClassName("restoreModalButton");
        for (var i = 0; i < restoreButtons.length; i++) {
            restoreButtons[i].style.display = "none";
        }
        var withdrawButtons = document.getElementsByClassName("withdrawModalButton");
        for (var i = 0; i < withdrawButtons.length; i++) {
            withdrawButtons[i].style.display = "none";
        }
        var emailEncryption = document.getElementById("emailEncryption");
        emailEncryption.style.display = "none";
    }

    if (currentUrl.indexOf("memberManagement") !== -1) {
        var memberManagement = document.getElementById("memberManagement");
        memberManagement.style.display = "none";
    }
});

// console.log('${memberList}');
</script>
</body>
</html>
