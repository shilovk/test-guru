// jshint esversion: 6

document.addEventListener('turbolinks:load', () => {
  // Set the date we're counting down to
  var countDownTimer = document.getElementById('count-down-timer')

  if (countDownTimer) {
    var timerSeconds = countDownTimer.dataset.timerSeconds
    if (timerSeconds) { startTimer(countDownTimer, timerSeconds) }
  }
})

function startTimer(countDownTimer, timerSeconds) {
  var countDownDate = new Date().getTime() + parseInt(timerSeconds) * 1000

  // Update the count down every 1 second
  var x = setInterval(function() {

    // Get today's date and time
    var now = new Date().getTime()

    // Find the distance between now and the count down date
    var distance = countDownDate - now

    // Time calculations for hours, minutes and seconds
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
    var seconds = Math.floor((distance % (1000 * 60)) / 1000)

    if (hours > 0) {
      countDownTimer.innerHTML =  hours + ':' + minutes + ':' + seconds
    } else {
      countDownTimer.innerHTML =  minutes + ':' + seconds
    }

    // If the count down is over, write some text
    if (distance < 0) {
      clearInterval(x)

      countDownTimer.innerHTML = countDownTimer.dataset.expired

      var countDownForm = document.getElementById('count-down-form')
      countDownForm.submit()
    }
  }, 1000)
}
