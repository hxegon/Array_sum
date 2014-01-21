class Frequency

  def initialize args = {}
    !args[:list].nil? ? @words = args[:list] : @words = ""
  end

  attr_reader :words

  def has_words?
    @words != ""
  end

  def index
    @index = Hash.new(0)
    @words.split("\n").each do |word|
      @index[word.to_sym] += 1
    end
    @index
  end

end
