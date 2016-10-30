$(window).load(function(){
	orientation();
});

/* Async support */
$(document).ajaxStop(function(){
	orientation();
});

function orientation() {
	$('img').each(function(){
	    $(this).addClass(this.width > this.height ? 'landscape' : 'portrait');
	});
};