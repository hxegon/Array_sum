class Array

  attr_reader :sum
  
  def sum
    @sum = Hash.new(0)
    self.flatten.each do |item|
        @sum[item] += 1
    end
    @sum
  end

end
