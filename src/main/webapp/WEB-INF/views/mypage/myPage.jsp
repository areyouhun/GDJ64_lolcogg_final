<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" href="${path}/resources/css/member/member.css">
<!------------------------------------>
<title>내 정보</title>
</head>
<body>
<!-- 프로필 이미지 변경 모달 -->
<div class="modal-background" id="profileModalBackground">
    <div class="modal" id="myModal">
        <div class="modal-header">
			<h5 class="ff-macho ff-20">프로필 이미지</h5>
        </div>
        <div class="modal-body">
			<div class="line2">
        		<div class="previewBox3">
		        	<p class="color-white ff-macho fs-10">현재 이미지</p>
					<c:if test="${loginMember.profile != null && not empty loginMember.password && loginMember.password.contains('로그인')}"><!-- 소셜 로그인 -->
						<img src="${loginMember.profile}"
						width="70px" height="70px" style="border-radius: 35px; ">
					</c:if>
					<c:if test="${loginMember.profile != null && not empty loginMember.password && !loginMember.password.contains('로그인')}"><!-- 일반 로그인 -->
						<img src="${path}/resources/upload/profile/${loginMember.profile}"
						width="70px" height="70px" style="border-radius: 35px;  ">
					</c:if>
					<c:if test="${loginMember.profile==null}"> <!-- 프로필 미등록 -->
						<img src="${path}/resources/images/common/favicon-original.png"
						width="70px" height="70px" style="border-radius: 35px;  ">
					</c:if>
		            <div class="line">
		                <input type="file" name="file" id="file" accept="image/*"  style="display:none" > 
		                <input type="text" name="file" id="file2" class ="ff-suit fileValue" style="display:none" >
		            </div>
	            </div>
                <div class="previewBox3">
                    <p class="color-white ff-macho fs-10">미리보기</p>
                    <img src="${path }/resources/images/common/icon_profile.png" alt="미리보기" width="70px" height="70px" style="border-radius: 35px; " id="preview-image">
                </div>
                <div class="previewBox4">
                    <p class="color-white ff-macho fs-10">추천 이미지</p>
				    <img src="${path}/resources/images/member/smile.png" alt="" width="50px" height="50px" style="border-radius: 25px;" class="recommend-image" onclick="setPreviewImage('${path}/resources/images/member/smile.png')">
				    <img src="${path}/resources/images/member/run.png" alt="" width="50px" height="50px" style="border-radius: 25px;" class="recommend-image" onclick="setPreviewImage('${path}/resources/images/member/run.png')">
				    <img src="${path}/resources/images/member/sad.png" alt="" width="50px" height="50px" style="border-radius: 25px;" class="recommend-image" onclick="setPreviewImage('${path}/resources/images/member/sad.png')">
                </div>
            </div>
        </div>
        <div class="modal-footer">
			<div class="duplicationCheck ff-suit fs-15" onclick="onClickUpload();">이미지 가져오기</div>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="profileModalConfirmButton">이미지 선택</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="closeModalButton1">닫기</button>
        </div>
    </div>
