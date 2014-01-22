require 'spec_helper'

describe Word_Frequency do

  before do
    @wf = Word_Frequency.new
    @attributes = %w[words uniq_words num_of_uniq_words total_words num_of_total_words raw_words]
    @words_array = %w[somewords are in this array somewords are in]
  end

  it 'has expected attributes' do
    @attributes.each do |attr|
      expect { eval "@wf.#{attr}" }.to_not raise_error
    end
  end

  it '#new takes a number of arrays or nothing' do
    expect { Word_Frequency.new }.not_to raise_error
    expect { Word_Frequency.new @words_array }.not_to raise_error
    expect { Word_Frequency.new @words_array, @words_array }.not_to raise_error
  end

  describe '#raw_words' do
    it 'returns an empty array if no words were given' do
      @wf.raw_words.should_not be_nil
      @wf.raw_words.should be_kind_of Array
      @wf.raw_words.should be_empty
    end

    it 'returns a flat array if words is given' do
      @wf.raw_words.should be_kind_of Array
      Word_Frequency.new(@words_array).raw_words.should == @words_array
      Word_Frequency.new(@words_array, @words_array).raw_words.should == [@words_array, @words_array].flatten
    end
  end
end
