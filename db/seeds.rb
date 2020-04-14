categories = Category.create!([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'UX/UI' }]
)

tests = Test.create!([
  { title: 'HTML', level: 0, presence: true, category_id: categories[1].id },
  { title: 'Ruby', level: 1, presence: true, category_id: categories[0].id },
  { title: 'Rails', level: 2, presence: true, category_id: categories[0].id },
  { title: 'Visual Studio', level: 1, presence: true, category_id: categories[2].id },
  { title: 'Java', level: 5, presence: true, category_id: categories[0].id }
])

questions = Question.create!([
  { body: 'Is it frontend?', test_id: tests[0].id },
  { body: 'Is it backend?', test_id: tests[1].id },
  { body: 'Is it backend?', test_id: tests[2].id },
  { body: 'Is it user experience?', test_id: tests[3].id },
  { body: 'Is it backend?', test_id: tests[4].id }
])

answers = Answer.create!([
  { body: 'Yes', correct: true, question_id: questions[0].id },
  { body: 'No', question_id: questions[1].id },
  { body: 'Yes', correct: true, question_id: questions[2].id },
  { body: 'No', question_id: questions[3].id },
  { body: 'Yes', correct: true, question_id: questions[4].id }
])

results = Result.create!([
  { score: 1, answer_id: answers[0].id },
  { score: 0, answer_id: answers[1].id },
  { score: 1, answer_id: answers[2].id },
  { score: 0, answer_id: answers[3].id },
  { score: 1, answer_id: answers[4].id }
])

user = User.create!([
  { name: 'TestName', email: 'test@email.com', password_digest: 'TestPassword' },
  { name: 'TestName1', email: 'test1@email.com', password_digest: 'TestPassword1' },
  { name: 'TestName2', email: 'test2@email.com', password_digest: 'TestPassword2' }
])
