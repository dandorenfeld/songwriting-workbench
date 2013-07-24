# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Song Lyrics
#
Song.create({
  :date     => Date.new(1981, 2, 15),
  :title    => "When I'm 85",
  :content  => "What will I see, where will I be,\r\n    when I turn 85\r\n\r\nWill I be dead or stuck in a bed\r\n    when I turn 85\r\n\r\nWhat will I say about living each day\r\n    when I turn 85\r\n\r\nAnd will I still love you and will I still need you\r\nAnd will you be around, or under the ground\r\n    when I turn 85\r\n\r\nWill I have loved and been part of\r\n    when I turn 85\r\n\r\nWill I see the light I hope it shines bright\r\n    when I turn 85\r\n\r\nWill I understand what it means to be a man\r\n    when I turn 85",
  :priority => 0,
  :final    => false,
  :user_id  => 1
})

Song.create({
  :date     => Date.new(1992, 5, 13),
  :title    => "Never Alone (What is your name?)",
  :content  => "What is your name, my darling young one\r\n    it's hard to explain what's going on\r\nI hope your are well, I hope you are strong\r\n    so much to tell to you in this song\r\n\r\nMy love for you will always be true\r\n    to be part of and explore the new\r\nFor you I can't wait, to show what I know\r\n    don't you hesitate, you're never alone\r\n\r\nYou are a blessing, coming into our life\r\n    you brought an understanding, about the meaning of life\r\nAnd where will you go, and what will you do?\r\n    I don't know, may you follow it through\r\n\r\nWhat is your name, my darling young one\r\n    it's hard to explain what's going on\r\nI hope your are well, I hope you are strong\r\n    there's so much to tell to you in this song\r\n\r\nLyrics by Dan Dorenfeld",
  :priority => 3,
  :final    => true,
  :user_id  => 1
})

Song.create({
  :date     => Date.new(1995, 3, 7),
  :title    => "How Long?",
  :content  => "It's been a long time, since we first met\r\n    Has it been that long since we first met?\r\nYesterday's gone, yesterday's gone\r\n\r\nHow long will it be until we find out?\r\n    Will it be that long until we find out?\r\nTomorrow will come, tomorrow will come\r\n\r\nAnd where do we go from here?\r\n    It's not all very clear\r\nAnd how will we find our way?\r\n    Is there anyone who can really say?\r\n\r\nOur dreams they come, our dreams they go\r\n    Will this only be a dream as we grow old?\r\nI don't know, I don't know\r\n\r\nWe've been thru the years, we've been thru the tears\r\n    As the days have gone by, yesterday is here\r\nTomorrow has come, tomorrow has come\r\n\r\nAnd where do we go from here?\r\n    It's not all very clear\r\nAnd how will we find our way?\r\n    Is there anyone who can really say?\r\n\r\nLyrics by Dan Dorenfeld",
  :priority => 4,
  :final    => true,
  :user_id  => 1
})

Song.create({
  :date     => Date.new(2006, 1, 21),
  :title    => "I'm a Long Way",
  :content  => "Half my life and half again, I've been looking for the time when, I could go home\r\nAnd in that time, I met a man, he said son, why don't you take my hand\r\n    And I'll show you the way\r\n\r\nAnd I'm a long long way from where I'm going\r\n    Just a short short way from where I've been\r\nAnd I've got to keep on going\r\n    To get my self home again\r\n\r\nI've searched high and I've search low, In my heart and in my soul, to show me the way\r\nI've been thru the months and thru the years, as I'm traveling on the more I fear\r\n    It's too late for me now\r\n\r\nAnd I'm a long long way from where I'm going\r\n    Just a short short way from where I've been\r\nAnd I've got to keep on going\r\n    To get my self home again\r\n\r\nDo I see the signs as they pass me by, talk to me now sometimes I'm too blind, to see my way thru\r\nAnd if I find a path to your door, please be open so I'll search no more\r\n    I'll make it somehow\r\n\r\nAnd I'm a short short way to where I'm going\r\n    And a short short way from where I've been\r\nHow will I keep on going\r\n    to get myself home again\r\n\r\nLyrics by Dan Dorenfeld",
  :priority => 2,
  :final    => false,
  :user_id  => 1
})

Song.create({
  :date     => Date.new(2013, 4, 17),
  :title    => "My Ruby on Rails",
  :content  => "Riding the Rails with Ruby to places I've never been,\r\n    riding the Rails with Ruby, to find the light within\r\n\r\nRiding the Rails with Ruby riding them far and near\r\n    riding the Rails with Ruby, across that vast frontier\r\n\r\nOh Ruby my Ruby it's time to set sail, take me to places where I will prevail\r\n\r\nDon't show me your heart or what flows thru your veins,\r\n    but \"interpret\" my wishes and don't \"raise\" any pain\r\n\r\nMy past is inside you written in C,\r\n    But it's the beauty of your objects, that means so much to me\r\n\r\nOh Ruby my Ruby it's time to set sail, take me to places where I will prevail\r\nRuby oh Ruby, my Ruby on Rails\r\n\r\nLyrics by Dan Dorenfeld",
  :priority => 1,
  :final    => true,
  :user_id  => 1
})

