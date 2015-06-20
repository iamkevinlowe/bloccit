require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
    )
end
posts = Post.all

100.times do
  Comment.create!(
    post:   posts.sample,
    body:   Faker::Lorem.paragraph
    )
end

20.times do
  Advertisement.create!(
    title:  Faker::Lorem.sentence,
    copy:   Faker::Lorem.paragraph,
    price:  rand(100)
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"