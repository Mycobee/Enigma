require 'pry'
require './lib/key_generator'
require './lib/date_generator'
require './lib/offset_generator'
require './lib/enigma'


puts "Welcome to Enigma!! Do you wish to encrypt or decrypt.  Enter E or D."
d_or_e = gets.chomp.downcase

if d_or_e == "e"
  puts "Please enter the message you'd like to encrypt."
  message = gets
  enigma = Enigma.new(message)

  puts "Do you know the date and time you want to use? Please enter Y or N"
  answer = gets.upcase.chomp

    if answer ==  "N"
      enigma.generate_offset
      puts "Your key is #{enigma.key[0]}

            "

      puts "Your date is #{enigma.date}

            "

      enigma.generate_encryption_chars
      enigma.encrypt
      puts "Your cypher text is:
            "
      puts enigma.cypher_text
    elsif answer == "Y"
      puts "Please enter the desired 5 digit key"
      key = gets.to_s.downcase
      puts "Please enter the desired date in DD.MM.YY format"
      date = gets.to_s.downcase
      enigma.generate_predetermined_offset(key, date)
      puts "Your key is #{key}
            "
      puts "Your date is #{date}
            "
      enigma.generate_encryption_chars
      enigma.encrypt
      puts "Your cypher text is:
            "
      puts enigma.cypher_text
      puts ""
    else
      puts "Sorry your input was invalid.  Please try again."
    end

  else puts "Please enter your cypher text"
    cypher_text = gets
    puts "Please enter your 5 digit decryption key."
    key = gets.to_s
    puts "Please enter your desired date in DD.MM.YY format"
    date = gets.to_s
    enigma = Enigma.new(cypher_text)
    enigma.generate_predetermined_offset(key, date)
    enigma.generate_encryption_chars
    binding.pry
    enigma.decrypt
    puts "Your decrypted message is :
          "
    puts enigma.cypher_text
end
