#!/usr/bin/ruby
# by Cooper LeBrun
# no syntactic errors at this version
dir_arr = Dir.glob("*.txt")  #=> ["array", "of.txt", "files_NAMES']
output_hash = {}
dir_arr.each do |list|
    File.foreach(list, 'r') do |line|
        if (output_hash.keys.include? line.chomp) == false
            output_hash.merge(line.chomp => 0)
        else
            output_hash[line.chomp] += 1
        end
    end
end
#puts output_hash
output_hash = output_hash.sort_by {|key, val| val}.reverse
#puts output_hash
output_hash.each do |key, value|
    if value == 0
        output_hash.delete(key)
    end
end
#puts output_hash
output_hash = output_hash.to_a
output_hash = output_hash.each do |arr|
    if arr[1] == 0
        arr = Nil
    else
        arr = "#{arr[0]}"
    end
end
output_hash = output_hash.compact 
#puts output_hash
puts "enter output dir:"
output_file = File.open(gets.chomp, 'w')
output_hash.each do |string|
    output_file.puts(string)
end
output_file.close
puts "Done!"
