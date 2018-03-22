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

    def number_of_bottles
      "#{count_word_form} #{bottle_form}"
    end

    def wall_phrase
      "#{number_of_bottles} of beer on the wall, #{number_of_bottles} of beer."
    end

    def pass_phrase
      "Take #{pronoun_form} down and pass it around,"
    end

    def leading_phrase
      "#{number_of_bottles} of beer on the wall."
    end
  end

  def verse(n)
this_verse = BottleVerse.new(n)
next_verse = BottleVerse.new(n-1)
<<-HEREDOC
#{this_verse.wall_phrase}
#{this_verse.pass_phrase} #{next_verse.leading_phrase}
HEREDOC
  end
end
