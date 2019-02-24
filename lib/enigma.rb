class Enigma
  attr_reader :message,
              :total_offset

  def initialize(message)
    @message = message
    @total_offset = total_offset
  end

  def generate_offset
      offset = OffsetGenerator.new
      offset.generate_key_offset
      offset.generate_date_offset
      offset.generate_total_offset
      @total_offset = offset.total_offset
  end

end
