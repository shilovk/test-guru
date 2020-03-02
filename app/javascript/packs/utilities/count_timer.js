// jshint esversion: 6

document.addEventListener("turbolinks:load", () => {
  // Set the date we're counting down to
  var timer = document.getElementById("count-timer");
  var countDownDate = new Date(parseInt(timer.dataset.time));

  // Update the count down every 1 second
  var x = setInterval(function() {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Output the result in an element with id="demo"
    if (days > 0) {
      timer.innerHTML =  days + ':' +  hours + ':' + minutes + ':' + seconds
    } else if (hours > 0) {
      timer.innerHTML =  hours + ':' + minutes + ':' + seconds
    } else if (minutes > 0) {
      timer.innerHTML =  minutes + ':' + seconds
    } else {
      timer.innerHTML =  seconds
    }

    // If the count down is over, write some text
    if (distance < 0) {
      clearInterval(x);
      timer.innerHTML = timer.dataset.expired;
    }
  }, 1000);
})
