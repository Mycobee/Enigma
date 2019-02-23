class OffsetGenerator
  attr_reader :total_offset,
              :key

  def initialize(key = KeyGenerator.new.generate_key)
    @total_offset = total_offset
    @key = key

  end

end
