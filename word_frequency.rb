class Word_Frequency

  attr_reader :words, :raw_words
  attr_reader :uniq_words, :num_of_uniq_words
  attr_reader :total_words, :num_of_total_words

  def initialize *word_lists
    @raw_words = word_lists.flatten
  end
end
