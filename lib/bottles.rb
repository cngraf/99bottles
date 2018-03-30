class Bottles
  class Wall
    attr_reader :mission_logs

    def initialize(n)
      @bottles_at_large = n
      @mission_logs = []
    end

    def conduct_operations!
      latest_briefing = sitrep
      latest_directive = obtain_directive
      @bottles_at_large = (@bottles_at_large - 1) % 100
      latest_debriefing = sitrep

      @mission_logs << <<~REPORT
        #{latest_briefing.capitalize} on the wall, #{latest_briefing}.
        #{latest_directive}, #{latest_debriefing} on the wall.
      REPORT

      self
    end

    def obtain_directive
      case @bottles_at_large
      when 0
        "Go to the store and buy some more"
      when 1
        "Take it down and pass it around"
      else
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
    Wall.new(n).conduct_operations!.mission_logs.last
  end

  def verses(start_num, end_num)
    wall = Wall.new(start_num)
    (start_num - end_num + 1).times do
      wall.conduct_operations!
    end
    wall.mission_logs.join("\n")
  end

  def song
    verses(99,0)
  end
end
