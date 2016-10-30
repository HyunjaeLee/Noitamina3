$(window).load(function(){
	orientation();
});

/* AJAX support */
$(document).ajaxStop(function(){
	orientation();
});

function orientation() {
	$('img').each(function(){
	    $(this).addClass(this.width > this.height ? 'landscape' : 'portrait');
	});
};