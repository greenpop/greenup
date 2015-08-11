
function carMessage(num_people) {
  if (num_people == 1) {
    return 'Try to carpool with at least one other person!';
  }
  else if (num_people == 2) {
    return 'Nice job sharing your car, but next time invite even more people to carpool!';
  }
  else if (num_people > 2) {
    return 'Great job carpooling!'; 
  }
  else {
    return 'Please enter a valid number of people!'
  }
}

$(function() {
  $(".transport").hide();
  $(".tip").hide();
  // toggle on button click
  $(".car_b").click(function(){ $(".car").slideToggle(); $(this).toggleClass('active'); });
  $(".bus_b").click(function(){ $(".bus").slideToggle(); $(this).toggleClass('active'); });
  $(".train_b").click(function(){ $(".train").slideToggle(); $(this).toggleClass('active'); });
  $(".plane_b").click(function(){ 
    $(".plane").slideToggle(); $(this).toggleClass('active'); 
  });

  $( "#car_people" ).keyup(function() {
    $('.car .tip').html(carMessage($(this).val()));    
    $('.car .tip').fadeIn('slow');
  });

  $( "#bus_km" ).keyup(function() {
    $('.bus .tip').fadeIn('slow');
  });

  $( "#train_km" ).keyup(function() {
    $('.train .tip').fadeIn('slow');
  });

  $( "#flight_id" ).change(function() {
    $('.plane .tip').fadeIn('slow');
  });

});
    
function oneCarParamPresent() {
  return $('#car_km').val() != "" || $('#car_people').val() != "" || $('#car_id').val() != "";
}

function oneCarParamAbsent() {
  return $('#car_km').val() == "" || $('#car_people').val() == "" || $('#car_id').val() == "";
}

$( document ).ready(function() {
  $('#trip-form').submit(function(e) {
    if (oneCarParamPresent() && oneCarParamAbsent()) {
      alert("Please fill out all the car attributes.");
      e.preventDefault(); 
    }
    
  });
});