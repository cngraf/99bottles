require 'pry'

class Bottles
  class BottleVerse
    SPECIAL_STATES = [:nullular, :singular, :plural]

    def initialize(n)
      @num = n
    end

    def bottle_form
      case @num
      when 1
        "bottle"
      else
        "bottles"
      end
    end

    def count_word_form
      case @num
      when 0
        "no more"
      else
        @num
      end
    end

    def pronoun_form
      case @num
      when 1
        "it"
      else
        "one"
      end
    end

    def next_verse
      case @num
      when 0
        BottleVerse.new(99)
      else
        BottleVerse.new(@num - 1)
      end
    end

    def number_of_bottles
      "#{count_word_form} #{bottle_form}"
    end

    def wall_phrase
      "#{number_of_bottles.capitalize} of beer on the wall, #{number_of_bottles} of beer."
    end

    def pass_phrase
      case @num
      when 0
        "Go to the store and buy some more,"
      else
        "Take #{pronoun_form} down and pass it around,"
      end
    end

    def leading_phrase
      "#{number_of_bottles} of beer on the wall."
    end

    def full_verse
<<-HEREDOC
#{wall_phrase}
#{pass_phrase} #{next_verse.leading_phrase}
HEREDOC
    end
  end

  def verse(n)
    BottleVerse.new(n).full_verse
  end

  def verses(start_num, end_num)
    start_num.downto(end_num).map do |n|
      BottleVerse.new(n).full_verse
    end.join("\n")
  end

  def song
    verses(99,0)
  end
end
