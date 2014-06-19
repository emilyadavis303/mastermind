require './lib/sequence_matcher'
require './lib/sequence'
require './lib/guess'

class Game
  attr_reader :guess_history, :master_code, :match_data, :current_guess

  def initialize
    @master_code = Sequence.new
    @guess_history = []
    @current_guess = current_guess
  end

  def guess(input)
    current_guess = Guess.new(input)
    guess_history << current_guess

    SequenceMatcher.new(master_code, current_guess).match_data
  end

  def guess_check(current_guess)
    current_guess = Guess.new(current_guess)
    unless current_guess.valid?
      puts ''
      puts "Not gonna happen homeslice! Guesses must be FOUR characters long and can only contain the letters: 'r', 'b', 'g' and 'y'.\n"
    end
  end

  def feedback_for(match_data)
    puts ''
    unless match_data[:correct_guess]
      puts "You've got #{match_data[:correct_content]} correct letter(s)."
      if match_data[:correct_positions] == 1
        puts "#{match_data[:correct_positions]} of which is in the right position."
      else
        puts "#{match_data[:correct_positions]} of which are in the right position."
      end
      puts ''
      puts "The secret was #{master_code.secret}"
    end
  end

  def play(input)
    match_data = guess(input)
    guess_check(input)
    feedback_for(match_data)
    check_for_win(match_data)
  end

  def over?
    @win
  end

  def game_length
    @end_time - @start_time
  end

  def check_for_win(match_data)
    if match_data[:correct_guess] == true
      @win = true
      puts ""
      print "YAY YOU! You guessed the sequence '#{master_code.secret}' in #{guess_history.count} tries!\n"+
      "If you want to try your luck again hit 'p'. If your brain is tired hit 'q'."
    end
  end
end
