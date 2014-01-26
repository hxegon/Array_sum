class Array_Sum

  attr_reader :sum, :raw_items

  def initialize *arrays
    @raw_items = arrays.flatten
    @sum = Hash.new(0)
    @raw_items.each do |item|
        @sum[item] += 1
    end
  end

  def << *arrays
    @raw_items << arrays.flatten
    @raw_items.flatten!
  end

end
