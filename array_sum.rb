class Array_Sum

  attr_reader :sum, :raw_items

  def initialize *arrays
    @raw_items = arrays.flatten
    @sum = Hash.new(0)
    set_sum @raw_items
  end

  def << *arrays
    array = arrays.flatten!
    @raw_items << arrays
    @raw_items.flatten!
    set_sum array
  end

  def set_sum array
    array.each do |item|
        @sum[item] += 1
    end
  end

end
