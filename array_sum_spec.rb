require 'spec_helper'

describe Array_Sum do

  before do
    @a = Array_Sum.new
    @attributes = %w[sum raw_items]
    @items = %w[someitems are in this array someitems are in]
  end

  it 'has expected attributes' do
    @attributes.each do |attr|
      expect { eval "@a.#{attr}" }.to_not raise_error
    end
  end

  it '#new takes a number of arrays or nothing' do
    expect { Array_Sum.new }.not_to raise_error
    expect { Array_Sum.new @items }.not_to raise_error
    expect { Array_Sum.new @items, @items }.not_to raise_error
  end

  describe '#raw_items' do
    it 'returns an empty array if no words were given' do
      @a.raw_items.should_not be_nil
      @a.raw_items.should be_kind_of Array
      @a.raw_items.should be_empty
    end

    it 'returns a flat array if words is given' do
      @a.raw_items.should be_kind_of Array
      Array_Sum.new(@items).raw_items.should == @items
      Array_Sum.new(@items, @items).raw_items.should == [@items, @items].flatten
    end
  end
end
