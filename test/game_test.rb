gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/guess'

class GameTest < Minitest::Test
  def test_new_game_initializes_a_new_sequence
    game = Game.new

    assert Sequence.new
  end

  def test_it_accepts_a_players_guess
    current_guess = Guess.new('rgby')

    assert @guess_history = 'rgby'
  end

  def test_it_checks_that_guess_is_valid
    current_guess = Guess.new('rgbyr')
    refute current_guess.valid_length?

    current_guess = Guess.new('rnby')
    refute current_guess.valid_characters?
  end
end
