class SequenceGenerator
  def generate
    letters = [["R", "G", "Y", "B"], ["R", "G", "Y", "B"], ["R", "G", "Y", "B"], ["R", "G", "Y", "B"]]

    letters.map {|letter|
      letter.shuffle.first
    }
  end
end
