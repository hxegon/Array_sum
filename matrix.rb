#!/usr/bin/ruby
# by Cooper LeBrun
# no syntactic errors
# but output is blank
dir_arr = Dir.glob("*.txt")  #=> ["array", "of.txt", "files_NAMES']
output_hash = {}
dir_arr.each do |list|
    File.foreach(list, 'r') do |line|
        if (output_hash.keys.include? line) == false
            output_hash = output_hash.merge(line=> 0)
        else
            output_hash[line] += 1
        end
    end
end
output_hash = output_hash.sort_by {|key, val| val}.reverse
output_hash.each do |key, value|
    if value == 0
        output_hash.delete(key)
    end
end
output_hash.each { |pair| if pair == 0; pair = nil }
output_hash = output_hash.compact
puts "enter output dir:"
output_file = File.open(gets.chomp, 'w')
output_hash.keys.each { |string| output_file.print(string) }
output_file.close
puts "Done!"
