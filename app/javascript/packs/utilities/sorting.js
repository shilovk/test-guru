// jshint esversion: 6

document.addEventListener("turbolinks:load", () => {
  var control = document.querySelector('.sort-by-title')

  if (control) {
    control.addEventListener('click', () => {
      sortRowsByTitle(control)
    })
  }
})

function sortRowsByTitle(control) {
  var table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  // Select all table rows except the first one which is yhe header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (control.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    control.querySelector('.octicon-arrow-up').classList.remove('hide')
    control.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    control.querySelector('.octicon-arrow-down').classList.remove('hide')
    control.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('table')

  sortedTable.classList = table.classList
  sortedTable.appendChild(rows[0])

  for (i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)

}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('th').textContent
  var testTitle2 = row2.querySelector('th').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('th').textContent
  var testTitle2 = row2.querySelector('th').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
