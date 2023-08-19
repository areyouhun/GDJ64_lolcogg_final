<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" scope="session" value="${loginMember}" />
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/quiz/style_basic_quiz.css" />
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<!------------------------------------>
<title>롤잘알 테스트</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
		<!-- 배경 이미지 -->
		<img id="backgroundImg" src="${path}/resources/images/quiz/backgorund-img.jpg" />

        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">	
                <div class="quiz">
                    <div id="quizTitle">
                        <p class="mainTitle fs-35">실력 좀 볼까?</p>
                    </div>

                    <div class="quizBg info">
                        <div class="quizInfoAll centerAll">
                            <div class="quizInfo">
                                <p class="quizP content fs-30 fw-bold">주어진 문제를 보고 풀어보세요!</p>
                                <p class="quizP content fs-20">* 문제는 총 5문제로 구성되어 있습니다.</p>
                            </div>
                        </div>
                        <div class="startBtnDiv centerAll">
                            <button class="title startBtn">시작하기</button>
                        </div>
                    </div>
                    <div class="quizBg quizQue hidden">
                        <div class="question-title content fs-30 fw-bold">
                        </div>
                        <div class="answer-box">
                            <ul class="answer-list"></ul>
                        </div>
                        <div class='progress'>
                            <div class='progressBg'></div>
                            <div class='progressCount'></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script>
let count = 0;

// 문제 배열
const QUESTIONS = [
    {
        question: '다음 중 스카너가 갖고 있지 않은 스킨은?',
        options: ['전투 기계 알파 스카너', '우주 전갈 스카너', '사막의 재앙 스카너', '암흑의 별 스카너'],
        answer: '암흑의 별 스카너',
        img: 'Skarne.jpg'
    },
    {
        question: '다음 중 갱플랭크 Q 스킬 이름으로 올바른 것은?',
        options: ['혀어업상', '혀어어업상', '혀어어어업상', '혀어어어어업상'],
        answer: '혀어어어업상',
        img: 'Gangplank.jpg'
    },
    {
        question: '다음 중 세주아니가 타고다니는 멧돼지의 이름은?',
        options: ['품바', '그릴리시', '트라오레', '브리슬'],
        answer: '브리슬',
        img: 'Sejuani.jpg',
    },
    {
        question: '다음 중 말파이트가 갖고 있는 스킨으로 옳은 것은?',
        options: ['토끼풀 말파이트', '수정초 말파이트', '플루토늄 말파이트', '용암 말파이트'],
        answer: '토끼풀 말파이트',
        img: 'Malphite.jpg',
    },
    {
        question: '파자마 수호자 코스프레 우르곳의 가격은?',
        options: ['520RP', '975RP', '1350RP', '3150RP'],
        answer: '1350RP',
        img: 'Urgot.jpg',
    },
    {
        question: '다음 중 문도 박사 패시브 이름으로 옳은 것은?',
        options: ['가고 싶은 데로 간다', '가고 싶은 대로 간다', '간다. 가고 싶은 데로', '가고 싶으면 간다'],
        answer: '가고 싶은 데로 간다',
        img: 'Mundo.jpg',
    },
    {
        question: '다음 중 롤 챔피언으로 옳은 것은?',
        options: ['머키', '바드', '루시우', '제트'],
        answer: '바드',
        img: 'Gragas.jpg',
    },
    {
        question: '다음 이미지와 일치하는 아이템 이름은?',
        options: ['이상한 신발', '약간 신비한 신발', '약간 이상한 장화', '이상한 장화'],
        answer: '약간 신비한 신발',
        img: 'Item_1.png',
    },
    {
        question: '다음 이미지와 일치하는 아이템 이름은?',
        options: ['쇼트 소드', '피의 단검', '도란의 단검', '도란의 검'],
        answer: '도란의 검',
        img: 'Item_2.png',
    },
    {
        question: '다음 이미지와 일치하는 아이템 이름은?',
        options: ['메자이의 부름', '메자이의 영혼부름', '메자이의 영혼약탈자', '메자이의 약탈자'],
        answer: '메자이의 영혼약탈자',
        img: 'Item_3.png',
    },
    {
        question: '다음 이미지와 일치하는 아이템 이름은?',
        options: ['강철 머리 보호대', '강처 무릎 보호대', '강철 발목 보호대', '강철 어깨 보호대'],
        answer: '강철 어깨 보호대',
        img: 'Item_4.png',
    },
    {
        question: '다음 중 아이번의 풀네임으로 옳은 것은?',
        options: ['아이번 피터파커', '로버트 아이번', '알버스 아이번', '아이번 브램블풋'],
        answer: '아이번 브램블풋',
        img: 'Ivern.jpg',
    },
    {
        question: '다음 중 나르의 스킬 이름이 아닌 것은?',
        options: ['슝슝', '쿵쾅', '폴짝', '와장창'],
        answer: '와장창',
        img: 'Gnar.jpg',
    },
];

