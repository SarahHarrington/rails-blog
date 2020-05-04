#Create a sample user
User.create(name: 'Example User',
            email: 'sarah@sarahdoes.tech',
            password: 'foobar',
            password_confirmation: 'foobar',
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

10.times do
  full_name = Faker::FunnyName.two_word_name
  email = Faker::Internet.safe_email(name: full_name)
  password = "password"
  User.create!( name: full_name,
                email: email,
                password: password,
                password_confirmation: password,
                activated: true,
                activated_at: Time.zone.now)
end

10.times do
  title = Faker::Hipster.sentence(word_count: 3, random_words_to_add: 3)
  text_body = Faker::Hipster.paragraph(sentence_count: 5, random_sentences_to_add: 3)
  the_article = Article.create!(  title: title,
                    text: text_body)
  randomNumber = rand 4;
  randomNumber.times do
    commenter = Faker::FunnyName.two_word_name
    comment = Faker::Hipster.sentence(word_count: 3, random_words_to_add: 3)
    Comment.create!(commenter: commenter, body: comment, article_id: the_article.id)
  end
end
