#!/usr/bin/env ruby
# by Cooper LeBrun

# A word_list here is any plain txt file formatted to have one word, with no
# spaces, per line.
#
# maybe make a freq_hash object?

def make_hash_from_list(word_list)
  freq_hash = Hash.new(0)
  word_list.each do |file|
    IO.foreach(file) {|line| freq_hash[line.chomp] += 1}
  end
  freq_hash # Is this needed?
end

def sort_hash_greatest_to_least(freq_hash)
  # sort the hash keys from greatest to least val
  freq_hash = freq_hash.sort_by {|k, v| v}.reverse
end

def delete_0_value_pairs(freq_hash)
  freq_hash.each do |key, value|
    freq_hash.delete!(key) if value == 0
  end
end

def output_hash_keys_to_file(hash)
  # write the keys from a hash to a user named file line by line
  puts "enter output file name:"
  output_file = File.open(gets.chomp, 'w')
  hash.each do |k,v| 
    output_file.puts(k.to_s)
  end
  output_file.close
  puts "Done!"
end

def matrix_gen
  output_hash = make_hash_from_list(Dir.glob('*.txt'), output_hash)
  output_hash = sort_hash_greatest_to_least(output_hash)
  output_hash.delete_if {|k,v| v <= 1}
  output_hash_keys_toFile(output_hash) 
end

matrix_gen
