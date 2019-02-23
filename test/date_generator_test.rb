require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/key_generator'
require './lib/date_generator'


class DateGeneratorTest < Minitest::Test
  def setup
    # binding.pry
    @date_generator = DateGenerator.new
  end

  def test_it_exists
    assert_instance_of DateGenerator, @date_generator
  end

  def test_it_generates_a_current_date
    assert_equal DateTime.now.strftime('%d.%m.%y'), @date_generator.date
  end
end
