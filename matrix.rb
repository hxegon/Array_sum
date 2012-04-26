#!/usr/bin/env ruby
# by Cooper LeBrun
# no syntactic errors
# but output is blank
dir_arr = Dir.glob("*.txt")  #=> ["array", "of.txt", "files_NAMES']

output_hash = Hash.new(0)

output_hash = output_hash.sort_by {|k, v| v}.reverse
output_hash.each do |key, value|
    if value == 0
        output_hash.delete(key)
    end
end

output_hash.each { |pair| if pair == 0; pair = nil; end }
output_hash = output_hash.compact
puts "enter output file:"
output_file = File.open(gets.chomp, 'w')
output_hash.each do |string| 
    output_file.print(string[0])
end
output_file.close
puts "Done!"
