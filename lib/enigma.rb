class Enigma

  attr_reader :message,
              :total_offset,
              :encryption_chars,
              :cypher_text

  def initialize(message)
    @message = message
    @total_offset = total_offset
    @encryption_chars = encryption_chars
    @cypher_text = cypher_text
  end

  def generate_offset
      offset = OffsetGenerator.new
      offset.generate_key_offset
      offset.generate_date_offset
      offset.generate_total_offset
      @total_offset = offset.total_offset
  end

  def generate_predetermined_offset(key, date)
    offset = OffsetGenerator.new([key], date)
    offset.generate_key_offset
    offset.generate_date_offset
    offset.generate_total_offset
    @total_offset = offset.total_offset
  end

  def encrypt_character(char, shift)
    char_set =
    ["a", "b", "c", "d", "e", "f", "g", "h",
      "i", "j", "k", "l", "m", "n", "o", "p",
      "q", "r", "s", "t", "u", "v", "w", "x",
       "y", "z", " "]
    encrypted = []

     char_set.each do |letter|
         if letter == char.downcase
           index_value = char_set.index(letter)
           char_set.rotate!(shift)
           shifted_character = char_set[index_value]
           encrypted << shifted_character
         end
     end
     encrypted[0]
  end

  def generate_encryption_chars
    msg_char_count = @message.chars.count
    cryptokey_count = (msg_char_count.to_f / total_offset.count).ceil
    keys = Array.new(cryptokey_count, total_offset).flatten
    shaved_keys = keys[0..(msg_char_count - 1)]
    values = @message.chars
    @encryption_chars = values.zip(shaved_keys)
  end

  def encrypt(crypto_set = @encryption_chars)
    char_set =
    ["a", "b", "c", "d", "e", "f", "g", "h",
      "i", "j", "k", "l", "m", "n", "o", "p",
      "q", "r", "s", "t", "u", "v", "w", "x",
       "y", "z", " "]

       encrypted = []

      crypto_set.each do |set|
        char_set.each do |letter|
          if letter == set[0].downcase
              index_value = char_set.index(letter)
              char_set.rotate!(set[1])
              shifted_character = char_set[index_value]
              encrypted << shifted_character
              break
            end
           end
         end
      @cypher_text = encrypted.join
      # binding.pry
  end

end
