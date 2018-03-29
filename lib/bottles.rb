require 'pry'
require 'pry'

class Bottles
  class Wall
    def initialize(number_of_bottles)
      @number_of_bottles = number_of_bottles
      @last_action = nil
    end

    def sing_a_round!
      first_count = count_the_bottles_of_beer
      peform_the_action!
      recount = count_the_bottles_of_beer

      <<~ROUND
        #{first_count.capitalize} on the wall, #{first_count}.
        #{@last_action.capitalize}, #{recount} on the wall.
      ROUND
    end

    def peform_the_action!
      if @number_of_bottles > 0
        @last_action = "take #{_pronoun} down and pass it around"
        @number_of_bottles -= 1
      else
        @last_action = "go to the store and buy some more"
        @number_of_bottles = 99
      end
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
    Wall.new(n).sing_a_round!
  end

  def verses(start_num, end_num)
    song = []
    wall = Wall.new(start_num)

    (start_num - end_num + 1).times do
      song << wall.sing_a_round!
    end
    song.join("\n")
  end

  def song
    verses(99,0)
  end
end
