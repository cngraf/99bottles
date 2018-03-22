#### Quick Thoughts

Just finished challenge. Looking at my commit log, a break down for approx. how much time I spent per test:

* 1: 2 minutes
* 2: free
* 3: 2 minutes
* 4: 35 minutes
* 5: 14 minutes
* 6: 3 minutes
* 7: 3 minutes
* 8: 1 minute

58 minutes - and 35 of those were spent on one test!

Things started out pretty well. Just some string interpolation, I even passed the 2nd test before I saw it. And then, things took a turn.

The 4th test was for the "1 bottle" case, when the verse goes like so:

> 1 bottle of beer on the wall, 1 bottle of beer.
> Take it down and pass it around, no more bottles of beer on the wall.

The big changes: Instead of "take one down", we have "take it down". And in the final line, instead of "N bottle(s)", we have "no more bottles". The "no more" was the biggest individual change, since it was no longer enough to just interpolate the verse number in every case.

So that led me to break out the verse from a simple method into its own "BottleVerse" class, and ate up a lot of time. I didn't even finish this case before the 30 minute limit ran out - I had a solution that was theoretically functional, but hadn't been purged of typos and syntax errors.

The refactor did pay off down the line, though. The 5th test (the "0 bottles" verse) took the second most time, but still less than half of the 4th. The change in the 5th test was arguably bigger than the "no more" swap:

> No more bottles of beer on the wall, no more bottles of beer.
> Go to the store and buy some more, 99 bottles of beer on the wall.

Not only are we rewording an entire clause, but the 0-verse also needs to loop back around to 99. If I hadn't started the refactor in test 4, I probably would have needed to do so here.

Thankfully, that work paid off. Tests 6-8 flew by. Everything was already "solved" by this point, it was just a case of iterating through the right range of verses.

The theme seems to be this: Finding useful abstractions is hard.

#### Things I Would Change With More Time, In No Particular Order

* The `_form` methods are weird.

* The COUNT_WORDS thing is especially problematic. The other two map the input to a predefined phrase. Singular gets this, plural gets that, etc. But every input value (number) has its own count word, hence the awkward double-default thing.

* Typing pitfalls. Figure out if we should just convert the numeric into a string as soon as it enters the system. Main problem is finding the "next" verse.

* Speaking of the "next verse" thing, it's weird that each BottleVerse has to access the next one in its loop. Maybe I'm just in code challenge mode here, but this seems like it could be implemeneted as circularly-linked nodes. Not held it memory necessarily, but... eh, maybe not. Just define another class that knows that 99 comes after 0, etc. Verses should not be responsible for creating other instances of verses.

* Doubt "nullular" is a word. Had no time to waste on dictionary.com.

* Draw out the rest of the patterns in the verse phrasing.

* Abstract out all the nouns, maybe. Could easily FizzBuzz this with "vessels" and "liquors" ("16 bottles of beer", "15 snifters of port") as long as you stay away from irregular plurals. Which is no guarantee. And doesn't make logistic sense.

* ...in fact, maybe try a state-based approach. It doesn't make sense to change the liquor or vessel type each round, if you imagine the "wall" being seeded with a predefined set collection of objects at the start of the song. If I'm saying 99 bottles of beer, I expect every vessel/liquor to be a bottle/beer. Maybe the verse is the wrong abstraction altogether - take advantage of stateful OO, and define a Wall class instead, that pops off bottles and gives you the verse. Hmmm.
