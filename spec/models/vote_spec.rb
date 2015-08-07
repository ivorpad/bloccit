require 'rails_helper'

describe Vote do

  include TestFactories

  describe 'validations' do
    describe 'value validation' do
      it 'only allows -1 or 1 as values' do
        value1 = Vote.new(value: 1)
        value2 = Vote.new(value: -1)
        value3 = Vote.new(value: 2)

        expect(value1.valid?).to eq(true)
        expect(value2.valid?).to eq(true)
        expect(value3.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end

end
