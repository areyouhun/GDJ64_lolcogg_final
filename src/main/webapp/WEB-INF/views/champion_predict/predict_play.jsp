<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:eval var="champImgPath" expression="@environment.getProperty('lolcogg.datadragon.image.champion')" />
<spring:eval var="champInfoPath" expression="@environment.getProperty('lolcogg.datadragon.info.champion')" />
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<link rel="stylesheet" href="${path}/resources/css/champion_predict/style_champion_predict.css">
<style>
.match {
    justify-content: space-between;
}
</style>
<!------------------------------------>
<title>챔피언 예측</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
                
                <!-- 컨텐츠 -->
                <div id="bgmBtn">
                    <img class="bgm-icon" id="play" src="${path}/resources/images/champion_predict/sound-up.png" style="display:none" />
                    <img class="bgm-icon" id="mute" src="${path}/resources/images/champion_predict/sound-mute.png" />
                </div>

                <div id="timer"></div>

                <div class="match" style="pointer-events:none">
                    <div class="match-team">
                        <img src="${path}/resources/images/logo/${homeTeam}_small.png" alt="홈팀">
                        <span class="home-team">${homeTeam}</span>
                    </div>
                    <div class="match-team">
                        <span class="away-team">${awayTeam}</span>
                        <img src="${path}/resources/images/logo/${awayTeam}_small.png" alt="어웨이팀">
                    </div>
                </div>

                <div class="team-container">
                    <div class="blue-team">
                        <div class="blue-player player">TOP</div>
                        <div class="blue-player player">JGL</div>
                        <div class="blue-player player">MID</div>
                        <div class="blue-player player">ADC</div>
                        <div class="blue-player player">SUP</div>
                    </div>
                    <div class="space"></div>
                    <div class="red-team">
                        <div class="red-player player">SUP</div>
                        <div class="red-player player">ADC</div>
                        <div class="red-player player">MID</div>
                        <div class="red-player player">JGL</div>
                        <div class="red-player player">TOP</div>
                    </div>
                </div>

                <div class="banpick-container">
                    <div class="area">
                        <div class="choice-btn">
                            <button>챔피언 선택</button>
                        </div>
                        <div class="btn-area">
                            <div class="submit-btn">
                                <button>제출하기</button>
                            </div>
                            <div class="retry-btn">
                                <button>다시하기</button>
                            </div>
                        </div>
                        <div class="champion-area"></div>
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
    $(function() {
        $('.submit-btn').hide();
        $('.retry-btn').hide();

        // function sendPost(url, params) {
        //     const $FORM = $('<form>').attr({
        //         method: 'post',
        //         action: url
        //     }).appendTo('body');
            
        //     $.each(params, function(key, value) {
        //         $('<input>').attr({
        //             type: 'hidden',
        //             name: key,
        //             value: value
        //         }).appendTo($FORM);
        //     });
        //     $FORM.submit();
        // }

        $('.retry-btn button').click(function() {
            location.replace(document.location.href);
        });

        $('.submit-btn button').click(function() {
            $.ajax({
                url:'${path}/champion_predict/predict_submit',
                type:'POST',
                data:{list:banpickArray.join(','),homeTeam:'${homeTeam}',awayTeam:'${awayTeam}',matchDate:'${matchDate}'},
                complete: (data) => {
                    alert('참여 완료!');
                    location.replace('${path}/champion_predict/predict_home');
                }
            })
        });

        let banpickArray = [];

        $.get('${champInfoPath}')
            .then((data) => {
                const BGM = new Audio('${path}/resources/audio/champion_predict/lol_banpick_bgm.mp3');

                startBGM(BGM);

                $('#play').click(() => {
                    $('#play').hide();
                    $('#mute').show();
                    BGM.play();
                });

                $('#mute').click(() => {
                    $('#play').show();
                    $('#mute').hide();
                    BGM.pause();
                });

                const CHAMP_NAME_ARR = Object.entries(data.data).map(([key, value]) => ({
                    engName: key,
                    korName: value.name
                }));

                CHAMP_NAME_ARR.sort((a, b) => a.korName.localeCompare(b.korName));

                const NO_BAN_DIV = $('<div>').addClass('champions no-ban-champ').attr('champion', ' ');
                const NO_BAN_IMG = $('<img>').addClass('champion-img').attr('src', '${path}/resources/images/champion_predict/ban-img.png');
                    
                NO_BAN_DIV.append(NO_BAN_IMG).append('노 밴');

                $('.champion-area').append(NO_BAN_DIV);

                for(let name of CHAMP_NAME_ARR) {
                    const $DIV = $('<div>').addClass('champions').attr('champion', name.engName);
                    const $IMG = $('<img>').addClass('champion-img').attr('src', '${champImgPath}' + name.engName + '.png');
                    $DIV.append($IMG).append(name.korName);
                    $('.champion-area').append($DIV);
                }

                $('.champions').on('click', function(e) {
                    $('.champions').removeClass('choice');
                    $(this).addClass('choice');
                });

                let timer = 30;
                let currentTeam = 'blue';

                let intervalTimer = setInterval(() => {
                    if(timer > 0) {
                        $('#timer').text(timer--);
                    }else {
                        timer = 30;
                    }

                    if($('.selected').length === 10) {
                        clearInterval(intervalTimer);
                        $('.choice-btn').hide();
                        $('.submit-btn').show();
                        $('.retry-btn').show();
                        $('#timer').text('종료');
                        let selectArr = $('.select');

                        $('.champion-area').empty();

                        $('.champion-area').addClass('answer-text').text('제출하기를 눌르면 끝납니다.');

                        for(let banpick of selectArr) {
                            banpickArray.push(banpick.getAttribute('champion'));
                        }
                    }
                }, 1000);

                $('.choice-btn').on('click', function(e) {
                    const CHAMPION = $('.choice');

                    championVoice(CHAMPION.text());

                    timer = 30;
                    let slots;

                    if(CHAMPION.length) {
                        CHAMPION.addClass('select');

                        if(currentTeam === 'blue') {
                            slots = $('.blue-player:not(.selected)').first();
                            currentTeam = 'red';
                        }else {
                            slots = $('.red-player:not(.selected)').last();
                            currentTeam = 'blue';
                        }

                        if(CHAMPION.text() === '노 밴') {
                            noBanpickRender(slots);
                            return;
                        }

                        banpickRender(slots, CHAMPION.text(), CHAMPION.attr('champion'))
                        $('.champions').removeClass('choice');
                    }
                });

                if(timer === 1) {
                    if(currentTeam === 'blue') {
                        slots = $('.blue-player:not(.selected)').first();
                        currentTeam = 'red';
                    }else {
                        slots = $('.red-player:not(.selected)').last();
                        currentTeam = 'blue';
                    }

                    noBanpickRender(slots);
                    $('.champions').removeClass('choice');
                }
            });
    });

    function startBGM(bgm) {
        bgm.load();
        bgm.volume = 0.75;
        bgm.play();
        bgm.loop = true;
    }

    function championVoice(name) {
        const VOICE = new Audio('${path}/resources/audio/champion_predict/' + name + '.ogg');
        VOICE.load();
        VOICE.volume = 1;
        VOICE.play();
    }

    function banpickRender(slots, engName, korName) {
        slots.empty().append($('<span>')).text(engName);

        const $DIV = $('<div>').addClass('banpick-img-box');

        $DIV.append($('<img>')
            .attr('src', 'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/' + korName + '_0.jpg')
            .css({
                'width':'100%',
            }));

        $DIV.append($('<img>')
            .attr('src', '${path}/resources/images/champion_predict/ban-img.png')
            .css({
                'width':'30px',
                'position':'absolute',
                'top':'190px',
                'left':'45px',
                'z-index':'2'
            }));

        slots.addClass('selected').append($DIV);
    }

    function noBanpickRender(slots) {
        slots.empty().append($('<span>')).text('No Ban');

        const $DIV = $('<div>').addClass('banpick-img-box').append($('<img>')
            .attr('src', '${path}/resources/images/champion_predict/ban-img.png')
            .css({
                'width':'100%',
                'height':'100%',
                'margin-top':'50px'
            }));
        $('.no-ban-champ').removeClass('select');
        slots.addClass('selected').append($DIV);
    }
</script>
<!-------------------------------------------->
</body>
</html>