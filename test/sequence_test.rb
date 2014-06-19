gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence'
require './lib/sequence_generator'

class SequenceTest < Minitest::Test
  def test_it_holds_a_sequence
    SequenceGenerator.new.generate

    assert @secret = SequenceGenerator.new.generate
  end
end
