require 'pry'

class Bottles
  class BottleVerse
    SPECIAL_STATES = [:nullular, :singular, :plural]

    NOUNS = {
      singular: "bottle",
      default: "bottles",
    }

    PRONOUNS = {
      singular: "it",
      default: "one",
    }

    COUNT_WORDS = {
      nullular: "no more",
      default: nil,
      # hmmm
    }

    def initialize(n)
      @num = n
      @state = SPECIAL_STATES[n] || SPECIAL_STATES.last
    end

    def bottle_form
      NOUNS[@state] || NOUNS[:default] || @num
    end

    def count_word_form
      COUNT_WORDS[@state] || COUNT_WORDS[:default] || @num
    end

    def pronoun_form
      PRONOUNS[@state] || PRONOUNS[:default] || @num
    end

    def next_verse
      if @state == :nullular
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
      if @state == :nullular
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
end
