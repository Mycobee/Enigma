class OffsetGenerator
  attr_reader :total_offset,
              :key,
              :date

  def initialize(key = KeyGenerator.new.generate_key, date = DateGenerator.new.date)
    @total_offset = {}
    @key = key
    @date = date
  end

  def generate_key_offset
    a = (@key[0] + @key[1]).to_i
    b = (@key[1] + @key[2]).to_i
    c = (@key[2] + @key[3]).to_i
    d = (@key[3] + @key[4]).to_i
   key_offset = [a, b, c, d]
  end

end
