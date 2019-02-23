class OffsetGenerator
  attr_reader :total_offset,
              :key,
              :date

  def initialize(key = KeyGenerator.new.generate_key, date = DateGenerator.new.date)
    @total_offset = {}
    @key = key
    @date = date
  end

end
