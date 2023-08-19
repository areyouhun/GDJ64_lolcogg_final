<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" scope="session" value="${loginMember }" />
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/quiz/soundQuiz.css">

<!-- icon -->
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
            	<div class='quiz'>
                    <div id="quizTitle">
                        <p class="mainTitle fs-35">내 목소리를 들어봐~</p>
                    </div>

                    <div class='quizBg info'>
                        <div class='quizInfoAll centerAll'>
                            <div class='quizInfo'>
                                <p class='quizP content fs-30 fw-bold'>어느 챔피언의 대사일까요?<br>챔피언의 대사를 듣고 해당 챔피언을 골라주세요!</p>
                                <p class='quizP content fs-20'>* 문제는 총 4문제로 구성되어 있습니다.</p>
                            </div>
                        </div>
                        <div class='startBtnDiv centerAll'>
                            <button class='title startBtn'>시작하기</button>
                        </div>
                    </div>
                   <div class='quizBg quizQue hidden'>
                        <ul class='quizView'>
                            <li>
                                <div class='questionAll'>
                                    <div class='question'>
                                        <p class='content fs-28 fw-bold'>Q. 어느 챔피언의 목소리일까요?</p>
                                        <div class='audioBtnDiv'>
                                            <button class='audioBtn'>
                                                <ion-icon name="mic-circle-outline"></ion-icon>
                                                소리듣기
                                            </button>
                                        </div>
                                    </div>
                                    <div class='answerAll'></div>
                                </div>
                            </li>
                        </ul>
                        
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
/* 로그인 세션값 */
const loginMember = "${sessionScope.loginMember}";

