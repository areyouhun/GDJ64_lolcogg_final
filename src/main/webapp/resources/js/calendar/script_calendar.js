$(function(){
	const currentYear = new Date().getFullYear();
	const currentMonth = new Date().getMonth() + 1;
	printCalendar(currentYear, currentMonth);
});

function prevMonth() {
	let year = parseInt($('.calendar-year').text());
	let month = parseInt($('.calendar-month span').text()) - 1;
	
	if(month < 1) {
		year -= 1;
		month = 12;
	}
    animateCalendar(year, month);
}

function nextMonth() {
	let year = parseInt($('.calendar-year').text());
	let month = parseInt($('.calendar-month span').text()) + 1;
	
	if(month > 12) {
		year += 1;
		month = 1;
	}
    animateCalendar(year, month);
}

function animateCalendar(year, month) {
    $('#calendarBody table').fadeOut(300, function() {
        printCalendar(year, month);
        $('#calendarBody table').hide().fadeIn(300);
    });
}

function printCalendar(year, month) {
	$.ajax({
		url: getContextPath() + '/calendar/getAjaxCalendar',
		data: {year:year, month:month},
		type: 'GET',
		success: (data) => {
			const FIRST_DAY = new Date(year, month - 1, 1).getDay();
			const LAST_DAY = new Date(year, month, 0).getDate();
			const WEEK_NUM = Math.ceil((FIRST_DAY + LAST_DAY) / 7);
			const $TABLE = $('#calendarBody table');

			let date = 1;
			
			$TABLE.empty();

			$('.calendar-year').text(year);
			$('.calendar-month span').text(month.toString().padStart(2, '0'));
			
			for(let i=0; i<WEEK_NUM; i++) {
				let $row = $('<tr>').addClass('calendar-row');

				$TABLE.append($row);
				
				for(let j=0; j<7; j++) {
					if(i === 0 && j < FIRST_DAY || date > LAST_DAY) {
						$row.append($('<td>'));
					}else {
						let $td = $('<td>').append($('<div>').addClass('calendar-date').text(date));

						for(let k=0; k<data.length; k++) {
							const MATCH_DATE = new Date(data[k].msDate);
							const CALENDAR_DATE = new Date(year, month - 1, date);

							if(MATCH_DATE.getDate() === CALENDAR_DATE.getDate() && !!data[k].msHome) {
								let container = $('<div>').addClass(!data[k].msWinner ? 'match-schedule' : 'match-schedule match-result')
								.on('click', function(e) {
									if($(e.currentTarget).hasClass('match-result')){
										const FORMAT_DATE = 
											MATCH_DATE.getFullYear().toString().slice(2) + '-' +
											(MATCH_DATE.getMonth() + 1).toString().padStart(2, '0') + '-' +
											MATCH_DATE.getDate().toString().padStart(2, '0');
											location.href =  getContextPath() + '/teamdata/matchResult?matchDate=' + FORMAT_DATE + '&home=' + data[k].msHome + '&away=' + data[k].msAway;
									}else {
										location.href = getContextPath() + '/matchprediction';
									}
								});
								
								container.append($('<div>').addClass('team-logo').append($('<span>').addClass(data[k].msHome === data[k].msWinner ? 'winner' : 'defeat').text(data[k].msHome)));
								container.append('vs');
								container.append($('<div>').addClass('team-logo').append($('<span>').addClass(data[k].msAway === data[k].msWinner ? 'winner' : 'defeat').text(data[k].msAway)));
								
								$td.append(container);
							}
						}
						date++;
						$row.append($td);
					}
				}
			}
		}
	});
}