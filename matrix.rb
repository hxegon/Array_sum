#!/usr/bin/env ruby
# by Cooper LeBrun

output_hash = Hash.new(0)

def input_to_hash_from_files(input, output)
    # read lines from arbitrary number of .txt files and output them to a hash (hash = Hash.new(0)) if key is already in hash, value of key +=1
    input.each do |list|
        File.foreach(list, 'r') {|line| output[line] += 1}
    end
end

#print output_hash

def sort_hash_greatest_to_least
    # sort the hash keys from greatest to least value
    output_hash = output_hash.sort_by {|k, v| v}.reverse
end

def delete_0_value_pairs(hash)
    # sort out pairs with a 0 value
    hash.each do |key, value|
        if value == 0
            hash.delete!(key)
        end
    end
end

def output_hash_keys_toFile(hash)
    # write the keys from a hash to a user named file line by line
    puts "enter output file name:"
    output_file = File.open(gets.chomp, 'w')
    hash.each do |string| 
        output_file.print(string[0])
    end
    output_file.close
    puts "Done!"
end

dir_arr = Dir.glob("*.txt")  #=> ["get", "array", "of.txt", "files_NAMES", "in", "current_dir"]
output_hash = Hash.new(0)

