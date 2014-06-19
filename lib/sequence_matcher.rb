class SequenceMatcher
  attr_reader :sequence, :guess
  attr_accessor :match_data  # => nil

  def initialize(sequence, guess)
    @sequence = sequence           # => "rbgy"
    @guess = guess                 # => "brgy"
  end

  def match?
    sequence.secret == guess.attempt
  end

  def match_count
    guess_chars  = guess.attempt
    secret_chars = sequence.secret.dup
    count = 0

    guess_chars.each do |char|
      if secret_chars.include?(char)
        count += 1
        secret_chars.slice!(secret_chars.index(char))
      end
    end

    return count
  end

  def position_count
    letter_count = 0
    4.times do |i|
      if sequence.secret[i] == guess.attempt[i]
        letter_count += 1
      end
    end
    letter_count
  end

  def match_data
    {
      :correct_content   => match_count,
      :correct_positions => position_count,
      :correct_guess     => match?
    }
  end
end
