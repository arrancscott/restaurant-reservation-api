# frozen_string_literal: true

user = User.create(
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  role: 'admin'
)

p "Email: #{user.email}"
p "Token: #{user.authentication_token}"
