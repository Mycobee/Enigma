require './test/test_helper'
require './lib/key_generator'
require './lib/date_generator'
require './lib/offset_generator'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("Check out this message")
    @enigma2 = Enigma.new("hello world")
    @enigma2.generate_predetermined_offset("02715", "04.08.95")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_message_atribute
    expected = "Check out this message"
    actual = @enigma.message
    assert_equal expected, actual
  end

  def test_generate_offset_adds_to_total_offset_attribute
    actual = @enigma.generate_offset
    expected = @enigma.total_offset
    assert_equal expected, actual
  end

  def test_generate_offset_with_predetermined_key_and_date
   @enigma.generate_predetermined_offset("04761", "25.05.90")
   actual = [12, 48, 76, 61]
   expected = @enigma.total_offset
   assert_equal expected, actual
  end

  def test_encryption_chars_method
    @enigma2.generate_encryption_chars
    expected = [["h", 3], ["e", 27], ["l", 73], ["l", 20],
                ["o", 3], [" ", 27], ["w", 73], ["o", 20],
               ["r", 3], ["l", 27], ["d", 73]]
    actual = @enigma2.encryption_chars
    assert_equal expected, actual
  end


  def test_encrypt_method
    @enigma2.generate_encryption_chars
    assert_equal "keder ohulw", @enigma2.encrypt
  end

  def test_cypher_text_attribute
    @enigma2.generate_encryption_chars
    @enigma2.encrypt
    assert_equal "keder ohulw", @enigma2.cypher_text
  end

  def test_decrypt_method
    enigma3 = Enigma.new("keder ohulw")
    enigma3.generate_predetermined_offset("02715", "04.08.95")
    enigma3.generate_encryption_chars
    enigma3.decrypt
  end
end