/* 문제 목록 */
const questions = [
	{
		audioSrc: '101 제라스',
		options: ['Xerath', 'Khazix', 'Aatrox', 'Malzahar'],
		correctOption: 0
	},
	{
		audioSrc: '102 쉬바나',
		options: ['Shyvana', 'Samira', 'Belveth', 'Evelynn'],
		correctOption: 0
	},
	{
		audioSrc: '103 아리',
		options: ['Ahri', 'MissFortune', 'Sona', 'Zyra'],
		correctOption: 0
	},
	{
		audioSrc: '104 잭스',
		options: ['Jax', 'Kled', 'LeeSin', 'MasterYi'],
		correctOption: 0
	},
	{
		audioSrc: '105 피즈',
		options: ['Fizz', 'Poppy', 'Vex', 'Ziggs'],
		correctOption: 0
	},
	{
		audioSrc: '114 피오라',
		options: ['Fiora', 'Syndra', 'Sivir', 'Soraka'],
		correctOption: 0
	},
	{
		audioSrc: '117 룰루',
		options: ['Lulu', 'Zeri', 'Taliyah', 'Vex'],
		correctOption: 0
	},
	{
		audioSrc: '127 리산드라',
		options: ['Lissandra', 'Qiyana', 'Taliyah', 'Xayah'],
		correctOption: 0
	},
	{
		audioSrc: '136 아우솔',
		options: ['AurelionSol', 'Nasus', 'Yorick', 'Skarner'],
		correctOption: 0
	},
	{
		audioSrc: '142 조이',
		options: ['Zoe', 'Tristana', 'Zeri', 'Soraka'],
		correctOption: 0
	},
	{
		audioSrc: '147 세라핀',
		options: ['Seraphine', 'Soraka', 'Sona', 'Neeko'],
		correctOption: 0
	},
	{
		audioSrc: '150 나르',
		options: ['Gnar', 'Nunu', 'Rengar', 'Rumble'],
		correctOption: 0
	},
	{
		audioSrc: '154 자크',
		options: ['Zac', 'TahmKench', 'Rakan', 'Malphite'],
		correctOption: 0
	},
	{
		audioSrc: '17 티모',
		options: ['Teemo', 'Veigar', 'Ziggs', 'Milio'],
		correctOption: 0
	},
	{
		audioSrc: '201 브라움',
		options: ['Braum', 'Rakan', 'Pantheon', 'Singed'],
		correctOption: 0
	},
	{
		audioSrc: '202 진',
		options: ['Jhin', 'TwistedFate', 'Varus', 'Pyke'],
		correctOption: 0
	},
	{
		audioSrc: '21 미스포츈',
		options: ['MissFortune', 'Sivir', 'Taliyah', 'Senna'],
		correctOption: 0
	},
	{
		audioSrc: '22 애쉬',
		options: ['Ashe', 'Zyra', 'Rell', 'Sivir'],
		correctOption: 0
	},
	{
		audioSrc: '223 탐켄치',
		options: ['TahmKench', 'Mordekaiser', 'RekSai', 'Taric'],
		correctOption: 0
	},
	{
		audioSrc: '238 제드',
		options: ['Zed', 'Renekton', 'Sett', 'Sylas'],
		correctOption: 0
	},
	{
		audioSrc: '254 바이',
		options: ['Vi', 'Riven', 'Senna', 'Syndra'],
		correctOption: 0
	},
	{
		audioSrc: '25 모르가나',
		options: ['Morgana', 'Nilah', 'Vayne', 'Samira'],
		correctOption: 0
	},
	{
		audioSrc: '267 나미',
		options: ['Nami', 'Seraphine', 'Orianna', 'Neeko'],
		correctOption: 0
	},
	{
		audioSrc: '26 질리언',
		options: ['Zilean', 'Nocturne', 'Pantheon', 'Udyr'],
		correctOption: 0
	},
	{
		audioSrc: '29 트위치',
		options: ['Twitch', 'Heimerdinger', 'Milio', 'Rakan'],
		correctOption: 0
	},
	{
		audioSrc: '2 올라프',
		options: ['Olaf', 'Viego', 'Warwick', 'XinZhao'],
		correctOption: 0
	},
	{
		audioSrc: '32 아무무',
		options: ['Amumu', 'Fizz', 'Nautilus', 'Naafiri'],
		correctOption: 0
	},
	{
		audioSrc: '33 람머스',
		options: ['Rammus', 'Nautilus', 'Jax', 'Braum'],
		correctOption: 0
	},
	{
		audioSrc: '350 유미',
		options: ['Yuumi', 'Zeri', 'Neeko', 'Poppy'],
		correctOption: 0
	},
	{
		audioSrc: '35 샤코',
		options: ['Shaco', 'Corki', 'Blitzcrank', 'Taric'],
		correctOption: 0
	},
	{
		audioSrc: '36 문도박사',
		options: ['DrMundo', 'Gangplank', 'Braum', 'Chogath'],
		correctOption: 0
	},
	{
		audioSrc: '360 사미라',
		options: ['Samira', 'Jinx', 'Kaisa', 'Leona'],
		correctOption: 0
	},
	{
		audioSrc: '39 이렐리아',
		options: ['Irelia', 'Kaisa', 'Caitlyn', 'Sivir'],
		correctOption: 0
	},
	{
		audioSrc: '40 잔나',
		options: ['Janna', 'Lux', 'Nami', 'Sona'],
		correctOption: 0
	},
	{
		audioSrc: '421 렉사이',
		options: ['RekSai', 'Skarner', 'Karthus', 'Bard'],
		correctOption: 0
	},
	{
		audioSrc: '41 갱플랭크',
		options: ['Gangplank', 'Singed', 'JarvanIV', 'Jayce'],
		correctOption: 0
	},
	{
		audioSrc: '420 일라오이',
		options: ['Illaoi', 'Samira', 'Sejuani', 'Shyvana'],
		correctOption: 0
	},
	{
		audioSrc: '427 아이번',
		options: ['Ivern', 'Shen', 'Maokai', 'Draven'],
		correctOption: 0
	},
	{
		audioSrc: '42 코르키',
		options: ['Corki', 'Heimerdinger', 'Ziggs', 'Warwick'],
		correctOption: 0
	},
	{
		audioSrc: '43 카르마',
		options: ['Karma', 'Soraka', 'Renata', 'Taliyah'],
		correctOption: 0
	},
	{
		audioSrc: '44 타릭',
		options: ['Taric', 'Ziggs', 'Yorick', 'MasterYi'],
		correctOption: 0
	},
	{
		audioSrc: '45 베이가',
		options: ['Veigar', 'Rumble', 'Velkoz', 'Heimerdinger'],
		correctOption: 0
	},
	{
		audioSrc: '26 질리언',
		options: ['Zilean', 'Viktor', 'Shen', 'TahmKench'],
		correctOption: 0
	},
	{
		audioSrc: '48 트런들',
		options: ['Trundle', 'Warwick', 'Zac', 'Singed'],
		correctOption: 0
	},
	{
		audioSrc: '516 오른',
		options: ['Ornn', 'Yorick', 'Sion', 'Mordekaiser'],
		correctOption: 0
	},
	{
		audioSrc: '518 니코',
		options: ['Neeko', 'Yuumi', 'Zoe', 'Seraphine'],
		correctOption: 0
	},
	{
		audioSrc: '51 케이틀린',
		options: ['Caitlyn', 'Nilah', 'Quinn', 'Samira'],
		correctOption: 0
	},
	{
		audioSrc: '526 렐',
		options: ['Rell', 'Renata', 'Sejuani', 'Cassiopeia'],
		correctOption: 0
	},
	{
		audioSrc: '53 블리츠',
		options: ['Blitzcrank', 'Nocturne', 'Gnar', 'Viego'],
		correctOption: 0
	},
	{
		audioSrc: '54 말파',
		options: ['Malphite', 'Naafiri', 'Nocturne', 'Renekton'],
		correctOption: 0
	},
	{
		audioSrc: '57 마오카이',
		options: ['Maokai', 'Skarner', 'Milio', 'DrMundo'],
		correctOption: 0
	},
	{
		audioSrc: '60 엘리스',
		options: ['Elise', 'Ashe', 'Belveth', 'Diana'],
		correctOption: 0
	},
	{
		audioSrc: '59 자르반',
		options: ['JarvanIV', 'Sylas', 'Varus', 'Aphelios'],
		correctOption: 0
	},
	{
		audioSrc: '62 오공',
		options: ['MonkeyKing', 'Naafiri', 'Akshan', 'Viego'],
		correctOption: 0
	},
	{
		audioSrc: '64 리신',
		options: ['LeeSin', 'Zed', 'Aatrox', 'Zilean'],
		correctOption: 0
	},
	{
		audioSrc: '67 베인',
		options: ['Vayne', 'Syndra', 'Kalista', 'Kayle'],
		correctOption: 0
	},
	{
		audioSrc: '6 우르곳',
		options: ['Urgot', 'TahmKench', 'Trundle', 'Braum'],
		correctOption: 0
	},
	{
		audioSrc: '74 하이머딩거',
		options: ['Heimerdinger', 'Malzahar', 'Milio', 'Twitch'],
		correctOption: 0
	},
	{
		audioSrc: '76 니달리',
		options: ['Nidalee', 'MissFortune', 'Morgana', 'Leblanc'],
		correctOption: 0
	},
	{
		audioSrc: '78 뽀삐',
		options: ['Poppy', 'Kennen', 'Neeko', 'Yuumi'],
		correctOption: 0
	},
	{
		audioSrc: '79 그라가스',
		options: ['Gragas', 'Graves', 'Swain', 'Tryndamere'],
		correctOption: 0
	},
	{
		audioSrc: '81 이즈리얼',
		options: ['Ezreal', 'Brand', 'Ekko', 'LeeSin'],
		correctOption: 0
	},
	{
		audioSrc: '84 아칼리',
		options: ['Akali', 'Evelynn', 'Fiora', 'Gwen'],
		correctOption: 0
	},
	{
		audioSrc: '85 케넨',
		options: ['Kennen', 'Kindred', 'Nunu', 'Tristana'],
		correctOption: 0
	},
	{
		audioSrc: '86 가렌',
		options: ['Garen', 'Draven', 'Galio', 'Gangplank'],
		correctOption: 0
	},
	{
		audioSrc: '875 세트',
		options: ['Sett', 'KSante', 'Lucian', 'Nasus'],
		correctOption: 0
	},
	{
		audioSrc: '887 그웬',
		options: ['Gwen', 'Leblanc', 'Katarina', 'Kayle'],
		correctOption: 0
	},
	{
		audioSrc: '876 릴리아',
		options: ['Lillia', 'Lissandra', 'Orianna', 'Neeko'],
		correctOption: 0
	},
	{
		audioSrc: '897 크산테',
		options: ['KSante', 'Malphite', 'Rengar', 'Shen'],
		correctOption: 0
	},
	{
		audioSrc: '89 레오나',
		options: ['Leona', 'Qiyana', 'Renata', 'Riven'],
		correctOption: 0
	},
	{
		audioSrc: '8 블라디미르',
		options: ['Vladimir', 'Ryze', 'Swain', 'Pantheon'],
		correctOption: 0
	},
	{
		audioSrc: '91 탈론',
		options: ['Talon', 'Taric', 'Volibear', 'Yone'],
		correctOption: 0
	},
	{
		audioSrc: '92 리븐',
		options: ['Riven', 'Xayah', 'Irelia', 'Camille'],
		correctOption: 0
	},
	{
		audioSrc: '98 쉔',
		options: ['Shen', 'Galio', 'Brand', 'Jhin'],
		correctOption: 0
	},
	{
		audioSrc: '99 럭스',
		options: ['Lux', 'Caitlyn', 'Leona', 'Lillia'],
		correctOption: 0
	},
	{
		audioSrc: '9 피들스틱',
		options: ['Fiddlesticks', 'Azir', 'Fizz', 'Karthus'],
		correctOption: 0
	},
	{
		audioSrc: '56 녹턴',
		options: ['Nocturne', 'Aatrox', 'Darius', 'Hecarim'],
		correctOption: 0
	},
	{
		audioSrc: '526 렐',
		options: ['Rell', 'Illaoi', 'Kaisa', 'Senna'],
		correctOption: 0
	}
];

