# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create!([{
  username: 'jux071',
  password: 'sarajevo',
  role: 2
},
{
	username: 'stormtrooper',
	password: 'sarajevo'
},
{
	username: 'sarabon', 
	password: 'sarajevo', 
	role: 1
}])

Artist.destroy_all

Artist.create!([{
  name: 'Red Hot Chili Peppers',
  artist_info: 'Red Hot Chili Peppers, also sometimes shortened to The Chili Peppers or abbreviated as RHCP, are an American funk rock band formed in Los Angeles in 1983. Their musical style primarily consists of rock with an emphasis on funk, as well as elements from other genres such as punk rock and psychedelic rock. When played live, their music incorporates elements of jam band due to the improvised nature of many of their performances. Currently, the band consists of founding members vocalist Anthony Kiedis and bassist Flea, longtime drummer Chad Smith, and former touring guitarist Josh Klinghoffer.',
  user_id: 1
},
{
	name: 'Iron Maiden',
	artist_info: 'Iron Maiden are an English heavy metal band formed in Leyton, East London, in 1975 by bassist and primary songwriter Steve Harris.'
	user_id: 1
},
{
	name: 'The Prodigy', 
	artist_info: 'The Prodigy are an English electronic music group from Braintree, formed by Liam Howlett in 1990. The members were originally Liam Howlett (keyboardist and composer), Keith Flint (dancer and vocalist), Maxim (MC and vocalist), Leeroy Thornhill (dancer and occasional live keyboardist), and a female dancer and vocalist called Sharky, however, both Leeroy and Sharky left the band for different reasons.', 
	user_id: 1
}])

Genre.destroy_all

Genre.create!([{
  name: 'Rock',
  description: 'Rock music is a genre of popular music that originated as "rock and roll" in the United States in the early 1950s, and developed into a range of different styles in the 1960s and later, particularly in the United Kingdom and the United States.',
  user_id: 1
},
{
	name: 'Heavy Metal',
  description: 'Heavy metal (or simply metal) is a genre of rock music[1] that developed in the late 1960s and early 1970s, largely in the United Kingdom.',
  user_id: 1
},
{
	name: 'Dubstep',
  description: 'Dubstep is a genre of electronic dance music that originated in South London, England. It emerged in the late 1990s as a development within a lineage of related styles such as 2-step garage, dub, techno, drum and bass, broken beat, jungle, and reggae.',
  user_id: 1
}])

Album.destroy_all

Album.create!([{
  title: 'Blood Sugar Sex Magik',
  released: 1991,
  description: 'Blood Sugar Sex Magik is the fifth studio album by American rock band Red Hot Chili Peppers, released on September 24, 1991. ',
  artist_id: 1,
  user_id: 1,
  genre_id: 1,
  cover: 'https://upload.wikimedia.org/wikipedia/en/5/5e/RHCP-BSSM.jpg'
},
{
	title: 'Californication',
  released: 1999,
  description: 'Californication is the seventh studio album by American rock band Red Hot Chili Peppers. It was released on June 8, 1999, on Warner Bros. Records and was produced by Rick Rubin. ',
  artist_id: 1,
  user_id: 1,
  genre_id: 1,
  cover: 'https://upload.wikimedia.org/wikipedia/en/d/df/RedHotChiliPeppersCalifornication.jpg'
},
{
	title: 'Seventh Son of a Seventh Son',
  released: 1988,
  description: 'Seventh Son of a Seventh Son is the seventh studio album by English heavy metal band Iron Maiden, released on 11 April 1988 by the EMI label in Europe, and its sister label Capitol in North America. It was re-released on 2002 by Sanctuary/Columbia in the United States.',
  artist_id: 2,
  user_id: 1,
  genre_id: 2,
  cover: 'https://upload.wikimedia.org/wikipedia/en/c/c0/Iron_Maiden_-_Seventh_Son_Of_A_Seventh_Son.jpg'
},
{
	title: 'Dance of Death',
  released: 2003,
  description: 'Dance of Death is the thirteenth studio album by English heavy metal band Iron Maiden, released first in Japan on 2 September and then 8 September 2003 in the rest of the world excluding North America (where it was released a day later). The album was recorded on magnetic (analogue) tape.',
  artist_id: 2,
  user_id: 1,
  genre_id: 2,
  cover: 'https://upload.wikimedia.org/wikipedia/en/d/de/Iron_Maiden-Dance_of_Death.jpg'
},
{
	title: 'Music for the Jilted Generation',
  released: 1994,
  description: 'Music for the Jilted Generation is the second studio album by English electronic dance music band The Prodigy. The album was released through XL Recordings in July 1994.',
  artist_id: 3,
  user_id: 1,
  genre_id: 3,
  cover: 'https://upload.wikimedia.org/wikipedia/en/8/86/TheProdigy-MusicForTheJiltedGeneration.jpg'
},
{
	title: 'Invaders Must Die',
  released: 1991,
  description: 'Invaders Must Die is the fifth studio album by English electronic dance music group The Prodigy. The album was released on 23 February 2009 on the bands new record label Take Me to the Hospital, and was distributed by Cooking Vinyl',
  artist_id: 3,
  user_id: 1,
  genre_id: 3,
  cover: 'https://upload.wikimedia.org/wikipedia/en/f/fe/Invadersmustdie.jpg'
}])

