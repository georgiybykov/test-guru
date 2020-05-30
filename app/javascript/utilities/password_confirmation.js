document.addEventListener('turbolinks:load', function() {
  // объявим локальную переменную 'control' и присвоим в нее элемент, у которого имеется CSS-класс 'check-confirm'
  var control = document.querySelector('.check-confirm')
  // при событии 'input'
  if (control) { control.addEventListener('input', checkPassword) }
})

function checkPassword() {
  var password = document.getElementById('user_password')
  var passwordConfirm = document.getElementById('user_password_confirmation')
  var passwordsMatch = document.querySelector('.octicon-check').classList
  var passwordsNotMatch = document.querySelector('.octicon-x').classList



  if (passwordConfirm.value === '') {
    password.classList.remove('border-green')
    passwordConfirm.classList.remove('border-green')
    password.classList.remove('border-red')
    passwordConfirm.classList.remove('border-red')
    passwordsMatch.add('hide')
    passwordsNotMatch.add('hide')
  } else if (password.value === passwordConfirm.value) {
    password.classList.add('border-green')
    passwordConfirm.classList.add('border-green')
    password.classList.remove('border-red')
    passwordConfirm.classList.remove('border-red')
    passwordsMatch.remove('hide')
    passwordsNotMatch.add('hide')
  } else {
    password.classList.add('border-red')
    passwordConfirm.classList.add('border-red')
    password.classList.remove('border-green')
    passwordConfirm.classList.remove('border-green')
    passwordsMatch.add('hide')
    passwordsNotMatch.remove('hide')
  }
}
