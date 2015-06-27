FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "persona#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
    
    factory :user_with_post_and_comment do
      posts {[FactoryGirl.create(:post)]}
      comments {[FactoryGirl.create(:comment, post: posts.first)]}
      after(:build) do |user|
        user.posts.each { |post| post.user_id = user.id }
        user.comments.each { |comment| comment.user_id = user.id }
      end
    end
  end
end