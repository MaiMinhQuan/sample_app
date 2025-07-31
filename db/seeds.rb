User.create!(
  name: "Mai Minh Quan",
  email: "maiminhquan@gmail.com",
  password: "123",
  password_confirmation: "123",
  birthday: 20.years.ago.to_date,
  gender: :male,
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

100.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    gender: User.genders.keys.sample,
    activated: true,
    activated_at: Time.zone.now
  )
end
