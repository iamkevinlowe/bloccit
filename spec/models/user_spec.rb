require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do

    before do
      @user = authenticated_user
      @post = associated_post
      @other_post = associated_post
      @user.favorites.build(post: @post).save
    end

    it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorited(@other_post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      expect(@user.favorited(@post)).to eq(Favorite.last)
    end
  end
end