/* 시작하기 버튼 클릭 */
$('.startBtn').click(e=>{
	if(loginMember != '') {
		startQuiz();
	} else {
		alert("로그인 후 이용 가능한 서비스입니다.");
		location.assign('${path}/member/loginPage');
	}
})


/* 게임 시작 */
let randomQuestions = [];
let nowQuizIndex = 0;

function startQuiz() {
	randomQuestions = shuffleArray(questions);
	nowQuizIndex = 0;
	loadQuestion(nowQuizIndex);
	$('.info').addClass('hidden');
	$('.quizQue').removeClass('hidden');
}


/* 문제 불러오기 */
const audioElement = new Audio();

function loadQuestion(index) {
	const question = randomQuestions[index];
	audioElement.src = '${path}/resources/audio/voice/' + question.audioSrc + '.ogg';
	
	$('.answerAll').html('');
	
	const shuffledOptions = shuffleArray(question.options);
	shuffledOptions.forEach((option, i) => {
		
        const answer = $('<div>').addClass('answer');
        const answerImg = $('<img>').attr('src', '${path}/resources/images/quiz/square/' + option + '.jpg');
        answer.append(answerImg);
	    
        answer.click(e=>{checkAnswer(i, shuffledOptions.indexOf(question.options[question.correctOption]))});
        
        $('.answerAll').append(answer);
	});
}

