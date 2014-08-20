---
layout: post
title: "Too Much Information"
categories:
- blog
tags:
- growth
---

*"So how long will this task take?"* An innocent question from the client at a 
status meeting.

Your ears perk up. 

*"Well, we need to figure out whether to use serialization or use a
join table. We are leaning towards another table, but there is that new feature
`hstore` PostgreSQL extension that might be better.*

*But first, I need to refactor some of the code in the ReportService. There is an
N+1 query going on and that class is getting really hairy. I think we should
be pulling out some logic into a new class.*

*Once I have that taken care of, we need to figure out the best way to pull
out the reports. It might be nice to use a sliding window range, but I don't
know if that will be necessary &mdash; there aren't that many records so we could just
pull them all at once."*

The client's eyes glaze over. You can't understand why they keep asking when it will be
done.

Too much information and at the wrong level.

---

Communication between parties at different technical levels is a tricky subject.
A project manager must communicate with a non-technical client. A developer must
communicate with a less-technical project manager.

Unfortunately, knowing the appropriate level is an acquired skill. 

You can try putting yourself in the other person's shoes &mdash; think about their 
background and knowledge. It may help to refer to past communications to get a baseline
on how in depth to go.

I tend to err on the side of too little information and adjust as needed. You can always
offer to go further if the client wants more information. I find this preferable to getting
too technical and losing the focus of the discussion.

*"So how long will this task take?"*, the client asks at a status meeting.

*"Should be about 2 days, I need to do a bit of cleanup but I don't anticipate any 
problems."*