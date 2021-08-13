---
title: "Summer Institute 2021: a year older and wiser"
tags:
 - Remote Participants
 - Zoom
 - Slack
author: qread
---

A few weeks ago, 30 researchers from 11 teams made their virtual way to SESYNC for the 2021 Computational Summer Institute. 
It was a pleasure to interact with researchers from diverse backgrounds working on an array of interesting questions in socio-environmental synthesis.
In this blog post, I'll go over some of the highlights of the week and the lessons we as instructors learned.

![Screenshot of 2021 CSI participants](/assets/images/si2021screenshot.png){: width="600px" }
*Some of the coaches and participants mugging for the camera*

## Recap

2021 was the first summer institute that was intended to be virtual from the get-go, in contrast to 2020 when the pandemic threw a wrench into our plans when we had already begun to prepare. 
This year, 11 teams participated. Half of them were SESYNC-funded --- but even among the folks on other teams there were a lot of SESYNC connections. 
The coaching staff consisted of data scientists Rachael and Quentin, plus postdoc Renee and guest instructor/coach Mary. 
We had to juggle time zones stretching from the U.K. to Hawaii, an 11-hour difference. We're experts in that by now! 

![Time zones of 2021 CSI participants](/assets/images/csi2021map.png){: width="600px" }
*2021 CSI participants logged in from lots of different time zones!*  
*Map in Robinson projection, made with the help of [this blog post][geocoding]. [Source code here][mapcode].*

We used more or less the same tech setup as [last year][2020post]. The instructors recorded "code-along" lecture videos ahead of time and uploaded them to YouTube. 
The teams worked through the lessons each day and asked questions at daily office hours. We communicated with teams on Slack, where each
team had its own channel for collaborative work. We sprang for the Slack paid plan (fairly cheap with the educational discount) so that
teams could make video calls from within Slack. All our full-group meetings were done in Zoom. As we have always done for both virtual and in-person
workshops, we set up a "teaching lab," a virtual machine running on the SESYNC server that participants can just log into and have their work
environment ready to go, with all R and Python packages already installed.

In addition to doing the lessons, each team also brought some of their own data and worked on a mini-project throughout the week. Each team was assigned
a coach who they met with every day to work on their mini-project, which they presented at the final meeting on Friday. As always, it was a busy and fun week!

## Highlights of team projects

We had a really interesting mix of projects and backgrounds represented --- check out the Twitter thread I made during the final presentations.

<a class="twitter-timeline" height="500" href="https://twitter.com/QuentinDRead/timelines/1426165786331209735?ref_src=twsrc%5Etfw">2021CSI - Curated tweets by QuentinDRead</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

To give you a few examples, we had a team working on linking global biodiversity models to ecosystem models to predict changes in the biodiversity-ecosystem service relationship.
Another team was looking at stories of sea ice loss: how is it portrayed in the media and how do the media portrayals correlate with observed trends in sea ice cover?
We even had a team really getting into the weeds of agent-based modeling to explore how small farmers in Nepal are reacting to climate change.
Other team projects included doing intensive spatial analysis on microclimates in Houston Texas to look at overlap between poverty, health, and climate, 
modeling fishing outside of protected areas off the coast of Oahu, and environmental justice in stream restoration projects.
Lots of teams' projects made heavy use of geospatial analysis and text mining. So those lessons came in handy!

![Example figure: coral richness over time](/assets/images/Stony_Coral_Species_Richness.gif){: width="250px" align="left" } ![Example figure: watershed inference heatmap](/assets/images/watershedinferenceheatmap.jpg){: width="300px" align="left" }

![Example figure: Hawaiian fisheries model output](/assets/images/hawaiifisheriesfig.png){: width="600px" }
*A few of the data visualizations made by 2021 CSI teams*

## Impressions and lessons learned

After over a year of remote work, we instructors had more experience with virtual teaching, and the students were clearly more used to remote learning. 
As a result, things went pretty smoothly this year. 
One thing we instructors took away is that collaborative coding tools like GitHub are more important than ever for geographically scattered teams working on data science projects.
The most common thing we saw in students' feedback was how much they appreciated getting some hands-on experience with that kind of remote collaboration.
So I think the most important accomplishment from the 2021 CSI was giving participants that practice. Other coaches echoed that sentiment.

What could we have done better? There was a decent amount of interaction between teams but we could have done more to foster it. That has always been a challenge of the virtual format.
Maybe next time we could more explicitly take advantage of some of the overlaps among teams? For example we had three teams that were working with coral reefs, and a couple
of teams looking at migration and livelihoods of farmers in developing countries. We could have sorted the teams out by topics and given teams with overlapping topics a chance to 
interact.

Another thing that we are still trying to work out for the virtual format is how to maximize participation and engagement in the lessons.
In the previous in-person incarnations of CSI, we held lessons in the morning and teams worked independently in the afternoon, so everyone was at least present for each lesson.
In the virtual CSI, participants had a greater incentive to spend a lot of time working on their own projects and skip some of the lessons. 
This is hard to avoid in the virtual format, especially when the week is so packed with work and material to cover. 
One potential way to increase engagement might be to front-load the lessons so that there are more lessons earlier in the week (say three per day) and only one per day at the end of the week.
That way, students could focus more on the lessons when they are still motivated to work on them, then switch gears and delve more deeply into their own projects.

I want to close by giving a big shout-out to all the hard-working teams, especially the grad student teams that have not even had the chance to meet each other in person. 
I hope that day comes soon --- and I hope that there will be one last hurrah for the SESYNC Summer Institute in 2022!

[2020post]: {{ 'blog/virtual-csi-lessons-learned.html' | relative_url }}
[geocoding]: {{ 'blog/geocoding-with-R.html' | relative_url }}
[mapcode]: /assets/files/timezonemap.R
