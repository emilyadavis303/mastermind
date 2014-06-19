gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_matcher'

class SequenceMatcherTest < Minitest::Test
  def test_it_accepts_a_secret_sequence
    matcher = SequenceMatcher.new('gbry', 'guess')
    assert_equal 'gbry', matcher.sequence
  end

  def test_it_accepts_a_guess_sequence
    matcher = SequenceMatcher.new('sequence', 'yyyy')
    assert_equal 'yyyy', matcher.guess
  end

  def test_can_determine_if_a_guess_matches_the_secret
    matcher = SequenceMatcher.new('brgy', 'brgy')
    assert matcher.match?

    matcher = SequenceMatcher.new('brgy', 'ygrb')
    refute matcher.match?
  end

  def test_it_can_count_one_matching_letter
    matcher = SequenceMatcher.new('yyyr', 'grgg')
    refute matcher.match?

    assert_equal 1, matcher.match_count
  end

  def test_it_can_count_two_matching_letters
    matcher = SequenceMatcher.new('yybr', 'bgrg')
    refute matcher.match?

    assert_equal 2, matcher.match_count
  end

  def test_it_can_count_three_matching_letters
    matcher = SequenceMatcher.new('ygbr', 'ggbr')
    refute matcher.match?

    assert_equal 3, matcher.match_count
  end

  def test_it_can_count_four_matching_letters
    matcher = SequenceMatcher.new('ygbr', 'brgy')
    refute matcher.match?

    assert_equal 4, matcher.match_count
  end

  def test_it_can_count_four_matching_letters_with_repeats
    matcher = SequenceMatcher.new('yybr', 'bryy')
    refute matcher.match?

    assert_equal 4, matcher.match_count
  end

  def test_it_can_count_one_correct_position
    matcher = SequenceMatcher.new('ybbr', 'ygrb')
    refute matcher.match?

    assert_equal 1, matcher.position_count
  end

  def test_it_can_count_two_correct_positions
    matcher = SequenceMatcher.new('ybbr', 'ybrb')
    refute matcher.match?

    assert_equal 2, matcher.position_count
  end

  def test_it_can_count_three_correct_positions
    matcher = SequenceMatcher.new('ybbr', 'ybbg')
    refute matcher.match?

    assert_equal 3, matcher.position_count
  end

  def test_it_can_count_four_correct_positions
    matcher = SequenceMatcher.new('ygrb', 'ygrb')
    assert matcher.match?

    assert_equal 4, matcher.position_count
  end
end
