class Guess
  attr_accessor :attempt

  def initialize(input)
    @attempt = input.upcase.chars
  end

  def valid_length?
    attempt.length == 4
  end

  def valid_characters?
    valid_characters = ['r', 'g', 'y', 'b']

    attempt.each do |char|
      valid_characters.include?(char)
    end
  end

  def valid?
    valid_length? && valid_characters?
  end
end
