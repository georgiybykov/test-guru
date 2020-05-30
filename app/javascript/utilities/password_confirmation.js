document.addEventListener('turbolinks:load', function() {
  // объявим локальную переменную 'control' и присвоим в нее элемент, у которого имеется CSS-класс 'check-confirm'
  var control = document.querySelector('.check-confirm')
  // при событии 'input'
  if (control) { control.addEventListener('input', checkPassword) }
})

function checkPassword() {
  var password = document.getElementById('user_password')
  var password_confirm = document.getElementById('user_password_confirmation')
  var passwords_match = document.querySelector('.octicon-check').classList
  var passwords_not_match = document.querySelector('.octicon-x').classList



  if (password_confirm.value === '') {
    password.classList.remove('border-green')
    password_confirm.classList.remove('border-green')
    password.classList.remove('border-red')
    password_confirm.classList.remove('border-red')
    passwords_match.add('hide')
    passwords_not_match.add('hide')
  } else if (password.value === password_confirm.value) {
    password.classList.add('border-green')
    password_confirm.classList.add('border-green')
    password.classList.remove('border-red')
    password_confirm.classList.remove('border-red')
    passwords_match.remove('hide')
    passwords_not_match.add('hide')
  } else {
    password.classList.add('border-red')
    password_confirm.classList.add('border-red')
    password.classList.remove('border-green')
    password_confirm.classList.remove('border-green')
    passwords_match.add('hide')
    passwords_not_match.remove('hide')
  }
}