Song.create({
  :date     => Date.new(2013, 5, 19),
  :title    => "song test",
  :content  => "MY heart aches, and a drowsy numbness pains \r\n My sense, as though of hemlock I had drunk,	\r\nOr emptied some dull opiate to the drains	\r\n One minute past, and Lethe-wards had sunk:	\r\n'Tis not through envy of thy happy lot,	         5\r\n But being too happy in thine happiness,	\r\n  That thou, light-winged Dryad of the trees,  \r\n     In some melodious plot	\r\n Of beechen green, and shadows numberless,	\r\n  Singest of summer in full-throated ease.",
  :priority => 1,
  :final    => false,
  :user_id  => 2
})

Song.create({
  :date     => Date.new(2013, 7, 1),
  :title    => "",
  :content  => "A song for one, a song for all, this is it, one for all",
  :priority => 2,
  :final    => false,
  :user_id  => 2
})

Song.create({
  :date     => Date.new(2013, 4, 14),
  :title    => "Like Me and You",
  :content  => "Ain't it funny how the time goes past\r\n    sometimes we want the moment to last\r\n    and thats when the time goes by to fast\r\n\r\nTime don't care how fast it moves\r\n    because time ain't got nothing to lose: like me and you\r\n\r\nAin't it funny how the time goes past\r\n    sometimes we want it to go by so fast\r\n    yet thats when it seems it'll never move past\r\n\r\nTime don't care how fast it moves\r\n    because time don't ever get the blues: like me and you",
  :priority => 3,
  :final    => true,
  :user_id  => 2
})


#
# Song Verses
#
Verse.create({
  :date    => Date.new(1980, 11, 3),
  :tag     => "wish happiness warmth",
  :content => "Just as the sun comes up in the morning\r\n    and shines on thru the day\r\nMay its happiness and warmth\r\n    always come your way\r\nAnd may your days be long and sweet\r\n    like the summer days up north\r\nAnd may your eyes never weep\r\n    from sadness at your door",
  :user_id => 1
})

Verse.create({
  :date    => Date.new(1984, 2, 27),
  :tag     => "memory, fantasy",
  :content => "Are you a memory or a fantasy, circling past the time?\r\n    Are you a memory or a fantasy, walking through my mind?",
  :user_id => 1
})

Verse.create({
  :date    => Date.new(2013, 4, 16),
  :tag     => "",
  :content => "I'm sitting here singing this simple tune\r\nOur friendship is so simple too\r\nYou like me and I like you\r\n\r\nLife can be a simple tune, you like it and it'll like you",
  :user_id => 1
})

Verse.create({
  :date    => Date.new(1982, 4, 3),
  :tag     => "travels, time, world ",
  :content => "In my travels you've come around, you've shown me yourself and feelings I've found\r\n    But where will I be next year at this time, in another world will it be yours or mine?",
  :user_id => 2
})

Verse.create({
  :date    => Date.new(2013, 4, 15),
  :tag     => "ruby, blues, sad",
  :content => "You know you left me ruby,\r\n    you left me feeling sad\r\n\r\nYou know you left me ruby,\r\n    and I don't understand",
  :user_id => 2
})

Verse.create({
  :date    => Date.new(2013, 6, 30),
  :tag     => "path, past, live, life",
  :content => "There's a way to get to where you want to go, if you can find the path\r\nThere's a way to get to where you want to go, if you can understand the past\r\n\r\nThere's a way to live your life today, if you can stay the course\r\nThere's a way to live your life today, if you can show remorse",
  :user_id => 2
})


#
# Song Titles
#
Title.create({
  :title   => "Ruby on my Mind",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "C & Ruby, Always Together",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "Ruby on the Rocks",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "The Railsbridge Blues",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "Somewhere Faraway",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "A Guest in the House",
  :void    => false,
  :user_id => 2
})

Title.create({
  :title   => "A Guest in the House II",
  :void    => false,
  :user_id => 2
})

Title.create({
  :title   => "Tuesday's with Ruby",
  :void    => false,
  :user_id => 2
})

Title.create({
  :title   => "You'll Fly Away",
  :void    => false,
  :user_id => 2
})

Title.create({
  :title   => "The Snow Must Go On",
  :void    => false,
  :user_id => 2
})


