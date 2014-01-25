class Array_Sum

  attr_reader :sum, :raw_items

  def initialize *item_lists
    @raw_items = item_lists.flatten
    @sum = Hash.new(0)
    @raw_items.each do |item|
        @sum[item] += 1
    end
  end

end
