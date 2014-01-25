class Array_Sum

  attr_reader :sum, :raw_items

  def initialize *item_lists
    @raw_items = item_lists.flatten
  end
end
