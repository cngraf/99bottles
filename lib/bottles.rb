require 'pry'
require 'pry'

class Bottles
  class Wall
    def initialize(number_of_bottles)
      @number_of_bottles = number_of_bottles
    end

    def sing_a_verse!
      first_count = count_the_bottles_of_beer

      action_peformed = nil
      if @number_of_bottles > 0
        action_peformed = "take #{_pronoun} down and pass it around"
        @number_of_bottles -= 1
      else
        action_peformed = "go to the store and buy some more"
        @number_of_bottles = 99
      end

      recount = count_the_bottles_of_beer

      <<~FULLROUND
        #{first_count.capitalize} on the wall, #{first_count}.
        #{action_peformed.capitalize}, #{recount} on the wall.
      FULLROUND
    end

    def count_the_bottles_of_beer
      "#{_number} #{_noun} of beer"
    end

    private

    def _noun
      case @number_of_bottles
      when 1
        "bottle"
      else
        "bottles"
      end
    end

    def _number
      case @number_of_bottles
      when 0
        "no more"
      else
        @number_of_bottles
      end
    end

    def _pronoun
      case @number_of_bottles
      when 1
        "it"
      else
        "one"
      end
    end
  end

  def verse(n)
    Wall.new(n).sing_a_verse!
  end

  def verses(start_num, end_num)
    song = []
    wall = Wall.new(start_num)

    (start_num - end_num + 1).times do
      song << wall.sing_a_verse!
    end
    song.join("\n")
  end

  def song
    verses(99,0)
  end
end
