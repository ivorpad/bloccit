require 'rails_helper'

# RSpec.describe Vote, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Vote do
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
end