</div>
<!-- 칭호변경 모달 -->
<div class="modal-background" id="titleModalBackground">
    <div class="modal" id="withdrawModal">
        <div class="modal-header">
            <h5 class="ff-macho ff-20">칭호 변경</h5>
        </div>
        <div class="modal-body">
            <table class="qnaTable">
	            <tr>
	                <th class="color-white content fs-20">번호</th>
	                <th class="color-white content fs-20">이름</th>
	            </tr>
	        	<c:if test="${ not empty memberTitle }">
				    <c:forEach var="mt" items="${memberTitle}" varStatus="loop">
				        <c:if test="${loginMember.titleName == mt.titleNo.titleName}">
				            <tr id="row-${loop.index}" class="currentTitle-row">
				                <td class="color-white content fs-20">${mt.titleNo.titleNo}</td>
				                <td class="color-white content fs-20">${mt.titleNo.titleName}</td>
				            </tr>
				        </c:if>
				        <c:if test="${loginMember.titleName != mt.titleNo.titleName}">
				            <tr id="row-${loop.index}" class="notCurrentTitle-row"  onclick="rowClicked(this)">
				                <td class="color-white content fs-15">${mt.titleNo.titleNo}</td>
				                <td class="color-white content fs-15">${mt.titleNo.titleName}</td>
				            </tr>
				        </c:if>
				    </c:forEach>
				    <c:if test="${loginMember.titleName == null}"> <!-- 선택한 칭호가 없는 경우 : 색상 효과 -->
			            <tr class="currentTitle-row">
			            	<td class="color-white content fs-15 fw-bold" colspan="2">[칭호 미선택]</td>
			                <td class="color-white content fs-15"></td>
			            </tr>
			        </c:if>
				    <c:if test="${loginMember.titleName != null}"><!-- 선택한 칭호가 있는 경우 : 기본 -->
			            <tr onclick="rowClicked(this)" > <!-- onclick이벤트(색상 생성) 있음 -->
			                <td class="color-white content fs-15 fw-bold" colspan="2">[선택 칭호 해제]</td>
			                <td class="color-white content fs-15"></td>
			            </tr>
			        </c:if>
				</c:if>
	        	<c:if test="${ empty memberTitle }">
					<tr>
				        <td class="color-white content fs-20" colspan="2" style="height:100px">보유한 칭호가 없습니다.</td>
				    <tr>
            	</c:if>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="closeModalButton2">닫기</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="titleConfirmButton">변경하기</button>
        </div>
    </div>
</div>
<!-- 비밀번호 변경 모달 -->
<div class="modal-background" id="passwordModalBackground">
    <div class="modal" id="passwordModal">
        <div class="modal-header">
            <h5 class="ff-macho ff-20">비밀번호 변경</h5>
        </div>
        <div class="modal-body">
        	<br>
            <label for="currentPassword">현재 비밀번호</label>
            <input type="password" id="currentPassword" name="currentPassword" placeholder="비밀번호 입력" required><br>
            <h5 class="ff-suit ff-20" style="color : red ; display:none" id="passwordCheck"></h5>
            <label for="newPassword" style = "display : none;">새 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="영문, 숫자, 특수문자 포함 8자" style = "display : none;" required ><br>
            <label for="confirmNewPassword" style = "display : none;">비밀번호 확인&nbsp;</label>
            <input type="password" id="confirmNewPassword" name="confirmNewPassword" placeholder="영문, 숫자, 특수문자 포함 8자" style = "display : none;" required >
            <h5 class="ff-suit ff-20" style="color : red ;  display:none;" id="passwordCheck2"></h5>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="closeModalButton3">닫기</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="passwordModalConfirmButton">확인하기</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="passwordModalConfirmButton2" style = "display : none;">변경하기</button>
        </div>
    </div>
