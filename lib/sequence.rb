require './lib/sequence_generator'

class Sequence
  attr_reader :secret

  def initialize
    @secret = SequenceGenerator.new.generate
  end
end
