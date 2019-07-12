# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# SEEDS:

15.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  activated = true
  User.create!(name:                      name,
               email:                    email,
               activated:            activated,
               password:              password,
               password_confirmation: password)

end
