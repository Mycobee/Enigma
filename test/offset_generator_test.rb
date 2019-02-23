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

  def test_it_generates_todays_date_in_proper_format_by_default
    actual = @offset_generator.date
    expected = DateTime.now.strftime('%d.%m.%y')
    assert_equal expected, actual
  end

  def test_it_can_be_fed_custom_key_and_date
    offset_generator3 = OffsetGenerator.new("04761", "25.05.90")
    assert_equal "04761", offset_generator3.key
    assert_equal "25.05.90", offset_generator3.date
  end
end
