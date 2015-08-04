require 'rails_helper'

describe Vote do
  describe "validations" do

    before do
      value1 = Vote.new(value: 1)
      value2 = Vote.new(value: -1)
      value3 = Vote.new(value: 2)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(value1.valid?).to eq(true)
        expect(value2.valid?).to eq(true)
        expect(value3.valid?).to eq(false)
      end
    end
  end
end
