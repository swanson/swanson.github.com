---
layout: post
title: "A data-driven approach to finding toxic meetings"
categories:
- blog
tags:
- data_sci
---

*This post originally appear on the [MoraleApp][m] blog. Reposted here for archival purposes.*

---

Bad meetings can be a drag on team morale, especially when a recurring meeting becomes 'toxic'. By measuring team morale on days with recurring meetings, we can detect if there is a significant change compared to normal and identify meetings that could potentially be improved.

There is nothing that developers loathe more than meetings. (Okay, maybe they hate aggressive recruiters more, but meetings are right up near the top!)

As more and more teams shift to agile or scrum methodologies, the amount of time spent by developers in recurring meetings is on the rise. Developers have been burned by agenda-less meetings that interrupt their flow and -- in the extreme cases -- [are flat-out toxic][tox].

But we know that there are [coordination and knowledge-sharing benefits][bene] that come from well-run meetings. The ultimate goal is to strike a balance: maximizing effective sessions and eliminating those that simply waste time.

This week, we explore the impact of recurring meetings on team morale and try a data-driven approach to finding toxic meetings that are dragging down team morale.

## Do some meetings have a measurable impact?

Every work day at 3pm EST, all team members were asked to respond to an email asking "How are you feeling today?". Team members could pick "Good", "Meh", or "Bad" (or decline to answer).

This mood data was collected using [MoraleApp.com][m]. 

For each work day, we calculated the team mood using a simple average of the responses (after converting to a numeric scale). We also flagged work days that had recurring meetings attended by the whole team.

![]({{ site.url }}/static/morale-meetings-t3.png)

<div class="caption">Team 1: Recurring Meeting Breakdown</div>

Here are the results we collected over two months with a small team of mobile developers. We observe that team morale on days with either a Sprint Planning meeting or a Weekly Status call is lower than average.

However, this can be slightly deceiving. We would expect some fluctuation among the team so just looking at the averages doesn't paint the full picture. Luckily, there is a tool that can help us determine if our data is statistically significant or if we are observing random variance: the [two-sample T-test][eab].

| Baseline | Meeting | Impact of Meeting? |
|:--------:|:-------:|:------------------:|
| Overall average | Sprint Planning | No significant difference |
| Overall average | Weekly Status | No significant difference |

<div class="caption">Team 1: Two-Sample T-Test Results</div>


Huh. So even though the averages for days with meetings are lower, there is not statistical evidence that the difference is meaningful.

For this team, our analysis does not show any meetings that are harmful to the team's morale. Speaking with several members of the team, this was reasonable; the meetings were generally productive and had a clear focus.

## Searching for toxic meetings

Despite not finding any impact with Team 1, we found the methodology to be solid so we applied it to several other teams to look for any signs of toxic meetings.

Here we found a scrum team with several recurring meetings and over 6 months of morale data.

![]({{ site.url }}/static/morale-meetings-t1.png)

<div class="caption">Team 2: Recurring Meeting Breakdown</div>

The Backlog Grooming meetings jumped out right away. But again, we need to perform further analysis to determine if the impact is significant.

| Baseline | Meeting | Impact of Meeting? |
|:--------:|:-------:|:------------------:|
| Overall average | Sprint Planning | No significant difference |
| Overall average | Backlog Grooming | Morale lower (95% confidence) |

<div class="caption">Team 2: Two-Sample T-Test Results</div>

Aha! We are able to conclude there that is a measurable negative impact to morale on days when the team has Backlog Grooming meetings.

Like before, it is important to confirm the data with reality. The team reported that these meetings were "always draining" and they had discussed finding a new way to run the meeting several times. One particularly bad occurrence of this meeting corresponded to the all-time lowest morale day reported by the team (with multiple members calling out the meeting as the cause of their unpleasant day).

Recently, the team made a major change to the structure of the meeting and will be monitoring their morale data to determine if the change is having a positive impact.

## Do developers just hate all meetings?

On the plus side, we were able to identify recurring events that actually *improved* team morale. One such team was a long-running (2+ year) team that saw high morale on days with Retros.

![]({{ site.url }}/static/morale-meetings-t2.png)

| Baseline | Meeting | Impact of Meeting? |
|:--------:|:-------:|:------------------:|
| Overall average | Sprint Planning | No significant difference |
| Overall average | Retro | Morale higher (94% confidence) |

<div class="caption">Team 3: Can we find a meeting that improves morale?</div>

The team noted that retros were an opportunity to focus on making things better for the future and highlight positive aspects of the project. 

Retrospectives are a [great way to build stable and effective teams][bl] and now we have data to support this long-held belief.

## Conclusion

By looking at statistically significant changes in morale on days with recurring team meetings, we can identify potentially toxic meetings and work to improve the format or eliminate them completely.

We would caution against implying causation from these findings. This approach assumes that recurring meetings have a large impact on the overall morale of team members and may be subject to other factors (day of the week, timing of sprint calendars). 

Ultimately, this analysis is useful for highlighting meetings that could be problematic so that the team can discuss if the data matches reality and if any changes should be made.

[tox]: https://gettingreal.37signals.com/ch07_Meetings_Are_Toxic.php
[bene]: https://www.atlassian.com/agile/ceremonies
[m]: /morale/
[eab]: http://www.evanmiller.org/ab-testing/t-test.html
[bl]: https://www.benlinders.com/2011/establishing-and-maintaining-stable-teams/


