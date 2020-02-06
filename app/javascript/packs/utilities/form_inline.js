// jshint esversion: 6

document.addEventListener('turbolinks:load', function() {
  var $controls = $('.form-inline-link')

  if (($controls) && ($controls.length != 0)) {
    $controls.on('click', formInlineLinkHandler)

    var errors = document.querySelector('.resource-errors')

    if (errors) {
      var resourceId = errors.dataset.resourceId
      formInlineHandler(resourceId)
    }
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  $testTitle.toggle()
  $formInline.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
