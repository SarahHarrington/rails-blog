#Create a sample user
User.create(name: 'Example User',
            email: 'sarah@sarahdoes.tech',
            password: 'foobar',
            password_confirmation: 'foobar',
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

99.times do
  first_name = Faker::Creature::Cat.name
  last_name = Faker::Creature::Cat.breed
  full_name = first_name + ' ' + last_name
  email = Faker::Internet.safe_email(name: full_name)
  password = "password"
  User.create!( name: full_name,
                email: email,
                password: password,
                password_confirmation: password,
                activated: true,
                activated_at: Time.zone.now)
end