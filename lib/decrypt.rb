require 'pry'
require './lib/key_generator'
require './lib/date_generator'
require './lib/offset_generator'
require './lib/enigma'

input_array = ARGV
txt = File.read(input_array[0])
enigma = Enigma.new(txt)
key = input_array[2]
date = input_array[3]
enigma.generate_predetermined_offset(key, date)
enigma.generate_encryption_chars
enigma.decrypt
new_file = File.open(input_array[1], 'w')
new_file.write(enigma.cypher_text)
puts "Your key is #{key}

      "
puts "Your date is #{date}

      "
