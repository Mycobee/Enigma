class KeyGenerator
  attr_reader :keys

  def initialize(keys = [])
    @keys = keys
  end

  def generate_key
    if @keys.count < 1
      key = rand(0..10000)
      normalized_key = key.to_s.rjust(5, "0")
      @keys << normalized_key
    else
      return
    end
  end


end
