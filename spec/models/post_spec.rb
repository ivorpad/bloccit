require 'rails_helper'

  describe Post do
    describe "vote methods" do
      before do
        # we call the Active Record create method on Post and assign it to the @post instance variable
        @post = Post.create(title: 'post title', body: 'post body')
        3.times do { @post.votes.create(value: 1) }
        2.times do { @post.votes.create(value: -1) }
      end

      describe "#up_votes" do
        it "should count the number of votes with value = 1" do
          expect( @post.up_votes ).to eq(3)
        end
      end

      describe '#down_votes' do
       it "should count the number of votes with value = -1" do
         expect( @post.down_votes ).to eq(2)
       end
     end

     describe '#points' do
       it "should return the sum of all down and up votes" do
         expect( @post.points ).to eq(1) # 3 - 2
       end
     end

    end
  end # describe Post
