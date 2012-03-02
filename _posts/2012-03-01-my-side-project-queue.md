---
layout: post
title: "What's in my Side Project Queue?"
categories:
- blog
---

I usually have two or three side projects that I'm hacking on at any given
time. I've tried sticking to one, but I like having a few options that I can
hop between.

I'm winding down one project I've been working on for a few weeks (an Android
app for doing planning poker) which means it's time to reach into my
giant bag of projects and pull something out.

One thing I've been meaning to do more of is collaboration - with both people
in Indianapolis and across the web. So I figured I'd toss out my current
list of project ideas. If any of them sound cool to you and you want to work 
on it together (which would be totally awesome!), get in touch with me.

#Project Queue (in no particular order)

Working title: `garage-sailor`    
Quick pitch: find local garage sales on your phone; use Craigslist or
other API to seed data; web app to list your own sales ($$$) and phone app to
browse the sales and get directions    
Potential Stack: MongoDB (geospatial index), [TileMill][tilemill], [Leaflet.js][leaflet]

[leaflet]: http://leaflet.cloudmade.com/
[tilemill]: http://mapbox.com/tilemill/

---

Working title: `merlin`    
Quick pitch: "presentation magic"; I like writing slides in Markdown, but I
don't really like ShowOff; 98% of my slides fit into 3 templates 
(large centered text, full screen image, bulleted list) that's all I want to
support; provide a standard markup for theming and leverage one of the many
Javascript slide libraries    
Potential Stack: Ruby (DSL?), Markdown, [Deck.js][deck]

[deck]: http://imakewebthings.github.com/deck.js/

---

Working title: `coder.fm`    
Quick pitch: daily, customizable "radio show" centered around dev/tech news;
pull down RSS or other trigger-based data to build a "script" then run it
through text-to-speech to produce a 5-10 min audio file for the morning 
commute    
Potential Stack: RSS parser, cron, [Lion TTS][tts], [mp3cat][mp3cat], S3

[tts]: http://osxdaily.com/2011/05/15/mac-os-x-lion-new-text-to-speech-voices-samples/
[mp3cat]: http://tomclegg.net/mp3cat

---

Working title: `git-tickets`    
Quick pitch: clone of Github Issues as a stand-alone bug tracker with tight
integration with git ($$$); the anti-TFS/Jira    
Potential Stack: Backbone.js, [git-notes][git-notes], [grit][grit], pretty CSS3/HTML5 stuff

[grit]: https://github.com/mojombo/grit
[git-notes]: http://schacon.github.com/git/git-notes.html

---

Working title: `pomojournal`    
Quick pitch: I'm really into the whole [Quantified Self][qs] stuff at the moment,
so I've started tracking my project work using the Pomodoro technique; this 
idea is a web-based journal that tracks my "poms" and has standard
features like tagging, search, and a timeline; ideally would be integrated
with a desktop tracking app    
Potential Stack: Rails, [pomodoro][pomo-mac] (Mac), [tomighty][pomo-win] (Windows)

[qs]: http://quantifiedself.com/
[pomo-mac]: https://github.com/ugol/pomodoro
[pomo-win]: https://github.com/ccidral/tomighty

---

Working title: `hacker-stream`    
Quick pitch: Activity feed targeted towards the "modern developer or 
designer"; aggregate actions from github, bitbucket, twitter, blog RSS, HN, 
Dribbble, Forrst, etc etc into a single feed; inspired by Mark Pilgrim's (now
removed) "Firehose" page    
Potential Stack: [Open Graph][open-graph], various APIs

[open-graph]: http://ogp.me/

---

Working title: `git-gradelevel`    
Quick pitch: Script that computes the [Flesch–Kincaid Grade Level][fk] of each
committer in a git repo; the ultimate way to passive-aggressively tell your
teammates to stop writing shitty commit messages! "You write commit msgs
like a 3rd grader!"    
Potential Stack: shell, readability algorithms

[fk]: http://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_test