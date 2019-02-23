class KeyGenerator
  attr_reader :key

  def initialize(key = [])
    @key = key
  end

  def generate_key
    if @key.count < 1
      new_key = rand(0..10000)
      normalized_key = new_key.to_s.rjust(5, "0")
      @key << normalized_key
    else
      return
    end
  end


end
