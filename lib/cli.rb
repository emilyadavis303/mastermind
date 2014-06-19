require './lib/game'
require './lib/sequence'
require './lib/guess'
require './lib/mega_mind'

class CLI

  def initialize
    @mind = Mega_mind.new
    # puts @mind
    print "What up homeslice? So you think you can handle Mastermind . . . \n" +
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n" +
    "What'll it be? "
    @command = ''
  end

  def instructions
    puts ""
    print "I don't have time to hold your hand.\nSee if you can't figure this out.\n" +
    "Enter 'p' if you think you can handle it, or 'q' if you can't.\n" +
    "What'll it be? "
  end

  def play
    print "\nLet's do this! Unless you need to tap out, in which case hit just 'q'.\n" +
    "I've generated a sequence with FOUR characters made up of:\n" +
    "R, G, B, and Y. Throw a guess my way.\n"

    game = Game.new

    until game.over? or @command == "q"
      print "Come at me bro: "
      @command = gets.strip
      game.play(@command)
    end
  end

  def run
    until @command == "q"
      # start_screen
      print ""
      @command = gets.chomp
      case @command
      when "p" then play
      when "i" then instructions
      when "q" then "Peace out homie!"
      else
        puts "Seriously? #{command}? There's only three options . . . "
      end
    end
    puts "Peace out Homeslice!"
  end
end
