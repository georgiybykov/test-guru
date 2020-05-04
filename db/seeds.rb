categories = Category.create!([
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'UX/UI' }]
)

users = User.create!([
  { name: 'TestName', email: 'test@email.com', password_digest: 'TestPassword' },
  { name: 'TestName1', email: 'test1@email.com', password_digest: 'TestPassword1' },
  { name: 'TestName2', email: 'test2@email.com', password_digest: 'TestPassword2' }
])

tests = Test.create!([
  { title: 'Beginner', level: 0, presence: true, category: categories[0], author: users[0] },
  { title: 'Middle', level: 1, presence: true, category: categories[1], author: users[1] },
  { title: 'Advanced', level: 2, presence: true, category: categories[2], author: users[2] }
])

tests_users = TestsUser.create!([
  { test: tests[0], user: users[0] },
  { test: tests[1], user: users[1] },
  { test: tests[2], user: users[2] }
])

questions = Question.create!([
  { body: 'Is Ruby language for backend development?', test: tests[0], answers: [
    Answer.new(body: 'Yes', correct: true),
    Answer.new(body: 'No'),
    Answer.new(body: 'It has been using only for user interface.'),
    Answer.new(body: 'It is the language for system administration.')
  ] },
  { body: 'Is Vue.js framework on Ruby language?', test: tests[0], answers: [
    Answer.new(body: 'Yes'),
    Answer.new(body: 'No', correct: true),
    Answer.new(body: 'It supports all programming languages.')
  ] },
  { body: 'Does Rails contain find_each() method?', test: tests[1], answers: [
    Answer.new(body: 'It is validation method.'),
    Answer.new(body: 'No'),
    Answer.new(body: 'Yes', correct: true),
    Answer.new(body: 'Yes, however if you require special gem.')
  ] },
  { body: 'Does full stack consist of backend and frontend development?', test: tests[1], answers: [
    Answer.new(body: 'It depends of specific framework.'),
    Answer.new(body: 'No'),
    Answer.new(body: 'Yes', correct: true)
  ] },
  { body: 'Had Ruby on Rails been created for design applications?', test: tests[2], answers: [
    Answer.new(body: 'It had been created for desingers.'),
    Answer.new(body: 'No', correct: true),
    Answer.new(body: 'Yes')
  ] },
  { body: 'Could you use JavaScript language in Ruby on Rails framework?', test: tests[2], answers: [
    Answer.new(body: 'Next question :D'),
    Answer.new(body: 'No'),
    Answer.new(body: 'Yes', correct: true)
  ] }
])
