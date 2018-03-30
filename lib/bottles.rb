class Bottles
  class Wall
    def initialize(n)
      @bottles_at_large = n
      @briefing = nil
      @debriefing = nil
    end

    def conduct_operations!
      @briefing = "#{sitrep.capitalize} on the wall, #{sitrep}."
      execute_and_debrief!
    end

    def mission_log
      <<~LOG
      #{@briefing}
      #{@debriefing}
      LOG
    end

    def execute_and_debrief!
      case @bottles_at_large
      when 0
        @debriefing = "Go to the store and buy some more, "
        @bottles_at_large = 99
      when 1
        @debriefing = "Take it down and pass it around, "
        @bottles_at_large -= 1
      else
        @debriefing = "Take one down and pass it around, "
        @bottles_at_large -= 1
      end
      @debriefing << "#{sitrep} on the wall."
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
    wall = Wall.new(n)
    wall.conduct_operations!
    wall.mission_log
  end

  def verses(start_num, end_num)
    song = []
    wall = Wall.new(start_num)

    (start_num - end_num + 1).times do
      wall.conduct_operations!
      song << wall.mission_log
    end
    song.join("\n")
  end

  def song
    verses(99,0)
  end
end
