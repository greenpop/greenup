// $(function(){
// 	$(".begin").hide();
// });

// $(function() {
// 	$(".dropdown").change(function(){
// 		$(".begin").show();
// 		// $(".logo").hide();
// 	});
// });

$( document ).ready(function() {
	$('#event_name').change(function() { 
		window.location = "/events/"+this.selectedIndex+"/users/new";
	});
});

      // - if @events.try(:any?)
      //   - @events.each do |event|
      //     %h2.start
      //       = link_to("Get Started \u27A2", new_event_user_path(event))
      // - elsif params[:event_search]
      //   %h3 No Events Found