// jshint esversion: 6

document.addEventListener("turbolinks:load", () => {
  var password = document.querySelector('.check-password')
  var confirm = document.querySelector('.check-confirm-password')

  if ((password) && (confirm)) {
    password.oninput = comparePasswordAndConfirmPassword
    confirm.oninput = comparePasswordAndConfirmPassword
  }

  function comparePasswordAndConfirmPassword() {
    if (confirm.value === "") { compareAlert(); return }

    compareAlert(password.value == confirm.value)
  }
})

function compareAlert(result) {
  var colors = { true:'green', false:'red' }
  var elements = document.querySelectorAll('.compareAlert')

  elements.forEach((element) => {
    element.classList.remove.apply(element.classList, Object.values(colors))
    if (colors[result]) { element.classList.add(colors[result]) }
  })
}
