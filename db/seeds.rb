# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "faker"

# create posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

# create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

# Assignment 32

posts_seeded = [
  { title: "Sample 1", body: "Sample 1 body" }
]

posts_seeded.each do |seeded|
  Post.where(seeded).first_or_create
end

comments_seeded = [
  { title: "Comment Sample 1", body: "Comment Sample 1 body" }
]

posts_seeded.each do |c_seeded|
  Post.where(c_seeded).first_or_create
end

puts "Seeds finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
