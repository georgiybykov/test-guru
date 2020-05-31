document.addEventListener('turbolinks:load', function() {
  // объявим локальную переменную 'control' и присвоим в нее элемент, у которого имеется CSS-класс 'check-confirm'
  var control = document.querySelector('.check-confirm')
  // при событии 'input'
  if (control) { control.addEventListener('input', checkPassword) }
})

function checkPassword() {
  var password = document.getElementById('user_password')
  var passwordConfirm = document.getElementById('user_password_confirmation')
  var successMatchElArr = document.querySelectorAll('.octicon-check')
  var failureMatchElArr = document.querySelectorAll('.octicon-x')
  var passwordsArray = [password, passwordConfirm]

  if (passwordConfirm.value === '') {
    passwordsArray.forEach(el => {
      el.classList && el.classList.remove('border-green')
      el.classList && el.classList.remove('border-red')
    })
    // password.classList.remove('border-green')
    // passwordConfirm.classList.remove('border-green')
    // password.classList.remove('border-red')
    // passwordConfirm.classList.remove('border-red')

    successMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })

    failureMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })
  } else if (password.value === passwordConfirm.value) {
    passwordsArray.forEach(el => {
      el.classList && el.classList.add('border-green')
      el.classList && el.classList.remove('border-red')
    })
    // password.classList.add('border-green')
    // passwordConfirm.classList.add('border-green')
    // password.classList.remove('border-red')
    // passwordConfirm.classList.remove('border-red')

    successMatchElArr.forEach(element => {
      element.classList && element.classList.remove('hide')
    })

    failureMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })
  } else {
    passwordsArray.forEach(el => {
      el.classList && el.classList.remove('border-green')
      el.classList && el.classList.add('border-red')
    })
    // password.classList.add('border-red')
    // passwordConfirm.classList.add('border-red')
    // password.classList.remove('border-green')
    // passwordConfirm.classList.remove('border-green')

    successMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })

    failureMatchElArr.forEach(element => {
      element.classList && element.classList.remove('hide')
    })
  }
}


// var elements = document.querySelectorAll('.octicon-check')
// elements = elements.map(el => { element: el, classEl: 'hide' })

// function removeClassListByElement(elements) {
//   elements.forEach(curr => {
//     var element = curr.element
//     var classEl = curr.classEl

//     element.classList.remove(classEl)
//   })
// }
