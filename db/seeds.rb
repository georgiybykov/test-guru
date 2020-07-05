# frozen_string_literal: true

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'UX/UI' },
                                { title: 'Q&A' },
                                { title: 'Managment' }
                              ])

users = User.create!([
                       { email: 'dev.projects@mail.ru', type: 'Admin', first_name: 'True', last_name: 'Admin', password: 'checkmyproject', password_confirmation: 'checkmyproject' },
                       { email: 'admin1@email.com', type: 'Admin', first_name: 'adminname1', last_name: 'LosSantos', password: 'adminpassword1', password_confirmation: 'adminpassword1' },
                       { email: 'admin2@email.com', type: 'Admin', first_name: 'adminname2', last_name: 'SantosLos', password: 'adminpassword2', password_confirmation: 'adminpassword2' },
                       { email: 'admin3@email.com', type: 'Admin', first_name: 'adminname3', last_name: 'Santos', password: 'adminpassword3', password_confirmation: 'adminpassword3' },
                       { email: 'test@email.com', password: 'testpassword', password_confirmation: 'testpassword' },
                       { email: 'test2@email.com', password: 'testpassword2', password_confirmation: 'testpassword2' },
                       { email: 'test3@email.com', password: 'testpassword3', password_confirmation: 'testpassword3' },
                       { email: 'test4@email.com', password: 'testpassword4', password_confirmation: 'testpassword4' },
                       { email: 'test5@email.com', password: 'testpassword5', password_confirmation: 'testpassword5' },
                       { email: 'test6@email.com', password: 'testpassword6', password_confirmation: 'testpassword6' },
                       { email: 'test7@email.com', password: 'testpassword7', password_confirmation: 'testpassword7' }
                     ])

tests = Test.create!([
                       { title: 'Beginner', level: 0, presence: true, category: categories[0], author: users[7] },
                       { title: 'Middle', level: 1, presence: true, category: categories[1], author: users[8] },
                       { title: 'Advanced', level: 2, presence: true, category: categories[2], author: users[9] },
                       { title: 'Special', level: 3, presence: true, category: categories[3], author: users[8] },
                       { title: 'Ruby Test', level: 4, presence: true, category: categories[4], author: users[9] },
                       { title: 'Work Flow', level: 5, presence: true, category: categories[5], author: users[7] },
                       { title: 'Git WorkFlow', level: 7, presence: true, category: categories[6], author: users[7] }
                     ])

TestPassage.create!([
                      { test: tests[0], user: users[0] },
                      { test: tests[1], user: users[1] },
                      { test: tests[2], user: users[2] },
                      { test: tests[3], user: users[3] },
                      { test: tests[4], user: users[4] },
                      { test: tests[5], user: users[5] }
                    ])

Question.create!([
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
                   ] },

                   { body: 'What is Assets Pipeline?', test: tests[3], answers: [
                     Answer.new(body: 'It is mechanism defined for routing.'),
                     Answer.new(body: 'The asset pipeline provides a framework to concatenate and minify or compress JavaScript and CSS assets.', correct: true),
                     Answer.new(body: 'It is engine to render Rails views.')
                   ] },

                   { body: 'What is Permutation?', test: tests[3], answers: [
                     Answer.new(body: 'It is the technic for getting triangle square.'),
                     Answer.new(body: 'A permutation is a result of combining two imaginary squared numbers.'),
                     Answer.new(body: 'A permutation of a set is an arrangement of its members into a sequence or linear order, or if the set is already ordered, a rearrangement of its elements.', correct: true)
                   ] },

                   { body: 'What is ActionPack?', test: tests[4], answers: [
                     Answer.new(body: 'ActionPack is a gem bundled with Rails that consists of the Action_dispatch and Action_controller modules.', correct: true),
                     Answer.new(body: 'Rails Application module to define global namespace for classes.'),
                     Answer.new(body: 'New version of ActionView gem which is not bundled in Rails by default.')
                   ] },

                   { body: 'What is ActiveRecord?', test: tests[4], answers: [
                     Answer.new(body: 'New model for testing Rails applications.'),
                     Answer.new(body: 'ActiveRecord is a design pattern that maps your objects to a relational database.', correct: true),
                     Answer.new(body: 'ActiveRecord is a gem for create new routes in Rails applications.')
                   ] },

                   { body: 'Which style of team development does exist?', test: tests[5], answers: [
                     Answer.new(body: 'Agile web-development.', correct: true),
                     Answer.new(body: 'Mavericks team observation.'),
                     Answer.new(body: 'System of Glen Belmor planning.')
                   ] },

                   { body: 'What is CI?', test: tests[5], answers: [
                     Answer.new(body: 'Cosmic Invisibility'),
                     Answer.new(body: 'Command Inheritance'),
                     Answer.new(body: 'Continuous Integration', correct: true)
                   ] },

                   { body: 'How to switch to another branch?', test: tests[6], answers: [
                     Answer.new(body: 'git branch -d <branch_name>'),
                     Answer.new(body: 'git checkout <branch_name>', correct: true),
                     Answer.new(body: 'git checkout -b <branch_name>')
                   ] },

                   { body: 'How to get files from stash?', test: tests[6], answers: [
                     Answer.new(body: 'git stash pop', correct: true),
                     Answer.new(body: 'git stash remove'),
                     Answer.new(body: 'git stash -p <branch_name>')
                   ] }
                 ])
