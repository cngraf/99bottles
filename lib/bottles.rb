class Bottles
  class Wall
    def initialize(n)
      @bottles_at_large = n
    end

    def conduct_operations!
      <<~ROUND
        #{debriefing}
        #{execute_directive!}, #{postmortem}
      ROUND
    end

    def debriefing
      "#{sitrep.capitalize} on the wall, #{sitrep}."
    end

    def postmortem
      "#{sitrep} on the wall."
    end

    def execute_directive!
      case @bottles_at_large
      when 0
        @bottles_at_large = 99
        "Go to the store and buy some more"
      when 1
        @bottles_at_large -= 1
        "Take it down and pass it around"
      else
        @bottles_at_large -= 1
        "Take one down and pass it around"
      end
    end

    def sitrep
      case @bottles_at_large
      when 0
        "no more bottles of beer"
      when 1
        "1 bottle of beer"
      else
        "#{@bottles_at_large} bottles of beer"
      end
    end
  end

  def verse(n)
    Wall.new(n).conduct_operations!
  end

  def verses(start_num, end_num)
    song = []
    wall = Wall.new(start_num)

    (start_num - end_num + 1).times do
      song << wall.conduct_operations!
    end
    song.join("\n")
  end

  def song
    verses(99,0)
  end
end
