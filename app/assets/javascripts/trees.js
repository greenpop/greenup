$(function() {
	$(".snapimg").hide();
	$('.snapscan').click(function(){

		$('.snapimg').fadeIn('slow')
		$(this).hide()
	});
});