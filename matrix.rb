#!/usr/bin/ruby
puts "input folder where dicts, dumps, etc are:"
dir_arr = `ls #{gets.chomp}`.split
#origin_path = gets.chomp
#dir_arr = `ls #{origin_path}`.split
#dir_arr = dir_arr.map do |file|
#    file = origin_path + file
#end
output_hash = {}
dir_arr.each do |list|
    list = File.open(list, 'r')
    list.each do |line|
        if output_hash.keys.include? line.chomp == False
            output_hash.merge(line.chomp => 0)
        else
            output_hash[line.chomp] += 1
        end
    list.close
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
#puts output_hash
puts "enter output dir:"
output_file = File.open(gets.chomp, 'w')
output_hash.each do |string|
    output_file.puts(string)
end
output_file.close
puts "Done!"
