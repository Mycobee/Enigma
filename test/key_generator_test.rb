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
    assert_equal [], @key_generator.key
  end




end
