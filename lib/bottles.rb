class Bottles
  def verse(n)
    get_verse(n)
  end

  def get_verse(n)
this_phrase = bottle_phrase(n)
next_phrase = bottle_phrase(n-1)
    <<-VERSE
#{this_phrase} of beer on the wall, #{this_phrase} of beer.
Take one down and pass it around, #{next_phrase} of beer on the wall.
    VERSE
  end

  def bottle_phrase(n)
    count = count_form(n)
    noun = bottle_form(n)

    "#{count} #{noun}"
  end

  def bottle_form(n)
    if n == 1
      "bottle"
    else
      "bottles"
    end
  end

  def count_form(n)
    if n == 0
      "no more"
    else
      n.to_s
    end
  end
end
