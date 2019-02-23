require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/key_generator'
require './lib/date_generator'
require './lib/offset_generator'

class OffsetGeneratorTest < Minitest::Test
  def setup
    @offset_generator = OffsetGenerator.new
  end

  def test_it_exists
    assert_instance_of OffsetGenerator, @offset_generator
  end

  def test_it_starts_with_a_random_five_digit_key_by_default
    assert_equal 1, @offset_generator.key.count
    assert_equal 5, @offset_generator.key[0].length
  end

end
