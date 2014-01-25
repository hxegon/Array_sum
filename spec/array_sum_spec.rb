require 'spec_helper'

describe Array_Sum do

  before do
    @a = Array_Sum.new
    @attributes = %w[sum raw_items]
    @items_a = %w[someitems are in this array someitems are in]
    @items_b = %w[one two two three three three]
  end

  it 'has expected attributes' do
    @attributes.each do |attr|
      expect { eval "@a.#{attr}" }.to_not raise_error
    end
  end

  it '#new takes a number of arrays or nothing' do
    expect { Array_Sum.new }.not_to raise_error
    expect { Array_Sum.new @items_a }.not_to raise_error
    expect { Array_Sum.new @items_a, @items_a }.not_to raise_error
  end

  describe '#raw_items' do
    it 'returns an empty array if no words were given' do
      @a.raw_items.should_not be_nil
      @a.raw_items.should be_kind_of Array
      @a.raw_items.should be_empty
    end

    it 'returns a flat array if words is given' do
      @a.raw_items.should be_kind_of Array
      Array_Sum.new(@items_a).raw_items.should == @items_a
      Array_Sum.new(@items_a, @items_a).raw_items.should == [@items_a, @items_a].flatten
    end
  end

  describe '#sum' do
    it 'returns a hash with unique elements as keys and their counts as values' do
      @a_a, @a_b = Array_Sum.new(@items_a), Array_Sum.new(@items_b)

      [@a_a, @a_b].each do |a|
        a.sum.should be_kind_of Hash
        a.sum.should_not be_empty
      end

      @a_a.sum.should == { 'someitems' => 2, 'are' => 2, 'in' => 2, 'this' => 1, 'array' => 1 }
      @a_b.sum.should == { 'one' => 1, 'two' => 2, 'three' => 3}
    end

    it "handles numbers properly" do
      expect { @a_c = Array_Sum.new [1, 1, 3] }.not_to raise_error
      @a_c.sum.should == { 1 => 2, 3 => 1 }
    end
  end
end