// 로그인 유무 체크
$('.startBtn').click((e) => {
    if('${loginMember}' === '') {
        alert('로그인 후 이용 가능한 서비스입니다.');
        location.assign('${path}/member/loginPage');
    }
    startQuiz();
});

// 퀴즈 시작
let randomQuestions = [];
let quizIndex = 0;

function startQuiz() {
    randomQuestions = shuffleArray(QUESTIONS);
    quizIndex = 0;
    $('.info').addClass('hidden');
    $('.quizQue').removeClass('hidden');
    loadQuiz(quizIndex);
}

/* 랜덤 */
function shuffleArray(array) {
    const shuffled = [...array];
    for (let i = shuffled.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    return shuffled;
}

/* 문제 불러오기 */
function loadQuiz(index) {
    const QUESTION = randomQuestions[index];
    const OPTIONS = shuffleArray(QUESTION.options);
    const QUESTION_IMG = QUESTION.img;
    const $DIV = $('<div>').addClass('question-img-box');

    $('.question-title').empty();
    $('.answer-list').empty();

    $('.question-title')
        .append($('<p>').text('Q.' + QUESTION.question))
        .append($DIV.append($('<img>').attr('src','${path}/resources/images/quiz/basic_quiz/' + QUESTION_IMG)
            .css({
                'width':QUESTION_IMG.includes('Item') ? '75px' : '400px',
                'height':QUESTION_IMG.includes('Item') ? '75px' : '200px',
                'border-radius':'15px',
            })
        ));

    for(let option of OPTIONS) {
        $('.answer-list').append($('<li>').addClass('answer content').text(option));
    }

    /* 정답 확인 */
    $('.answer').click((e) => {
        const CURRENT_ANSWER = $(e.currentTarget).text();
        if(CURRENT_ANSWER === QUESTION.answer) {
            count++;
        }
        nextQuestion();
    });
}

/* 다음 문제 */
let percentage = 0;

function nextQuestion() {
    quizIndex++;
    
    percentage = percentage + 20;
    $('.progressBg').css('width', percentage + '%');

    if(quizIndex < 5) {
        loadQuiz(quizIndex);
        return;
    }
    endQuiz();
}

function endQuiz() {
    $('.quizQue').empty();

    let resultDiv = $('<div>').addClass('resultDiv');
    let correctP = $('<p>').addClass('title fw-bold fs-60').text(count + '문제 정답!');

    let pointDiv = $('<div>').addClass('pointDiv');
    let point = $('<span>').addClass('content fs-30 fw-bold blue').text(count * 25 + 'P');
    let pointInfo = $('<span>').addClass('content fs-30 fw-bold').text('를 획득하였습니다.');
    pointDiv.append(point, pointInfo);

    let button = $('<button>').addClass('title finishBtn').text('처음으로');
    let btnDiv = $('<div>').addClass('startBtnDiv centerAll').append(button);

    resultDiv.append(correctP, pointDiv, btnDiv);
    $('.quizQue').append(resultDiv);
    $('.progress').css('top', '159px');
}

function payPoiont() {
    /* 포인트 지급 */
    $.ajax({
        type: "POST",
        url: "/quiz/finish",
        data: {email:'${loginMember.email}', point:count * 25},
        success: function(data) {
            alert('포인트 지급 완료!');
        },
        error: function(err){
            alert('포인트 지급 실패...');	
        }
    });
}

/* 돌아가기 버튼 클릭 */
$(document).on('click', '.finishBtn', function(e) {
	location.replace('${path}/quiz');
});
</script>
<!-------------------------------------------->
</body>
</html>
