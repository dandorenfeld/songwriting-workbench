# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Song.create({
  :date     => Date.new(1995, 3, 17),
  :title    => "How Long?",
  :content  => "It's been a long time, since we first met",
  :priority => 1,
  :final    => false,
  :user_id  => 1
})

Song.create({
  :date     => Date.new(2006, 1, 21),
  :title    => "I'm a Long Way",
  :content  => "Half my life and half again, I've been looking for the time when",
  :priority => 2,
  :final    => false,
  :user_id  => 1
})

Verse.create({
  :date    => Date.new(1980, 11, 3),
  :tag     => "wish happiness warmth",

  :content => "Just as the sun comes up in the morning\r\n    and shines on thru the day\r\nMay its happiness and warmth\r\n    always come your way\r\nAnd may your days be long and sweet\r\n    like the summer days up north\r\nAnd may your eyes never weep\r\n  from sadness at your door",
  :user_id => 1
})

Verse.create({
  :date    => Date.new(1984, 2, 27),
  :tag     => "memory, fantasy",
  :content => "Are you a memory or a fantasy, circling past the time?\r\n  Are you a memory or a fantasy, walking through my mind?",
  :user_id => 1
})

Verse.create({
  :date    => Date.new(1982, 4, 3),
  :tag     => "travels, time, world ",
  :content => "In my travels you've come around, you've shown me yourself and feelings I've found\r\n    But where will I be next year at this time, in another world will it be yours or mine?",
  :user_id => 2
})

Verse.create({
  :date    => Date.new(2013, 4, 17),
  :tag     => "tag1 tag2 tag3",
  :content => "Start of a song, begins with a verse\r\n  End of a song, ends with a verse",
  :user_id => 0
})

Title.create({
  :title   => "Ruby on my Mind",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "Ruby on the Rocks",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "Somewhere Faraway",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "The Railsbridge Blues",
  :void    => false,
  :user_id => 1
})

Title.create({
  :title   => "A Guest in the House",
  :void    => false,
  :user_id => 2
})

Title.create({
  :title   => "You'll Fly Away",
  :void    => false,
  :user_id => 2
})

