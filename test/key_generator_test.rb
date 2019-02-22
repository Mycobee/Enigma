require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def setup
    @key_generator = KeyGenerator.new
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @key_generator
  end

  def test_it_starts_with_an_empty_array_of_keys
    assert_equal [], @key_generator.keys
  end

  def test_it_will_generate_a_key
    @key_generator.generate_key
    assert_equal 1, @key_generator.keys.count
  end

  def test_it_wont_generate_more_than_one_key
    @key_generator.generate_key
    @key_generator.generate_key
    assert_equal 1, @key_generator.keys.count
  end




end