Track.destroy_all

Track.create!([{
  name: 'Voodoo People',
  duration: '6:27',
  link: 'https://www.youtube.com/watch?v=YV78vobCyIo',
  artist_id: 3,
  genre_id: 3,
  album_id: 5,
  user_id: 1
},
{
	name: 'Poison',
  duration: '6:42',
  link: 'https://www.youtube.com/watch?v=_mej5wS7viw',
  artist_id: 3,
  genre_id: 3,
  album_id: 5,
  user_id: 1
},
{
	name: 'One Love',
  duration: '3:53',
  link: 'https://www.youtube.com/watch?v=bcxnbfRYM-g',
  artist_id: 3,
  genre_id: 3,
  album_id: 5,
  user_id: 1
},
{
	name: 'Invaders Must Die',
  duration: '4:55',
  link: 'https://www.youtube.com/watch?v=gTw2YvutJRA',
  artist_id: 3,
  genre_id: 3,
  album_id: 6,
  user_id: 1
},
{
	name: 'Infinite Dreams',
  duration: '6:08',
  link: 'https://www.youtube.com/watch?v=zCjQqKCLkis',
  artist_id: 2,
  genre_id: 2,
  album_id: 3,
  user_id: 1
},
{
	name: 'No More Lies',
  duration: '7:21',
  link: 'https://www.youtube.com/watch?v=RLxIE9IQOJs',
  artist_id: 2,
  genre_id: 2,
  album_id: 4,
  user_id: 1
},
{
	name: 'Suck My Kiss',
  duration: '3:37',
  link: 'https://www.youtube.com/watch?v=C6jElKMMOWM',
  artist_id: 1,
  genre_id: 1,
  album_id: 1,
  user_id: 1
},
{
	name: 'Breaking The Girl',
  duration: '4:55',
  link: 'https://www.youtube.com/watch?v=iyu04pqC8lE',
  artist_id: 1,
  genre_id: 1,
  album_id: 1,
  user_id: 1
},
{
	name: 'Easily',
  duration: '3:51',
  link: 'https://www.youtube.com/watch?v=wSxZgmRGtdI',
  artist_id: 1,
  genre_id: 1,
  album_id: 2,
  user_id: 1
}])

Playlist.destroy_all

Playlist.create!([{
  name: 'Monday list',
  user_id: 1
},
{
	name: 'Funky',
  user_id: 1
},
{
	name: 'My special list',
  user_id: 2
},
},
{
	name: 'No Name',
  user_id: 2
},
{
	name: 'Everyday',
  user_id: 2
},
{
	name: 'Friyay',
  user_id: 3
},
{
	name: 'Cool tunes',
  user_id: 3
},
{
	name: 'Dub',
  user_id: 3
}])
