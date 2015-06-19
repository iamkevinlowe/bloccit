require 'faker'

start_post_count = Post.count
start_comment_count = Comment.count

# Create Post
post_hash = {
  title: "A uniquely titled post", 
  body: "There can only be one!"
}

unique_post = Post.find_or_create_by(post_hash)

# Create Comment
comment_hash = {
  post: unique_post, 
  body: "Wow, I haven't read this one before."
}

Comment.find_or_create_by(comment_hash)

if Post.count > start_post_count
  puts "New post created"
end

if Comment.count > start_comment_count
  puts "New comment created"
end