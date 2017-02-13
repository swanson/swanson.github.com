---
layout: post
title: "How much does 'crunch time' hurt team morale?"
categories:
- blog
tags:
- data_sci
---

*This post originally appear on the [MoraleApp][m] blog. Reposted here for archival purposes.*

---

Crunch time before major deadlines is a high stress time for project teams. We dig into the data to see what it could tell us about the impacts of crunch time on team morale.

> "We're launching in 3 weeks, period"

These six words send shivers down the spines of developers because of what it signals: **crunch time**. It is common for the weeks before a major milestone to bring long hours, elevated stress, and peak snippiness among project teams.

But is the crunch time despair just a myth or can we observe measurable drops in team morale as we approach project deadlines? And what about the lasting effects of crunch time? Is it a temporary dip or does it have long-term consequences?

We've been tracking team morale across several project teams and this week I wanted to dive into one project and see what the data can show us about the impact of crunch time on team morale.

----

## Can we find a link between team morale and crunch time?

Every work day at 3pm EST, all team members were asked to respond to an email asking "How are you feeling today?". Team members could pick "Good", "Meh", or "Bad" (or decline to answer).

This mood data was collected using [MoraleApp.com][m]. 

For each work day, we calculated the team mood using a simple average of the responses (after converting to a numeric scale).

![]({{ site.url }}/static/morale-crunch-avg-v2.png)

This data was collected from one project team over 8 months. This particular team was building a web application and was using a mix of scrum and agile practices. Over the duration of the project, the team size ranged from five to eight engineers and the overall participation of the team was 73%.

## Establishing a baseline happiness level

In addition to the average mood, we can plot a "normal range" for this team. This band is based on the historical average of the team -- a daily mood value within this range is normal for this team. 

Days with values above the range can be thought of as especially good days and days below the range are bad days for the team. Values that fall outside of the range can indicate a special "event" that needs extra attention.

It is important to establish a baseline for each team; without this normal range, it is difficult to detect whether any swings are significant or just normal fluctuations.

![]({{ site.url }}/static/morale-crunch-trends-v2.png)

We defined a "normal range" for the team using a modified version[^1] of [Process Control Limits][pcl]. To help smooth out the data, we've also added a two week rolling average. It is still useful to see individual days that have large spikes in team morale, but we also wanted to see a trend accounting for the cyclical, two week development sprints of the team.

## Are bugs contributing to crunch time woes?

Bugs can be a great indicator of trouble brewing for a project. We wanted to see if the number of bugs created would have any interesting relationship to the team mood. Using [JIRA][j], we pulled a report of the number of bugs created each day and plotted them below.

![]({{ site.url }}/static/morale-crunch-bugs-v2.png)

In particular, this team had a large spike in created bugs during February. We observe a corresponding drop in reported team mood starting in February and continuing throughout the month. Are unhappy developers introducing more bugs? Or is the pile of new bugs making the team feel worse?

## Finding crunch time

To learn more, we next added markers corresponding to the major project releases (so far the team has had two releases, with a third upcoming). After combining all of our data, we start to see a more clear picture of the team's morale.

![]({{ site.url }}/static/morale-crunch-story-v2.png)

In the weeks before the first major release, more bugs were uncovered as QA testing ramped up. Edge cases were being discovered and critical bugs and blockers began to show up on the team's radar.

The team was trying to stabilize the codebase, fix critical bugs, and squeeze in the last important features before the first release. Stress levels rose and uncertainty about hitting the target date started to impact the morale of the team.

This team has seen two predictable drops in team morale in the weeks leading up a major release. **The average team morale dropped 17% during crunch time before Release 1 and 11% before Release 2**. The data supports the long-held belief about software projects: team morale declines during the crunch time before a deadline.

## Does the team bounce back after crunch time?

The data shows that this team is very resilient. While the mood drops during crunch time, it quickly rebounds after a release. This is an encouraging sign for a team -- members are likely willing to help each other out, persist through difficult stretches, and are proud of the work they accomplished.

![]({{ site.url }}/static/morale-crunch-bounceback-v2.png)

For this team, the weeks with the highest overall reported morale came 1-3 weeks after the release was out the door and deployed smoothly to customers.

## How can we use these metrics in a forward-looking way?

This team is approaching the third major release of the project. With clear patterns in the first two releases, the team leads can take steps to mitigate the expected morale drop. 

And the changes don't need to be extreme. Simply reminding the team at a stand-up meeting that they are in crunch mode and should expect bugs or issues to come in can help keep everyone in a positive mindset.

The team can start looking at the morale data on a more regular basis to detect large drops, talk about the cause, and work towards a solution. It might be a good time to schedule a team lunch or celebration, or even just make an extra effort to show appreciation to a teammate.

Speaking with the team lead, the third release is going smoothly in terms of bugs and getting feature-complete by the deadline, but the team is still seeing the overall morale start to dip down. When asked what other factors might be contributing, uncertainty about the scope of a future, high-risk release was raised. We're not sure if this is the root cause, but it got a good conversation started.

## Conclusion

For this particular team, the data supports a link between crunch time before major releases and a decrease in the team morale. An increase in bugs created and uncertainty about future releases may be a part of the underlying cause.

By being proactive, the team can take steps to mitigate the effects of crunch time. Monitoring morale after a release to make sure it returns to normal levels can help prevent negative long-term impacts.

Further analysis could include looking at changes to the team size, recurring meetings (e.g. sprint planning), or general seasonal fluctuations of team morale.

[m]: /morale/
[j]: https://developer.atlassian.com/jiradev/jira-apis/jira-rest-apis/jira-rest-api-tutorials
[pcl]: https://en.wikipedia.org/wiki/Control_limits

[^1]: We opted to loosen the typical control limit band (&plusmn;3&sigma;) as we are willing to accept more potential false positives from negative swings. In practice, we found these lower limits to better match the overall feeling of the teams. We're still experimenting with finding the right limits.
