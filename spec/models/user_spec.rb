  require 'rails_helper'

  describe User do

    include TestFactories

    describe "#favorited(post)" do

      before do
        @user = authenticated_user
        @post = associated_post
      end

      it "returns `nil` if the user has not favorited the post" do
        expect(@user.favorited(@post)).to be_nil
      end

      it "returns the appropiate favorite if it exists" do
          favorite = @user.favorites.create(post: @post)
          expect(@user.favorited(@post)).to eq(favorite)
      end
    end

    describe ".top_rated" do

      before do
        @user1 = create(:user_with_post_and_comment)
        post = @user1.posts.first


        @user2 = create(:user_with_post_and_comment)
        post = @user2.posts.first
        create(:comment, user: @user2, post: post)
      end


      it "returns users ordered by comments + posts" do
        expect( User.top_rated ).to eq([@user2, @user1])
      end

      it "stores a `post_count` on user" do
        users = User.top_rated
        expect( users.first.posts_count ).to eq(1)
      end

      it "stores a `comments_count` on user" do
        users = User.top_rated
        expect( users.first.comments_count ).to eq(2)
      end
    end
  end
