require 'faker'

new_post = nil

# Create Post
post_hash = {
  title: "A uniquely titled post", 
  body: "There can only be one!"
}

if !Post.any?{|post| post.title == post_hash[:title]}
  new_post = Post.create!(post_hash)
  puts "Unique post created"
else
  puts "Post already exists. No post created"
end

# Create Comment
comment_hash = {
  post: new_post, 
  body: "Wow, I haven't read this one before."
}

if !Comment.any?{|comment| comment.body == comment_hash[:body]}
  Comment.create!(comment_hash)
  puts "Unique comment created"
else
  puts "Comment already exists.  No comment created"
end