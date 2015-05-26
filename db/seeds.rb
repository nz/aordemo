# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

###
# Create a bunch of fake users
##

require 'faker'
COUNT = 1000
COUNT.times do
  name  = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = Faker::Internet.email(name)
  User.create(
    name:       name,
    email:      email,
    password:   rand(36**20).to_s(36),
    created_at: rand(1.year).seconds.ago
  ).tap do |user|
    puts "Created #{user.name} <#{user.email}>"
  end
end
