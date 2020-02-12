# rubocop:disable all

pp admin = Admin.create!(first_name: 'Admin', last_name: 'Admin', password: '123456',  email: 'testguru2021@gmail.com')
pp user = User.create!(first_name: 'User', last_name: 'User', password: '123456', email: 'shilovk@gmail.com')

pp category = Category.create!(title: 'Ruby')

# test 1 in Ruby

pp test = Test.create!(title: 'First', level: 1, published: true, category_id: category.id, author_id: admin.id)

pp question = Question.create!(body: 'Is it frontend language?', test_id: test.id)
pp answer1 = Answer.create!(body: 'Yes', correct: false, question_id: question.id)
pp answer2 = Answer.create!(body: 'No', correct: true, question_id: question.id)

pp question = Question.create!(body: 'Is it backend language?', test_id: test.id)
pp answer1 = Answer.create!(body: 'Yes', correct: true, question_id: question.id)
pp answer2 = Answer.create!(body: 'No', correct: false, question_id: question.id)

pp question = Question.create!(body: 'Who is author?', test_id: test.id)
pp answer1 = Answer.create!(body: 'Matz', correct: true, question_id: question.id)
pp answer2 = Answer.create!(body: 'Mozart', correct: false, question_id: question.id)
pp gist = Gist.create!(url: 'http://test1.test', user_id: user.id, question_id: question.id)

pp test_passage1 = TestPassage.create!(user_id: user.id, test_id: test.id, correct_questions: 1)
pp test_passage2 = TestPassage.create!(user_id: user.id, test_id: test.id, correct_questions: 3)

# test 1 in Ruby

pp test = Test.create!(title: 'Second', level: 3, published: true, category_id: category.id, author_id: admin.id)

pp question = Question.create!(body: 'Is it a object oriented language', test_id: test.id)
pp answer1 = Answer.create!(body: 'Yes', correct: true, question_id: question.id)
pp answer2 = Answer.create!(body: 'No', correct: false, question_id: question.id)

pp question = Question.create!(body: 'Can be metaprogramming?', test_id: test.id)
pp answer1 = Answer.create!(body: 'Yes', correct: true, question_id: question.id)
pp answer2 = Answer.create!(body: 'No', correct: false, question_id: question.id)
pp gist = Gist.create!(url: 'http://test2.test', user_id: user.id, question_id: question.id)

pp test_passage1 = TestPassage.create!(user_id: user.id, test_id: test.id, correct_questions: 1)
pp test_passage2 = TestPassage.create!(user_id: user.id, test_id: test.id, correct_questions: 3)

# rubocop:enable all