</div>
<!-- 회원탈퇴 모달 -->
<div class="modal-background" id="withdrawModalBackground">
    <div class="modal" id="withdrawModal">
        <div class="modal-header">
            <h5 class="ff-macho ff-20">회원탈퇴</h5>
        </div>
        <div class="modal-body">
            <p>정말로 회원탈퇴 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="closeModalButton4">취소</button>
            <button type="button" class="btn duplicationCheck ff-suit fs-15" id="withdrawModalConfirmButton">탈퇴하기</button>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin ">
                <div class="myInfo">
                    <div class="">
                        <p class="subTitle fs-20">profile</p>
                        <p class="color-white ff-macho fs-35">내 정보</p>
                    </div>
                    <div class="profileMain">
                        <div class="">
                        	<c:if test="${loginMember.profile != null && not empty loginMember.password && loginMember.password.contains('로그인')}"><!-- 소셜 로그인 -->
								<img src="${loginMember.profile}"
			                    	width="130px" height="130px" style="border-radius: 65px;">
							</c:if>
							<c:if test="${loginMember.profile != null && not empty loginMember.password && !loginMember.password.contains('로그인')}"><!-- 일반 로그인 -->
								<img src="${path}/resources/upload/profile/${loginMember.profile}"
			                    	width="130px" height="130px" style="border-radius: 65px;">
							</c:if>
							<c:if test="${loginMember.profile==null}"> <!-- 프로필 미등록 -->
								<img src="${path}/resources/images/common/favicon-original.png"
			                    	width="130px" height="130px" style="border-radius: 65px;">
							</c:if>
                            <p class="color-white ff-macho fs-15">나의 추천인 코드</p>
                            <p class="color-white ff-suit fs-15">[${loginMember.myReferralCode }]</p>
                        </div>
                        <div class="">
                        	<c:if test="${loginMember.teamAbbr!=null  }">
                            <div class="abbrImgBox">
                                <img src="${path}/resources/images/member/enroll_logo/" alt="" width="40px" height="40px"><!-- JS value -->
                                <p class="color-white ff-suit">${loginMember.teamAbbr }을 응원합니다!</p>
                            </div>
                        	</c:if>
                        	<c:if test="${loginMember.teamAbbr==null  }">
                                <p class="color-white ff-suit fw-bold"> &nbsp;'LCK 응원팀'을 선택해보세요!</p>
                        	</c:if>
                            <div>
	                            <p class="color-white ff-suit fs-15">${loginMember.titleName==null? '':loginMember.titleName}</p>
	                            <p class="color-white ff-macho fs-20">${loginMember.nickname }</p>
	                            <a href="${path}/store/detail?name=닉네임%20변경권" class="color-white ff-suit fs-10">닉네임 변경권 구매하기</a>
                            </div>
                            <div class="">
                                <img src="${path}/resources/images/store/pointImg.png" alt="" width="30px" height="30px">
                                <p class="color-white ff-macho fs-15 fw-bold">${loginMember.totalPoints }</p>
                            </div>
                        </div>
                        <div class="tierBox">
                            <div class="tierImageBox">
                                <div class="">
                                    <p class="color-white ff-macho fs-15">현재 티어</p>
                                    <img src="${path}/resources/images/tier/${loginMember.tier.tierRulesNo.tierRulesImage}" alt="" width="100px" height="50px">
                                </div>
                                <div class="">
                                    <p class="color-white ff-macho fs-15">다음 티어</p>
                                    <img src="${path}/resources/images/tier/" alt="" width="100px" height="50px"><!-- JS value -->
                                </div>
                            </div>    
                            <div class="tierGazeBox">
								<p class="color-white ff-suit fs-15" ></p><!-- JS value-->
                                <div class="tierGazeWhole"></div>
                                <div class="tuerGazeStatus"></div>
                                <div class="tierGazeState">
                                    <p class="color-white ff-suit fs-10">[${loginMember.tier.tierRulesNo.tierRulesExpState}](${loginMember.tier.tierRulesNo.tierRulesName})</p>
                                    <p class="color-white ff-suit fs-10">[${loginMember.tier.tierRulesNo.tierRulesExpEnd+1}]</p>
                                </div>
                                <div class="buttonBox2">
                                    <button class="mypageButton ff-suit fs-15" id="showModalButton">프로필이미지 변경</button>
                                    <button class="mypageButton ff-suit fs-15" id="titleModalButton">칭호 변경</button>
                                    <button class="mypageButton ff-suit fs-15" id="passwordModalButton">비밀번호 변경</button>
                                    <button class="mypageButton ff-suit fs-15" id="withdrawModalButton">회원탈퇴</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="abbrTeam">
                        <hr>
                        <p class="color-white ff-macho fw-bold fs-20">LCK 응원팀</p>
                        <div class="abbrCheckBox2">
                            <div class="abbrCheckBoxRow2">
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/dplus_logo_white.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="DK" checked>
                                        <span class="color-white ff-suit abbrName">DK</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/brion_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="BRO" >
                                        <span class="color-white ff-suit abbrName">BRO</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/redforce_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="NS" >
                                        <span class="color-white ff-suit abbrName">NS</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/geng_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="GEN" >
                                        <span class="color-white ff-suit abbrName">GEN</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/t1_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="T1" >
                                        <span class="color-white ff-suit abbrName">T1</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/hanwha_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="HLE" >
                                        <span class="color-white ff-suit abbrName">HLE</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/freecs_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="KDF" >
                                        <span class="color-white ff-suit abbrName">KDF</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/drx_logo_small.png" alt="" width="33px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="DRX" >
                                        <span class="color-white ff-suit abbrName">DRX</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/kt_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="KT" >
                                        <span class="color-white ff-suit abbrName">KT</span>
                                    </label>
                                </div>
                                <div class="abbrCheckBox2">
                                    <img src="${path}/resources/images/member/enroll_logo/sandbox_logo_small.png" alt="" width="35px" height="35px">
                                    <label class="line">
                                        <input type="radio" name="abbr" value="LSB" >
                                        <span class="color-white ff-suit abbrName">LSB</span>
                                    </label>
                                </div>
                            </div>
                            <div class="buttonBox3">
                                <button class="mypageButton ff-suit fs-15 changeAbbrTeam">응원팀 선택</button>
                            </div>   
                        </div>
                        <hr>
                    </div>
                    <div class="historyBox">
                            <p class="color-white fw-bold ff-macho fs-20 "> 내 활동</p>
                        <div class="buttonList">
                            <p class="color-white fw-bold ff-suit mypageButton fs-20 pointButton">포인트 획득/지출</p>
                            <p class="color-white fw-bold ff-suit mypageButton fs-20 communityButton"> 커뮤니티</p>
                            <p class="color-white fw-bold ff-suit mypageButton fs-20 QnAButton"> QnA</p>
                        </div>
                        <div class="myPointHistory">
                            <table class="qnaTable">
                                <tr>
                                    <th class="color-white content fs-20">번호</th>
                                    <th class="color-white content fs-20">종류</th>
                                    <th class="color-white content fs-20">획득/이용처</th>
                                    <th class="color-white content fs-20">내역</th>
                                    <th class="color-white content fs-20">포인트</th>
                                    <th class="color-white content fs-20">일자</th>
                                </tr>
                                <c:if test="${not empty loginMember.pointHistorys }">
                                	<c:set var="hasMatch" value="false" />
                                    <c:forEach var="point" items="${loginMember.pointHistorys }">
		                                <c:if test="${point.pointHistroyNo != 0}">
		                                	<c:set var="hasMatch" value="true" />
	                                        <tr>
	                                            <td class="color-white content fs-20">${point.pointHistroyNo }</td>
	                                            <td class="color-white content fs-20">${point.phCategory.pcType }</td>
	                                            <td class="color-white content fs-20">${point.phCategory.pcName }</td>
	                                            <td class="color-white content fs-20">${point.phComment }</td>
	                                            <c:choose>
									                <c:when test="${point.phCategory.pcType == '지출'}">
			                                            <td class="color-white content fs-20" style="color: skyblue;">-${point.phPoint }</td>
									                </c:when>
									                <c:when test="${point.phCategory.pcType == '소득'}">
			                                            <td class="color-white content fs-20" style="color: lightpink;">+${point.phPoint }</td>
									                </c:when>
									                <c:otherwise><td class="color-white content fs-20" >${point.phPoint }</td></c:otherwise>
									            </c:choose>
	                                            <td class="color-white content fs-20">${point.phDate }</td>
	                                        </tr>
		                                </c:if>
                                    </c:forEach>
                                    <!-- 조회된 나의 포인트 획득/지출 내역이 없는 경우 -->
                                    <c:if test="${not hasMatch}">
									    <tr>
									        <td class="color-white content fs-20" colspan="6" style="height:200px">조회된 나의 포인트 내역이 없습니다.</td>
									    <tr>
								    </c:if>
                                </c:if>
                                <c:if test="${empty loginMember.pointHistorys }">
                                    <tr>
                                        <td class="color-white content fs-20" colspan="6" style="height:200px">조회된 포인트 내역이 없습니다.</td>
                                    <tr>
                                </c:if>
                            </table>
                        </div>
                        <div class="myCommunityHistory">
                            <table class="qnaTable">
                                <tr>
                                    <th class="color-white content fs-20">제목</th>
                                    <th class="color-white content fs-20">작성자</th>
                                    <th class="color-white content fs-20">경과시간</th>
                                    <th class="color-white content fs-20">조회수</th>
                                    <th class="color-white content fs-15">[버프ㅣ너프]</th>
                                </tr>
                                <c:if test="${not empty selectboardList }">
                                	<c:set var="hasMatch" value="false" />
                                    <c:forEach var="b" items="${selectboardList }">
		                                <c:if test="${b.cmBoardWriter.nickname == loginMember.nickname}">
	                                        <c:set var="hasMatch" value="true" />
	                                        <tr>
	                                            <td class="color-white content fs-15 tableTitle">
													<a
														href="${path }/community/boardDetails?cmBoardNo=${b.cmBoardNo}">
														<div class="board-title-div">
															<input type="hidden" value="cmBoardNo"> 
															<span class="board-title">${b.cmBoardTitle }</span>
															<c:if test="${b.cmBoardContent.contains('<img')}">
																<span><img class="attachmenOn" src="${path }/resources/images/community/사진.png" alt="" height="20px"></span>
															</c:if>
															<c:if test="${b.cmVideoAddress.contains('https://www.youtube.com/')}">
																<img class="attachmenOn" src="${path }/resources/images/community/영상.png" alt="" height="20px">
															</c:if>
															<c:if test="${b.c!=0 }">
																<span class="comment fs-15">[${b.c }]</span>
															</c:if>
														</div>
													</a>
	                                            </td>
	                                            <td class="color-white content fs-15">${b.cmBoardWriter.nickname }</td>
	                                            <td class="color-white content fs-15">${b.timeDifference}</td>
	                                            <td class="color-white content fs-15">${b.cmBoardReadCount }</td>
	                                            <td class="color-white content fs-15">${b.b } ㅣ ${b.n }</td>
	                                        </tr>
                                    	</c:if>    
                                    </c:forEach>
                                    <!-- 조회된 나의 커뮤니티 활동이 없는 경우 -->
                                    <c:if test="${not hasMatch}">
									    <tr>
									        <td class="color-white content fs-20" colspan="5" style="height:200px">조회된 나의 커뮤니티글 내역이 없습니다.</td>
									    <tr>
								    </c:if>
                                </c:if>
                                <c:if test="${empty selectboardList }">
                                    <tr>
                                        <td class="color-white content fs-20" colspan="5" style="height:200px">조회된  커뮤니티 글이 없습니다.</td>
                                    <tr>
                                </c:if>
                            </table>  
                        </div>
                        <div class="myQuaHistory">
                            <table class="qnaTable">
                                <tr>
                                    <th class="color-white content fs-20">번호</th>
                                    <th class="color-white content fs-20">제목</th>
                                    <th class="color-white content fs-20">작성자</th>
                                    <th class="color-white content fs-20">등록일</th>
                                    <th class="color-white content fs-20">상태</th>
                                </tr>
								<c:if test="${not empty qb }">
								    <c:set var="hasMatch" value="false" />
								    <c:forEach var="qna" items="${qb }">
								        <c:if test="${qna.qaWriter.nickname == loginMember.nickname}">
								            <c:set var="hasMatch" value="true" />
								            <tr>
								                <td class="color-white content fs-15">${qna.qaNo }</td>
								                <td class="color-white content fs-15 tableTitle">
								                    <a href="${path }/qna/qnaView?no=${qna.qaNo}">${qna.qaTitle }</a>
								                    <img src="${path }/resources/images/qna/lock.png" style="width: 15px; height: 15px;">
								                </td>
								                <td class="color-white content fs-15">${qna.qaWriter==null ? "탈퇴한 회원" : qna.qaWriter.nickname }</td>
								                <td class="color-white content fs-15">${qna.qaDate }</td>
								                <td class="color-white content fs-15">
								                    <c:set var="doneLoop" value="false" />
								                    <c:forEach var="c" items="${qna.qaComment}" varStatus="status">
								                        <c:if test="${not doneLoop}"> 
								                            <c:if test="${c.qaCommentNo != 0 }"> 
								                                <c:set var="doneLoop" value="true"/> 
								                                <button class="qnaBtn comBtn" disabled>답변완료</button>
								                            </c:if> 
								                        </c:if> 
								                        <c:if test="${c.qaCommentNo == 0 }">
								                            <button class="qnaBtn" disabled>답변대기</button>
								                        </c:if>
								                    </c:forEach>
								                </td>
								            </tr>
								        </c:if>
								    </c:forEach>
                                    <!-- 조회된 나의 QnA 활동이 없는 경우 -->
								    <c:if test="${not hasMatch}">
									    <tr>
									        <td class="color-white content fs-20" colspan="5" style="height:200px">조회된 나의 QnA 내역이 없습니다.</td>
									    <tr>
								    </c:if>
								</c:if>
								<c:if test="${empty qb }">
								    <tr>
								        <td class="color-white content fs-20" colspan="5" style="height:200px">조회된 QnA 내역이 없습니다.</td>
								    <tr>
								</c:if>
                            </table>  
                        </div>
                    </div>                            
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
/* ----- start ----- */	
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
    const abbrImgFile = abbrImgMap.get('${loginMember.teamAbbr}');
    $(".abbrImgBox > img").attr("src", $(".abbrImgBox > img").attr("src") + abbrImgFile);

    /* 다음 티어 이미지 파일 추출 */
    const nextTierImgMap = new Map([
  	  ["브론즈", "lol_silver.png"],
  	  ["실버", "lol_gold.png"],
  	  ["골드", "lol_platinum.png"],
  	  ["플래티넘", "lol_diamond.png"],
  	  ["다이아", "lol_diamond.png"]
  	]);
    const nextTierImgFile = nextTierImgMap.get('${loginMember.tier.tierRulesNo.tierRulesName}');
    $(".tierImageBox > :nth-child(2) > img").attr("src", $(".tierImageBox > :nth-child(2) > img").attr("src") + nextTierImgFile);
    
    /* 경험치게이지바 만들기 */
    const startExp = ${loginMember.tier.tierRulesNo.tierRulesExpState};
    const currentExp = ${loginMember.totalExp };
    const endExp = ${loginMember.tier.tierRulesNo.tierRulesExpEnd};

    const expRange = endExp - startExp;
    const currentExpInRange = currentExp - startExp;

    const expRatio = currentExpInRange / expRange;
    const gaugeMaxWidth = 100; // 게이지의 최대 너비 설정 (예: 100%)
    const newWidth = Math.floor(expRatio * gaugeMaxWidth); // 소수점 제거
    $(".tierBox > .tierGazeBox > .tuerGazeStatus").width(newWidth + "%");
    
    $(".tierGazeBox > :nth-child(1)").text("현재 경험치 : "+'${loginMember.totalExp }'+"("+newWidth+"%)");
    
    
    /* 응원팀 변경(ajax) */
	$(document).on('click', '.changeAbbrTeam', function() {
		$.ajax({
			type : 'POST',
			url : '${path}/mypage/updateAbbrTeam',
			data : {
				"email" : '${loginMember.email}',
				"choiceAbbrTeam" :$("input[name='abbr']:checked").val()
			},
			success : function(){
				location.href='${path}/mypage/mypage.do';
			},
			error : function(request, status, error) { 
		        console.log(error)
		    }
		})
	});
    
    if('${loginMember.teamAbbr}'!=null){
   		$("input[name='abbr'][value='${loginMember.teamAbbr}']").prop("checked", true);
    }
 
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
    
	/* 세트 : 프로필 이미지 변경, 비밀번호 변경, 회원 탈퇴 기능(ajax) */
