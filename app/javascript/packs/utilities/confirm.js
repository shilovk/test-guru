// jshint esversion: 6

document.addEventListener("turbolinks:load", () => {
  var password = document.querySelector('.check-password')
  var confirm = document.querySelector('.check-confirm-password')

  if ((password) && (confirm)) {
    password.addEventListener('keyup', () => {
      var result = comparePasswordAndConfirmPassword(password, confirm)
      if (confirm.value !== "") { compareAlert(result) }
    })

    confirm.addEventListener('keyup', () => {
      var result = comparePasswordAndConfirmPassword(password, confirm)
      compareAlert(result)
      console.log('1')
    })
  }
})

function comparePasswordAndConfirmPassword(password, confirm) {
  if (password.value == confirm.value) { return true }
  return false
}

function compareAlert(result) {
  var elements = document.querySelectorAll('.compareAlert')
  if (result) {
    elements.forEach((element) => {
      element.classList.remove('red')
      element.classList.add('green')
    })
  } else {
    elements.forEach((element) => {
      element.classList.remove('green')
      element.classList.add('red')
    })
  }
}
