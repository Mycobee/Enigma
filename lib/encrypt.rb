require 'pry'
require './lib/key_generator'
require './lib/date_generator'
require './lib/offset_generator'
require './lib/enigma'

input_array = ARGV
txt = File.read(input_array[0])
enigma = Enigma.new(txt)

if
  if input_array[2] != nil
   key = input_array[2]
  end

  if input_array[3] != nil
    date = input_array[3]
  end

  enigma.generate_predetermined_offset(key, date)
  enigma.generate_encryption_chars
  enigma.encrypt
  new_file = File.open(input_array[1], 'w')
  new_file.write(enigma.cypher_text)
  puts "Your key is #{enigma.key[0]}

        "
  puts  "Your date is #{enigma.date}

              "

else
  enigma.generate_offset
  enigma.generate_encryption_chars
  enigma.encrypt
  new_file = File.open(input_array[1], 'w')
  new_file.write(enigma.cypher_text)
  puts "Your key is #{enigma.key[0]}

        "
  puts  "Your date is #{enigma.date}

        "
end
