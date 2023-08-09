<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="b" items="${selectBoardComment }">
		<c:if test="${c.cmCommentNo==b.cmCommentRefNo }">
			<div class="commentList">
				<div style="width: 80px;"></div>
				<div class="">
					<img
						src="${path }/resources/images/upload/member/${c.cmCommentWriter.profile}.png"
						style="width: 50px; height: 50px; border-radius: 70px;">
				</div>
				<div class="detaildetailDiv">
					<div class="commentDetail">
						<div class="commentInfo">
							<p class="contentBlack fs-20 nickname">${b.cmCommentWriter.nickname }</p>
							<img
								src="${path }/resources/images/tier/${b.cmCommentWriter.tier.tierRulesNo.tierRulesImage }"
								class="tierImg">
						</div>
						<div class="optionDiv">
							<button class="moreIconBtn">
								<ion-icon class="moreIcon" name="ellipsis-horizontal"
									style="font-size: 28px;"></ion-icon>
							</button>
							<ul class="optionUl">
								<li>
									<!-- 작성자 및 관리자 --> <c:if
										test="${ loginMember.nickname.equals(b.cmCommentWriter.nickname)}">
										<button class="refUpdateBtn">
											<ion-icon class="optionIcon" name="create-outline"></ion-icon>
											수정
										</button>
										<hr class="hr-1Black hr-op">
										<button class="removeBtn">
											<ion-icon class="optionIcon" name="trash-bin-outline"></ion-icon>
											삭제
										</button>
									</c:if> <c:if
										test="${ !loginMember.nickname.equals(b.cmCommentWriter.nickname)}">
										<!-- 작성자 x -->
										<button>
											<ion-icon class="optionIcon" name="remove-circle-outline"></ion-icon>
											신고
										</button>
									</c:if>
								</li>
							</ul>
						</div>
					</div>
					<p class="contentBlack fs-20 commentContent"
						style="display: inline-flex;">${b.cmCommentContent }</p>
					<div class="dateBuffDiv">
						<span class="dateSpan">${b.timeDifference}</span>
					</div>
				</div>
			</div>
			<!--대댓글수정  -->
			<div class="insertCommentDiv updateComment">
				<input type="hidden" value="${b.cmCommentNo }" class="commentNo">

				<div class="updateContent contentBlack fs-20 replyContent"
					contenteditable="true" oninput="updateCount1(this)">${ b.cmCommentContent}</div>

				<div class="countBtnDiv">
					<div class="countBtn">
						<span class="contentBlack fs-20" id="charCount1">0/150</span>
					</div>
					<div class="replyIconBtn">
						<ul class="replyOpenIcon">
							<li><img
								src="${path}/resources/images/emoticon/Poro_sticker_angry.png"
								style="width: 50px; height: 40px; border-radius: 70px;"
								onclick="insertImage1('${path}/resources/images/emoticon/Poro_sticker_angry.png')">
							</li>
						</ul>
						<ion-icon name="happy-outline" class="replyIconOpenBtn"></ion-icon>
						<button class="content updateBtn" onclick="">등록</button>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>



</body>
</html>