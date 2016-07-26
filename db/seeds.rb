old_users = User.all
old_users.each do |user|
  user.destroy
end

old_questions = Comment.all
old_questions.each do |question|
  question.destroy
end

old_answers = Answer.all
old_answers.each do |answer|
  answer.destroy
end

old_comments = Comment.all
old_comments.each do |comment|
  comment.destroy
end

10.times do
  name = Faker::Internet.user_name
  password = "123"
  User.create!(username: name, password: password)
end

users = User.all

50.times do
  title = Faker::Commerce.department(4)
  content = Faker::Company.catch_phrase + "?"
  user_id = users.sample.id
  Question.create!(title: title, content: content, user_id: user_id)
end

questions = Question.all

150.times do
  content = Faker::Lorem.sentence(5)
  question_id = questions.sample.id
  user_id = users.sample.id
  Answer.create!(content: content, question_id: question_id, user_id: user_id)
end

300.times do
  content = Faker::Lorem.sentence(5)
  Comment.create!(content: content)
end