
// jshint esversion: 6

document.addEventListener("turbolinks:load", () => {
  var control = document.querySelector('.progress-bar')

  if (control) {
    var progress = control.textContent
    changeProgressBar(control, progress)
  }
})

function changeProgressBar(control, progress) {
  var numberPattern = /\d+/g
  progress = progress.match(numberPattern)

  if (progress === '') { progress = 'not available now' }

  control.style.width = progress + '%'
  control.setAttribute('aria-valuenow', progress)
}
