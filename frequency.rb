class Frequency
  def initialize args = {}
    !args[:list].nil? ? @words = args[:list] : @words = {}
  end

  attr_reader :words

  def has_words?
    @words != {}
  end

end
