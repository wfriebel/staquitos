100.times do
  name = Faker::Internet.user_name
  password = "123"
  User.create!(username: name, password: password)
end

300.times do
  title = Faker::Commerce.department(4)
  content = Faker::Company.catch_phrase + "?"
  user_id = rand(1..100)
  Question.create!(title: title, content: content, user_id: user_id)
end

1000.times do
  content = Faker::Lorem.sentence(5)
  question_id = rand(1..300)
  user_id = rand(1..100)
  Answer.create!(content: content, question_id: question_id, user_id: user_id)
end