// 칭호 변경
// 선택한 타이틀명을 담을 변수 
var inputTitle = null;
// 이전에 선택한 로우의 클래스 이름을 저장할 변수
var prevSelectedRow = null;
// 로우 클릭 이벤트 핸들러
function rowClicked(row) {
    if (prevSelectedRow !== null) {
        prevSelectedRow.classList.remove('choiceTitle-row');
    }
    row.classList.add('choiceTitle-row');
    prevSelectedRow = row;
    
    inputTitle = row.querySelector('td:nth-child(2)').textContent; // td의 2번째 자식 값이 보내진다
//     console.log(inputTitle); 
}

	/* 세트 : 프로필 이미지 변경, 비밀번호 변경, 회원 탈퇴 기능(ajax) */
	//프로필 이미지 변경
	setupModal('showModalButton', 'profileModalBackground', 'closeModalButton1', 'profileModalConfirmButton');
	//칭호 변경
	setupModal('titleModalButton', 'titleModalBackground', 'closeModalButton2', 'titleConfirmButton');
	// 비밀번호 변경
	setupModal('passwordModalButton', 'passwordModalBackground', 'closeModalButton3', 'passwordModalConfirmButton');
	// 회원 탈퇴
	setupModal('withdrawModalButton', 'withdrawModalBackground', 'closeModalButton4', 'withdrawModalConfirmButton');
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
	    
	    //프로필 이미지 변경
	    if (confirmButton==document.getElementById('profileModalConfirmButton')) {
	        confirmButton.addEventListener('click', () => {
	            var formData = new FormData();
	            var file = $("input[id='file']")[0].files[0]; // 외부 이미지
	            var priviewImg = $("input[id='file2']").val(); // 추천 이미지
	            if (file || priviewImg) {
	                // 파일 또는 미리보기 이미지 중 하나가 존재하는 경우에 코드 실행, 둘 다 존재하는 경우는 없음
	                formData.append("email", '${loginMember.email}');
	                formData.append("file", file);
	                formData.append("profileImg", priviewImg);
	                $.ajax({
	                    type: 'POST',
	                    url: '${path}/mypage/updateProfileImg',
	                    processData: false,
	                    contentType: false,
	                    data: formData,
	                    success: function () {
	                    	location.href='${path}/mypage/mypage.do';
	                    },
	                    error: function (request, status, error) {
	                        console.log(error);
	                    }
	                });
	            } else {
	                // 파일과 미리보기 이미지 모두 없는 경우에 대한 처리
	                alert("변경할 이미지를 선택해주세요");
	            }
	        });
	    }
	    
	    // 칭호 변경
	    if (confirmButton==document.getElementById('titleConfirmButton')) {
	        confirmButton.addEventListener('click', () => {
	        	if(inputTitle==null){
	        		alert("변경할 칭호를 선택해주세요.");
	        	}else if(inputTitle!=null){
		    		$.ajax({
		    			type : 'POST',
		    			url : '${path}/mypage/updateTitle',
		    			data : {
		    				"email" : '${loginMember.email}',
		    				"inputTitle" : inputTitle
		    			},
		    			success : function(){
		    				location.href='${path}/mypage/mypage.do';
		    			},
		    			error : function(request, status, error) { 
		    		        console.log(error)
		    		    }
		    		})
		    	}
	        });
	    }
	    
	    //비밀번호 변경 step1
	  	var currentPassword=$("#currentPassword");
	    if (confirmButton==document.getElementById('passwordModalConfirmButton')) {
			/* alert 버블링 현상 있습니다. */
			/* 비밀번호 예외처리 - 빈값 */
	    	confirmButton.addEventListener('click', () => {
	    		if(currentPassword.val()==""){
	    			currentPassword.focus();	
	    			document.querySelector("#passwordCheck").style.display = "inline-block";
	    			document.querySelector("#passwordCheck").innerText = "비밀번호를 입력해주세요.";
	    			return false;
	    		}
				$.ajax({
					type : 'POST',
					url : '${path}/mypage/PasswordCheck',
					data : {
						"email" : '${loginMember.email}',
						"inputPassword" :$("input[name='currentPassword']").val()
					},
					success : function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		        			currentPassword.focus();
		        			document.querySelector("#passwordCheck").innerText = "비밀번호가 일치하지 않습니다";
		        			document.querySelector("#passwordCheck").style.display = "inline-block";
		                } else if(cnt == 1){ // cnt가 1일 경우 -> 이미 존재하는 아이디, 비밀번호 일치
		                	document.querySelectorAll(" label[for='newPassword'], input[type='password'][name='newPassword'], label[for='confirmNewPassword'], input[type='password'][name='confirmNewPassword'], button[id='passwordModalConfirmButton2']")
		                		.forEach(function(element) {
		                	    element.style.display = "inline-block";
		                	});
		                	document.querySelectorAll("label[for='currentPassword'], input[type='password'][name='currentPassword'], button[id='passwordModalConfirmButton'], h5[id='passwordCheck']")
		                		.forEach(function(element) {
		                	    element.style.display = "none"; 
		                	});
		                }
		             },
					error : function(request, status, error) { 
				        console.log(error)
				    }
				})
			});
	    }
		//비밀번호 변경 step2
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
				document.querySelector("#passwordCheck2").innerText = "비밀번호 일치하지 않습니다.";
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
			if(newPassword.val()==currentPassword.val()) {
				newPassword.focus();	
				document.querySelector("#passwordCheck2").style.display = "inline-block";
				document.querySelector("#passwordCheck2").innerText = "기존 비밀번호와 동일합니다.";
				return false;
			}
			$.ajax({
				type : 'POST',
				url : '${path}/mypage/updatePassword',
				data : {
					"email" : '${loginMember.email}',
					"updatePassword" :$("input[name='newPassword']").val()
				},
				success : function(){
					location.href='${path}/mypage/mypage.do';
				},
				error : function(request, status, error) { 
			        console.log(error)
			    }
			})
		});
	    
		//회원탈퇴
	    if (confirmButton==document.getElementById('withdrawModalConfirmButton')) {
	        confirmButton.addEventListener('click', () => {
	    		$.ajax({
	    			type : 'POST',
	    			url : '${path}/mypage/withdrawalEmail',
	    			data : {
	    				"email" : '${loginMember.email}',
	    			},
	    			success : function(){
	    				alert("탈퇴처리가 완료 되었습니다.");
	    				location.href='${path}/';
	    			},
	    			error : function(request, status, error) { 
	    		        console.log(error)
	    		    }
	    		})
	        });
	    }
	}					

	/* 세트 : 내 활동*/
	function showSection(sectionSelector) {
	    $(".myCommunityHistory, .myQuaHistory, .myPointHistory").css("display", "none");
	    $(sectionSelector).css("display", "block");
	}
	function buttonChange(sectionSelector) {
	    $(".communityButton, .QnAButton, .pointButton").css({
	        "color": "white",
	        "background-color": "black",
	        "transition": "background-color 0.2s, color 0.2s"
	    }).hover(function() {
	        if (!$(this).hasClass("selected")) {
	            $(this).css({
	                "background-color": "white",
	                "color": "black"
	            });
	        }
	    }, function() {
	        if (!$(this).hasClass("selected")) {
	            $(this).css({
	                "background-color": "black",
	                "color": "white"
	            });
	        }
	    });
	    $(".communityButton, .QnAButton, .pointButton").removeClass("selected");
	    $(sectionSelector).css({
	        "color": "black",
	        "background-color": "white",
	        "transition": "background-color 0.3s, color 0.3s"
	    }).addClass("selected");
	}

	$(".communityButton").click(() => {
	    showSection(".myCommunityHistory");
	    buttonChange(".communityButton");
	    $.ajax({
			type : 'POST',
			url : '${path}/mypage/selectboardList',
			data : {
			},
			success : function(){
			},
			error : function(request, status, error) { 
		        console.log(error)
		    }
		})
	});
	$(".QnAButton").click(() => {
	    showSection(".myQuaHistory");
	    buttonChange(".QnAButton");
	    $.ajax({
			type : 'POST',
			url : '${path}/mypage/qnaList',
			data : {
			},
			success : function(){
			},
			error : function(request, status, error) { 
		        console.log(error)
		    }
		})
	});
	$(".pointButton").click(() => {
	    showSection(".myPointHistory");
	    buttonChange(".pointButton");
	    $.ajax({
			type : 'POST',
			url : '${path}/mypage/pointList',
			data : {
// 				"email" : '${loginMember.email}',
			},
			success : function(){
			},
			error : function(request, status, error) { 
		        console.log(error)
		    }
		})
	});
</script>
<!-------------------------------------------->
</body>
</html>
