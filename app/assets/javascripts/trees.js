$(function() {
	$('.box').hide();
	$(".snapimg").hide();
	$('.close').hide();
	$('#submit').hide();
	$('#snap').click(function(){
		$('.snapimg').fadeIn('slow')
		$('.close').fadeIn('slow')
		$('.box').fadeIn('slow')
		$('#submit').fadeIn('slow')
		$(this).hide()
		$('.paypal').hide()
	});
	$('.close').click(function() {
		$(this).hide()
		$('.snapimg').hide()
		$('.box').hide()
		$('#submit').hide()
		$('#snap').fadeIn('slow')
		$('.paypal').fadeIn('slow')
	});
});