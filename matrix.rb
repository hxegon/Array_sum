#!/usr/bin/env ruby
# by Cooper LeBrun

def input_to_hash_from_files(input, output)
    # takes input array of txt file nams and outputs them to a hash key line by line, and if a key repeats then its value += 1 !
    input.each do |list|
        IO.foreach(list) {|line| output[line.chomp] += 1}
    end
    return output
end

def sort_hash_greatest_to_least(hash)
    # sort the hash keys from greatest to least value ?
    hash = hash.sort_by {|k, v| v}.reverse
    return hash
end

def delete_0_value_pairs(hash)
    # sort out pairs with a 0 value ?
    hash.each do |key, value|
        if value == 0
            hash.delete!(key)
        end
    end
end

def output_hash_keys_toFile(hash)
    # write the keys from a hash to a user named file line by line ?
    puts "enter output file name:"
    output_file = File.open(gets.chomp, 'w')
    hash.each do |k,v| 
        output_file.puts(k.to_s)
    end
    output_file.close
    puts "Done!"
end

output_hash = Hash.new(0)

output_hash = input_to_hash_from_files(Dir.glob('*.txt'), output_hash)
print output_hash
output_hash = sort_hash_greatest_to_least(output_hash)
output_hash.delete_if {|k,v| v <= 1}
output_hash_keys_toFile(output_hash) 
