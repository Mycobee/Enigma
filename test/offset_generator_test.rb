require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/key_generator'
require './lib/date_generator'
require './lib/offset_generator'

class OffsetGeneratorTest < Minitest::Test
  def setup
    @offset_generator = OffsetGenerator.new
    @offset_generator2 = OffsetGenerator.new("04761", "25.05.90")
  end

  def test_it_exists
    assert_instance_of OffsetGenerator, @offset_generator
  end

  def test_it_starts_with_a_random_five_digit_key_by_default
    assert_equal 1, @offset_generator.key.count
    assert_equal 5, @offset_generator.key[0].length
  end

  def test_it_generates_todays_date_in_proper_format_by_default
    actual = @offset_generator.date
    expected = DateTime.now.strftime('%d.%m.%y')
    assert_equal expected, actual
  end

  def test_it_can_be_fed_custom_key_and_date
    assert_equal "04761", @offset_generator2.key
    assert_equal "25.05.90", @offset_generator2.date
  end

  def test_it_can_generate_key_offset
    assert_equal [4, 47, 76, 61], @offset_generator2.generate_key_offset
  end

  def test_it_can_generate_a_date_offset
    assert_equal [8, 1, 0, 0], @offset_generator2.generate_date_offset
  end

  def test_it_can_generate_total_offset_keys_array
    @offset_generator2.generate_key_offset
    @offset_generator2.generate_date_offset
    assert_equal [12, 48, 76, 61], @offset_generator2.generate_total_offset
  end

  

end
