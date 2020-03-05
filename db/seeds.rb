#Create a sample user
User.create(name: 'Example User',
            email: 'sarah@sarahdoes.tech',
            password: 'foobar',
            password_confirmation: 'foobar')

99.times do
  first_name = Faker::Creature::Cat.name
  last_name = Faker::Creature::Cat.breed
  email = Faker::Internet::email(name: first_name)
  password = "password"
  User.create!( name: first_name + ' ' + last_name,
                email: email,
                password: password,
                password_confirmation: password)
end