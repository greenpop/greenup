$(function() {
	$('.box').hide();
	$(".snapimg").hide();
	$('.close').hide();
	$('.snapscan').click(function(){
		$('.snapimg').fadeIn('slow')
		$('.close').fadeIn('slow')
		$('.box').fadeIn('slow')
		$(this).hide()
	});
	$('.close').click(function() {
		$(this).hide()
		$('.snapimg').hide()
		$('.box').hide()
		$('.snapscan').fadeIn('slow')
	});
});