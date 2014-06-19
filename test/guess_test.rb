gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_it_can_accept_a_users_guess
    @attempt = Guess.new('rryb')
  end

    def test_it_recognizes_if_guess_is_too_short
    attempt = Guess.new("rry")
    attempt.valid_length?

    refute attempt.valid_length?
  end

  def test_it_recognizes_if_guess_is_too_long
    attempt = Guess.new("rrygr")
    attempt.valid_length?

    refute attempt.valid_length?
  end

  def test_it_recognizes_if_guess_has_valid_length
    attempt = Guess.new("rryg")
    attempt.valid_length?

    assert attempt.valid_length?
  end

  # def test_it_recognizes_if_guess_has_only_valid_characters
  #   attempt = Guess.new('rgyb')
  #   attempt.valid_characters?
  #
  #   assert attempt.valid_characters?
  # end

  def test_it_recognizes_if_guess_has_invalid_characters
    attempt = Guess.new('rngy')
    attempt.valid_characters?

    refute attempt.valid_characters?
  end
end
