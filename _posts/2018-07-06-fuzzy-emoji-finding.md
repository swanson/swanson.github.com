---
layout: post
title: ":hammer: Building a :bug: Fuzzy :smile: Emoji :mag: Finder :100:"
categories:
- blog
tags:
- data_sci
---

A while back I was on a project and, for whatever reason, our team started checking every morning to see what holiday it was and to bond over the absurdity of some of the holidays.

There are so many holidays, most of them are dumb or head-scratchers. Did you know that on the day I write this post it is (allegedly) ["Take Your Webmaster to Lunch Day"](https://www.youtube.com/watch?v=fZuJGhFhSV8)? What did you do to celebrate everyone's favorite special occasion ["National Apple Turnover Day"](https://foodimentary.com/2018/07/05/july-5th-is-national-apple-turnover-day-2/)?

I decided that I needed to make a Slack bot to post the daily dumb holiday roundup. And this Slack bot should pick a relevant emoji for each holiday because emojis are fun.

As I went about over-engineering this dumb piece of useless software, it was surprisingly enjoyable and I was actually practicing relevant data science and NLP techniques.

So the goal: once a day, post a message to Slack with list of today's holidays (and matching emojis) :tada:

# Sourcing

A Google search for `daily holidays` lead me to [Checkiday.com](https://www.checkiday.com/) -- a leading source of flimsy sourced holidays that I'm pretty sure are mostly made up.

I first thought about writing a scrapper, but I found that our good friends over at Checkiday.com publish an RSS feed with the daily holidays: [https://www.checkiday.com/rss.php?tz=America/Indianapolis]()

```ruby

feed = Excon.get(HOLIDAY_FEED)
xml = Hash.from_xml(feed.body)

source = xml["rss"]["channel"]["item"].map{|i| i["title"]}

[ 
  "Comic Sans Day ",
  "International Kissing Day",
  "National Air Traffic Control Day",
  "National Fried Chicken Day®",
  "Take Your Webmaster to Lunch Day",
  "Umbrella Cover Day"
]

```

# Cleaning / normalization

The first step in my data pipeline is to [clean and normalize the input data](https://en.wikipedia.org/wiki/Text_normalization). In this case, that means pulling the holiday names from the RSS feed and then striping extra whitespace, removing special characters, and making everything lowercase.

```ruby

source.map do |holiday|
  holiday
    .downcase
    .strip
    .gsub(/[^a-z ]/i, '')
end

[ 
  "comic sans day",
  "international kissing day",
  "national air traffic control day",
  "national fried chicken day",
  "take your webmaster to lunch day",
  "umbrella cover day"
]

```

# Stop words

[Stop words](https://en.wikipedia.org/wiki/Stop_words) are common words that don't provide any semantic value to a chunk of text (words like "the", "and", "of", etc). These should be removed from the input to remove noise.

I found a handy Ruby gem with a bunch of stopwords: [https://github.com/brez/stopwords]() so I added the gem and removed individual stop words from the holiday titles.

Another common operation is to remove domain specific stop words. If you were looking at medical data, you might remove common low-value words like "doctor", "dr", "patient", etc. In my case, I looked at a few days worth of holidays and made a custom stop list with words like "national", "day", "international", "festival", etc.

```ruby

source.map do |holiday|
  holiday
    .downcase
    .strip
    .gsub(/[^a-z ]/i, '')
    .split(" ")
    .reject{|w| Stopwords.is? w }
    .reject{|w| HolidayStopwords.is? w }
    .join(" "))
end

[ 
  "comic sans",
  "kissing",
  "air traffic control",
  "fried chicken",
  "webmaster lunch",
  "umbrella cover"
]
```

# N-grams

Now I have a list of keywords for the given holidays that has been stripped of most of the noise. After some trial and error, I found that doing n-grams helped improve the pipeline results.

[N-grams](https://en.wikipedia.org/wiki/N-gram) are a fancy way of saying "groups of words". It is a contiguous sequence of words in your text. You can generate bigrams (each 2 word pair) or trigrams (each 3 word pair) or even more if you want.

There is probably some gem for this but I didn't even really need full n-grams, so what I did was just split the holidays by spaces to generate some kinda-sorta-n-grams. It's close enough.

```ruby

def ngram(phrase)
  phrase.split(" ").append(phrase)
end

"air traffic control" -> ["air", "traffic", "control", "air traffic control"]
```

# Semantic keywords

There are tons of emojis, but there are even more English words so not every holiday was going to find an exact (or even close) match.

Take the :hamburger: emoji for instance. This is the right emoji to use for "hamburger", but also "cheeseburger", "burger", "fast food", etc

If I tried to match "National Cheeseburger Awareness Day" it would probably find something like :cheese: instead of the :hamburger:, because computers are really dumb.

Luckily, I found the Emojilib project: [https://github.com/muan/emojilib]() where the internet has lovingly added keywords to over 5000+ emojis.

```json

"hamburger": {
  "keywords": [
    "meat", "fast food", "beef", "cheeseburger", "mcdonalds", "burger king"
  ],
  "char": "🍔",
  "fitzpatrick_scale": false,
  "category": "food_and_drink"
}

```

I downloaded the full listing of emojis and create a mapping of keywords to emojis. Real professionals might call this a [semantic mapping](https://en.wikipedia.org/wiki/Semantic_search), but I'm not a real professional.

# Fuzzy match scoring

Now that I've pruned the holidays down to the most relevant parts and I have a huge dictionary of keywords (and their corresponding emojis), it's time to find the closest match for each holiday.

I grabbed the `fuzzy_match` gem: [https://github.com/seamusabshere/fuzzy_match]() which takes a "needle" and a "haystack" and then uses a few different algorithms to return the closest matching emoji keyword.

I ran the fuzzy matcher for each of our n-grams from above and picked the keyword with the highest matching score. If multiple items had exact matches (e.g. "chocolate" and "milk"), I picked the match that was the longest word. Why? I don't know, it seemed good.

```

Input: make gingerbread house

=> [["cake", 0.66],
 ["bread", 0.57],
 ["house", 1.0],
 ["derelict_house_building", 0.41]]

```

# Mechanisms

I glued together a script to pull the holidays from the RSS link, feed them into my very fancy :tm: data pipeline, and then format and post the message to [Slack via a bot user](https://api.slack.com/bot-users). I put the app on Heroku and used the [Scheduler](https://elements.heroku.com/addons/scheduler) to run the script once a day.

# Results

For ~75 lines of code, the results are really, really good. The emoji suggestions are sometimes even spooky good.

Here is a sampling of the test data:

```sh

:bear: Polar Bear Plunge Day
:stuffed_flatbread: Buffet Day
:eyes: Run It up the Flagpole and See If Anyone Salutes It Day
:microscope: Science Fiction Day
:wastebasket: Fruitcake Toss Day
:new_moon: Festival of Sleep Day
:bird: Bird Day
:globe_with_meridians: Earths Rotation Day
:shower: Clean Off Your Desk Day
:bulb: Static Electricity Day
:battery: Cut Your Energy Costs Day
:zzz: Make Your Dreams Come True Day
:house: Organize Your Home Day
:strawberry: Strawberry Ice Cream Day
:face_with_no_mouth: Nothing Day
:link: Benjamin Franklin Day
:id: Kid Inventors Day
:new: Ditch New Years Resolution Day
:taurus: Thesaurus Day

```

And the finished bot:

![](https://i.imgur.com/2daeAga.png)

![](https://i.imgur.com/xhHFa0x.png)

# Conclusion

This was a very silly project, but it was really fun and I think it is illustrative of the type of work you can do to get a pretty good result with minimal effort.

You can see the code here: [https://github.com/swanson/dumb-holidays]()

Possible improvements and further over-engineering: stemming, better n-grams, ensemble fuzzy matching algorithms, better keyword corpus mapping, sentiment analysis, blockchain, :poop:

