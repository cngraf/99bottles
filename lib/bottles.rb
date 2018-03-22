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

    def bottle_form(n = @num)
      NOUNS[:state] || NOUNS[:default] || n
    end

    def count_word_form(n = @num)
      COUNT_WORDS[:state] || COUNT_WORDS[:default] || n
    end

    def pronoun_form(n = @num)
      PRONOUNS[:state] || PRONOUNS[:default] || n
    end

    def number_of_bottles
      "#{count_word_form} #{bottle_form}"
    end

    def first_verse
      "#{number_of_bottles} of beer on the wall, #{number_of_bottles} of beer."
    end

    def second_verse
      "Take #{pronoun_form} down and pass it around, #{number_of_bottles} of beer on the wall."
    end
  end

  def verse(n)
<<-HEREDOC
#{BottleVerse.new(n).first_verse}
#{BottleVerse.new(n-1).second_verse}
HEREDOC
  end
end
