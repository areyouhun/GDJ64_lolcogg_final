const wrapper = $(".match-content_wrapper");
const matchContainer = $(".match-team-container");
let currentIdxLeft = 0;
let currentIdxRight = 0;

$(window).on("load", () => {
    updateTeamList();
});

function updateTeamList() {
    $.get(getContextPath() + "/resources/images/team_img.json")
        .then(data => {
            const teams = $(".teams");
            const numOfbanners = data.length;

            teams.html("");
            matchContainer.html("");
            matchContainer.height(wrapper.height() * data.length);

            data.forEach((team, index) => {
                const pathToSmallLogo = getContextPath() 
                                        + "/resources/images/logo/" 
                                        + team.logo.small;

                const pathToWhiteLogo = getContextPath() 
                                        + "/resources/images/logo/" 
                                        + team.logo.white;

                teams.append(generateTeamBtn(team.teamAbbr, pathToSmallLogo));
                matchContainer.append(generateMatchContent(team.teamAbbr, pathToWhiteLogo));
            });

            matchContainer.append(matchContainer.children().eq(0)
                        .clone()
                        .addClass("clone"));

            matchContainer.prepend(matchContainer.children().eq(numOfbanners - 1)
                        .clone()
                        .addClass("clone"));

            setTimeout(function () {
                matchContainer.addClass('animated-smooth');
            }, 100);

            $(document).on("click", ".team-btn_down_left", event => {
                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");
                
                if (currentIdxLeft == numOfbanners) {
                    setTimeout(() => {
                        targetContainer.removeClass("animated-smooth")
                            .css("transform", "translateY(0px)");
                        currentIdxLeft = 0;
                    }, 400);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 450);
                }

                targetContainer.css('transform', `translateY(-${++currentIdxLeft * matchContainer.children(".match-content_lineup").eq(0).height()}px)`);
            });

            $(document).on("click", ".team-btn_down_right", event => {
                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");
                
                if (currentIdxRight == numOfbanners) {
                    setTimeout(() => {
                        targetContainer.removeClass("animated-smooth")
                            .css("transform", "translateY(0px)");
                        currentIdxRight = 0;
                    }, 400);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 450);
                }

                targetContainer.css('transform', `translateY(-${++currentIdxRight * matchContainer.children(".match-content_lineup").eq(0).height()}px)`);
            });

            $(document).on("click", ".team-btn_up_left", event => {
                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");
                
                if (currentIdxLeft == 0) {
                    setTimeout(() => {
                        targetContainer.removeClass("animated-smooth");
                        targetContainer.css("transform", `translateY(-${matchContainer.height()}px)`);
                        currentIdxLeft = numOfbanners + 1;
                    }, 400);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 450);
                }

                targetContainer.css('transform', `translateY(-${--currentIdxLeft * matchContainer.children(".match-content_lineup").eq(0).height()}px)`);
            });

            $(document).on("click", ".team-btn_up_right", event => {
                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");
                
                if (currentIdxRight == 0) {
                    setTimeout(() => {
                        targetContainer.removeClass("animated-smooth");
                        targetContainer.css("transform", `translateY(-${matchContainer.height()}px)`);
                        currentIdxRight = numOfbanners + 1;
                    }, 400);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 450);
                }

                targetContainer.css('transform', `translateY(-${--currentIdxRight * matchContainer.children(".match-content_lineup").eq(0).height()}px)`);
            });
        });
}

function generateTeamBtn(abbr, path) {
    return $("<input type='button'>").val(abbr)
                                    .css("backgroundImage", "url(" + path + ")").
                                    addClass("btn-img fw-bolder");
}

function generateMatchContent(abbr, path) {
    return `
        <div class="match-content_lineup">
            <div class="match-content_team">
                <img src="${path}" style="width: 70%">
            </div>
            <p class="title">${abbr}</p>
        </div>
    `;
}

function showMatchRecords(element) {
    console.log(matchContainer.eq(0).children(".match-content_lineup").eq(currentIdxLeft).children("p").text());
    console.log(matchContainer.eq(1).children(".match-content_lineup").eq(currentIdxRight).children("p").text());
}