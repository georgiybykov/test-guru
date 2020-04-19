categories = Category.create!([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'UX/UI' }]
)

users = User.create!([
  { name: 'TestName', email: 'test@email.com', password_digest: 'TestPassword' },
  { name: 'TestName1', email: 'test1@email.com', password_digest: 'TestPassword1' },
  { name: 'TestName2', email: 'test2@email.com', password_digest: 'TestPassword2' }
])

tests = Test.create!([
  { title: 'Beginner', level: 0, presence: true, category: categories[1], author: users[0] },
  { title: 'Middle', level: 1, presence: true, category: categories[0], author: users[2] }
])

questions = Question.create!([
  { body: 'Is Ruby language for backend development?', test: tests[0] },
  { body: 'Is Vue.js framework on Ruby language?', test: tests[0] },
  { body: 'Does Rails contain find_each() method?', test: tests[1] },
  { body: 'Does full stack consist of backend and frontend?', test: tests[1] },
  { body: 'Had Ruby on Rails been created for design applications?', test: tests[1] }
])

answers = Answer.create!([
  { body: 'No', correct: true, question: questions[0] },
  { body: 'No', correct: true, question: questions[1] },
  { body: 'Yes', correct: true, question: questions[2] },
  { body: 'No', question: questions[3] },
  { body: 'Yes', question: questions[4] }
])

tests_users = TestsUser.create!([
  { user: users[0], test: tests[0] },
  { user: users[1], test: tests[1] },
  { user: users[2], test: tests[1] }
])