/* 소리듣기 버튼 */
$('.audioBtn').click(e=> {
	audioElement.volume = 0.3;
	audioElement.play();
});

/* 정답 확인 */
let count = 0;
function checkAnswer(selectedOption, correctOption) {
	
	if (selectedOption == correctOption) {
		count++;
	} else {
	  	
	}
	nextQuestion();
}

/* 다음 문제 */
let percentage = 0;
function nextQuestion() {
	nowQuizIndex++;
	if (nowQuizIndex < 4) {
  		loadQuestion(nowQuizIndex);
  		percentage = percentage + 25;
  		$('.progressBg').css('width', percentage + '%');
	} else {
		percentage = percentage + 25;
		$('.progressBg').css('width', percentage + '%');
  		/* 종료되고 화면전환 및 포인트 지급 코드 작성 */
  		
  		$('.quizView').addClass('hidden');
  		
  		let resultDiv = $('<div>').addClass('resultDiv');
  		let correctP = $('<p>').addClass('title fw-bold fs-60').text(count + '문제 정답!');
  		
  		let pointDiv = $('<div>').addClass('pointDiv');
  		let point = $('<span>').addClass('content fs-30 fw-bold blue').text(count * 25 + 'P');
  		let pointInfo = $('<span>').addClass('content fs-30 fw-bold').text('를 획득하였습니다.');
  		pointDiv.append(point, pointInfo);
  		
  		let btnDiv = $('<div>').addClass('startBtnDiv centerAll');
  		let button = $('<button>').addClass('title finishBtn').text('처음으로');
  		btnDiv.append(button);
  		
  		resultDiv.append(correctP);
  		resultDiv.append(pointDiv);
  		resultDiv.append(btnDiv);
  		$('.quizQue').prepend(resultDiv);
  		
  		$('.progress').css('top', '159px');


  		/* 포인트 지급 */
  		$.ajax({
  		    type: "POST",
  		    url: "${path}/quiz/finish",
  		    data: { email : '${loginMember.email}',
  		    	point : count*25},
  		    dataType: "json",
  		    success: function(data) {
  		    	console.log('응답완료');
  		    },
  		    error: function(err){
  		    	console.log(err);	
  		    }
  		});
	}
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

/* 돌아가기 버튼 클릭 */
$(document).on("click", ".finishBtn", function(e) {
	location.replace('${path}/quiz');
})

</script>
<!-------------------------------------------->
</body>
</html>
