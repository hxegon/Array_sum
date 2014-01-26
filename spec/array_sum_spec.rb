require 'spec_helper'

describe Array do

  before do
    @a = %w[someitems are in this array someitems are in]
    @b = %w[one two two three three three]
  end

  describe '#sum' do
    it 'returns a hash with unique elements as keys and their counts as values' do
      [@a, @b].each do |array|
        array.sum.should be_kind_of Hash
        array.sum.should_not be_empty
      end

      @a.sum.should == { 'someitems' => 2, 'are' => 2, 'in' => 2, 'this' => 1, 'array' => 1 }
      @b.sum.should == { 'one' => 1, 'two' => 2, 'three' => 3}
    end

    it "handles numbers properly" do
      @c = [1, 1, 3]
      @c.sum.should == { 1 => 2, 3 => 1 }
    end
  end
end
