// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
	// create local storage for users, using gem for this
	if(!localStorage["pendingUsers"]){
		localStorage["pendingUsers"] = JSON.stringify([]);
	}
	//called by user controller upon creating a user, retrieves json with users, adds new user to user array
	// $.retrieveJSON("/users.json", function(data){
	// 	var pendingUsers = $.parseJSON(localStorage["pendingUsers"]);
	// 	$.tmpl(data.concat(pendingUsers))
	// });

	//When we click on creating a new user, we stop the post event, instead take user, add to localstorage array
	$("#new_user_btn").on("click", function(e){
		alert("new user being created");
		var pendingUser = $.parseJSON(localStorage["pendingUsers"]);
		var user = {"data": $(this).serialize()};
		pendingUsers.push(user);
		localStorage["pendingUsers"] = JSON.stringify(pendingItems)
		e.preventDefault();
	})

	//if we are online and we have new users in pending users array, add them to our users array
	function sendPending(){
		if(window.navigator.onLine){
			var pendingUsers = $.parseJSON(localStorage["pendingUsers"]);
			if (pendingUsers.length > 0){
				var user = pendingUsers[0];
				$.post("/users", user.data, function(data){
					var pendingUser = $.parseJSON(localStorage["pendingUsers"]);
					localStorage["pendingUsers"] = JSON.stringify(pendingItems)
					setTimeout(sendPending, 100)
				});
			}
		}
	}
	sendPending();
})
