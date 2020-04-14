categories = Category.create!([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'UX/UI' }]
)

tests = Test.create!([
  { title: 'Beginner', level: 0, presence: true, category_id: categories[1].id },
  { title: 'Middle', level: 1, presence: true, category_id: categories[0].id }
])

questions = Question.create!([
  { body: 'Is Ruby language for backend development?', test_id: tests[0].id },
  { body: 'Is Vue.js framework on Ruby language?', test_id: tests[0].id },
  { body: 'Does Rails contain find_each() method?', test_id: tests[1].id },
  { body: 'Does full stack consist of backend and frontend?', test_id: tests[1].id },
  { body: 'Had Ruby on Rails been created for design applications?', test_id: tests[1].id }
])

answers = Answer.create!([
  { body: 'No', correct: true, question_id: questions[0].id },
  { body: 'No', correct: true, question_id: questions[1].id },
  { body: 'Yes', correct: true, question_id: questions[2].id },
  { body: 'No', question_id: questions[3].id },
  { body: 'Yes', question_id: questions[4].id }
])

users = User.create!([
  { name: 'TestName', email: 'test@email.com', password_digest: 'TestPassword' },
  { name: 'TestName1', email: 'test1@email.com', password_digest: 'TestPassword1' },
  { name: 'TestName2', email: 'test2@email.com', password_digest: 'TestPassword2' }
])

results = Result.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[1].id },
  { user_id: users[2].id, test_id: tests[1].id }
])
