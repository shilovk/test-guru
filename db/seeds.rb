# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_array = %w[Ruby Rails Go HTML].each_with_object([]) do |title, memo|
  memo << { title: title }
end
Rails.logger.debug categories = Category.create(categories_array)

tests_array = categories.each_with_object([]) do |category, memo|
  memo << { title: 'Begin', level: 1, published: true, category_id: category.id }
end
Rails.logger.debug tests = Test.create(tests_array)

questions_array = tests.each_with_object([]) do |test, memo|
  memo << { body: 'Is it frontend', test_id: test.id }
  memo << { body: 'Is it backend', test_id: test.id }
end
Rails.logger.debug questions = Question.create(questions_array)

answers_array = questions.each_with_object([]) do |question, memo|
  memo << { body: 'Yes', question_id: question.id }
  memo << { body: 'No', correct: true, question_id: question.id }
end
Rails.logger.debug Answer.create(answers_array)

users_array = []
users_array << { name: 'Adm', email: 'admin@admin.ru', password: 'adm', admin: true }
users_array << { name: 'Tom', email: 'tom@tom.ru', password: 'tom' }
users_array << { name: 'Jerry', email: 'jerry@jerry.ru', password: 'jerry' }
Rails.logger.debug users = User.create(users_array)

results_array = users.each_with_object([]) do |user, memo|
  tests.each do |test|
    memo << { value: rand(1..2), test_id: test.id, user_id: user.id }
  end
end
Rails.logger.debug Result.create(results_array)
