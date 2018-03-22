class Bottles
  def verse(n)
    get_verse(n)
  end

  def get_verse(n)
    <<-VERSE
#{n} #{bottle_form(n)} of beer on the wall, #{n} #{bottle_form(n)} of beer.
Take one down and pass it around, #{n-1} #{bottle_form(n-1)} of beer on the wall.
    VERSE
  end

  def bottle_form(n)
    if n == 1
      "bottle"
    else
      "bottles"
    end
  end
end
