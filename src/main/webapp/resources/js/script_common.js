// Getting a context path
function getContextPath() {
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf("/", hostIndex + 1));
}

// Opening a new page in a specific size
function openPage(url, width, height) {
	const left = (window.screen.width / 2) - (width / 2);
	const top = (window.screen.height / 2) - (height / 2);

	window.open(url, "_blank",
				`width=${width}, height=${height}, 
				left=${left}, top=${top}`
	);
}

// Closing the page
function closePage() {
    window.close();
}

// Converting long milliseconds to a date (yyyy-MM-dd)
const formatDate = (milliseconds) => {
	const date = new Date(milliseconds);
	const year = date.getFullYear().toString();
	const month = (date.getMonth() + 1).toString();
	const day = date.getDate().toString();
	
	return year + '-' + (month[1] ? month : '0' + month[0]) + '-' + (day[1] ? day : '0' + day[0]);
};

// sliding down effect for the header
$("nav").mouseenter(e=>{
    const navContainer = $("div.nav");
    $(navContainer).addClass("nav-hover");
    $(navContainer).removeClass("nav-default");
    $(".nav-ul-ul").css("display","block");
    $("nav").css("height", "290px");
    }
)

$("nav").mouseleave(e=>{
    const navContainer = $("div.nav");
    $(navContainer).removeClass("nav-hover");
    $(navContainer).addClass("nav-default");
    $(".nav-ul-ul").css("display","none");
    $("nav").css("height", "60px");
    }
)

/*프로필 호버*/
$(".myProfileLogo").mouseenter(e=>{
    const myProfileLogo = $("div.myProfileLogo");
    $(myProfileLogo).addClass("nav-hover");
    $(myProfileLogo).removeClass("nav-default");
    $(".myProfileBox").css("display","block");
    $(".myProfileLogo").css("height", "550px");
    }
)

$(".myProfileLogo").mouseleave(e=>{
    const myProfileLogo = $("div.myProfileLogo");
    $(myProfileLogo).removeClass("nav-hover");
    $(myProfileLogo).addClass("nav-default");
    $(".myProfileBox").css("display","none");
    $(".myProfileLogo").css("height", "60px");
    }
)