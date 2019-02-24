class OffsetGenerator
  attr_reader :total_offset,
              :key,
              :date

  def initialize(key = KeyGenerator.new.generate_key, date = DateGenerator.new.date)
    @total_offset = []
    @key = key
    @date = date
    @key_offset = []
    @date_offset = []
  end

  def generate_key_offset
    a = (@key[0][0] + @key[0][1]).to_i
    b = (@key[0][1] + @key[0][2]).to_i
    c = (@key[0][2] + @key[0][3]).to_i
    d = (@key[0][3] + @key[0][4]).to_i
    @key_offset = [a, b, c, d]
  end

  def generate_date_offset
    date_num =
    @date[0] + @date[1] + @date[3] + @date[4] + @date[6] + @date[7]

    square_date = date_num.to_i ** 2
    date_characters = square_date.to_s.slice(-4..-1)
    @date_offset = date_characters.chars.map {|char| char.to_i}
  end

  def generate_total_offset
    offset_keys = @key_offset.zip(@date_offset)
    @total_offset = offset_keys.map {|key| key.sum}
  end

end
