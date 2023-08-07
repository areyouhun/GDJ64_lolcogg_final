$(window).on("load", () => {
    updateTeamList();
});

function updateTeamList() {
    $.get(getContextPath() + "/resources/images/team_img.json")
        .then(data => {
            const teams = $(".teams");
            const numOfbanners = data.length;
            const wrapper = $(".match-content_wrapper");
            const matchContainer = $(".match-team-container");
            const matchContent = $(".match-content");
            let currentIdxLeft = 1;
            let currentIdxRight = 1;

            teams.html("");
            matchContainer.html("");

            data.forEach((team, index) => {
                const pathToSmallLogo = getContextPath() 
                                        + "/resources/images/logo/" 
                                        + team.teamAbbr + "_square.png";

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
            
            matchContainer.height(wrapper.height() * numOfbanners)
                        .css('transform', `translateY(-${currentIdxLeft * wrapper.height()}px)`);


            matchContent.eq(0).children("input[type=hidden]").val(matchContainer.eq(0).children(".match-content_lineup").eq(currentIdxLeft).children("p").text());
            matchContent.eq(1).children("input[type=hidden]").val(matchContainer.eq(1).children(".match-content_lineup").eq(currentIdxRight).children("p").text());

            setTimeout(function () {
                matchContainer.addClass('animated-smooth');
            }, 100);

            $(document).on("click", ".team-btn_down_left", event => {
                $(event.target).css("pointer-events", "none");

                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");

                targetContainer.css('transform', `translateY(-${++currentIdxLeft * wrapper.height()}px)`);

                matchContent.eq(0).children("input[type=hidden]").val(matchContainer.eq(0).children(".match-content_lineup").eq(currentIdxLeft).children("p").text());
                
                if (currentIdxLeft == numOfbanners + 1) {
                    setTimeout(() => {
                        currentIdxLeft = 1;
                        targetContainer.removeClass("animated-smooth")
                            .css("transform", `translateY(-${wrapper.height()}px)`);
                    }, 250);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 300);
                }

                setTimeout(() => {
                    $(event.target).css("pointer-events", "auto");
                }, 310);
            });

            $(document).on("click", ".team-btn_down_right", event => {
                $(event.target).css("pointer-events", "none");

                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");

                targetContainer.css('transform', `translateY(-${++currentIdxRight * wrapper.height()}px)`);

                matchContent.eq(1).children("input[type=hidden]").val(matchContainer.eq(1).children(".match-content_lineup").eq(currentIdxRight).children("p").text());

                if (currentIdxRight == numOfbanners + 1) {
                    setTimeout(() => {
                        currentIdxRight = 1;
                        targetContainer.removeClass("animated-smooth")
                            .css("transform", `translateY(-${wrapper.height()}px)`);
                    }, 250);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 300);
                }

                setTimeout(() => {
                    $(event.target).css("pointer-events", "auto");
                }, 310);
            });

            $(document).on("click", ".team-btn_up_left", event => {
                $(event.target).css("pointer-events", "none");

                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");

                targetContainer.css('transform', `translateY(-${--currentIdxLeft * wrapper.height()}px)`);

                matchContent.eq(0).children("input[type=hidden]").val(matchContainer.eq(0).children(".match-content_lineup").eq(currentIdxLeft).children("p").text());
                
                if (currentIdxLeft == 0) {
                    setTimeout(() => {
                        currentIdxLeft = numOfbanners;
                        targetContainer.removeClass("animated-smooth");
                        targetContainer.css("transform", `translateY(-${matchContainer.height()}px)`);
                    }, 250);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 300);
                }

                setTimeout(() => {
                    $(event.target).css("pointer-events", "auto");
                }, 310);
            });

            $(document).on("click", ".team-btn_up_right", event => {
                $(event.target).css("pointer-events", "none");

                const targetContainer = $(event.target).siblings(".match-content_wrapper").children(".match-team-container");

                targetContainer.css('transform', `translateY(-${--currentIdxRight * wrapper.height()}px)`);

                matchContent.eq(1).children("input[type=hidden]").val(matchContainer.eq(1).children(".match-content_lineup").eq(currentIdxRight).children("p").text());
                
                if (currentIdxRight == 0) {
                    setTimeout(() => {
                        currentIdxRight = numOfbanners;
                        targetContainer.removeClass("animated-smooth");
                        targetContainer.css("transform", `translateY(-${matchContainer.height()}px)`);
                    }, 250);

                    setTimeout(() => {
                        targetContainer.addClass("animated-smooth");
                    }, 300);
                }

                setTimeout(() => {
                    $(event.target).css("pointer-events", "auto");
                }, 310);
            });
        });
}

function generateTeamBtn(abbr, path) {
    return $("<button>").text(abbr)
    .append($("<img>").attr("src", path).addClass("img-absolute")).addClass("btn-img fw-bolder slide-btn");
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

function compareTeams(element) {
	const teamLeft = $(".match-content").eq(0).children("input[type=hidden]").val();
	const teamRight = $(".match-content").eq(1).children("input[type=hidden]").val();
	
	if (teamLeft === teamRight) {
		alert("서로 다른 두 팀을 선택해주세요.");
		return;
	}
	
	location.assign(`${getContextPath()}/teamdata/comparison?teamLeft=${teamLeft}&teamRight=${teamRight}`);
}

$(document).on("click", ".slide-btn", event => {
    let teamName;

    if ($(event.target).prop("tagName") === "BUTTON") {
        teamName = $(event.target).text();
    }
    
    if ($(event.target).prop("tagName") === "IMG") {
        teamName = $(event.target).parent().text();
    }

    location.assign(`${getContextPath()}/teamdata/team?abbr=${teamName}`);
});

$(document).on("mouseenter", ".slide-btn", event => {
    $(event.target).children().css("color", "var(--lol-black)");
})