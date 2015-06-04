---
layout: post
date: 2015-06-03
title: NOT Episode Seven
---

So if you haven't guessed by now, Osman and I were slackers in recording episode seven. We've decided to just blog about the articles we would have talked about and resume our regularly scheduled posting on Monday.

1. [Google Exposes Its Corporate Applications to the Internet](http://blogs.wsj.com/cio/2015/05/11/google-moves-its-corporate-applications-to-the-internet/) -  [HackerNews discussion](https://news.ycombinator.com/item?id=9539372)

As security nerds, we've all known and tried to stress for years that there shouldn't be anything sacred
about your internal network. But then the latest logo'd and nicknamed security vulnerability comes
out, and after watching the almost too suave marketing video, you get to work. "What is
Internet-facing that's impacted by this?" you ask. Then you get the teams on board to address those
set of hosts, you vy admirably to stress the importance of this vuln, you rally support, ops teams
patch, teams are congratulated, security nerds rest easy. But what about those other hosts? The 90% that 
are only accessible internally that are one Kali boot away from being no long your boxen?

I really admire what Google did here. Mostly their security team for successfully advocating for
this approach and then actually building it. If you take away the assumption that your internal
applications don't need to be secured, or that you can slack on patching because their only
accesible internally anyway, it's incredible what a forcing function that is. As we've discussed
before, take a random box, imagine it got owned, and think of all the damage that one box could do.

Obviously Google is Google and your company, my company is not, but it's a fascinating exercise to
go through imagining the collateral damage that one box could do and then building in defenses to
shore that up. How much trust are you implying simply because a box has an internal IP address?

They also published a [whitepaper](http://static.googleusercontent.com/media/research.google.com/en/us/pubs/archive/43231.pdf) which is goes into more detail about the architecture they built to
support this approach.

*-Braxton*

2. [United Launches a Bug Bounty Program](http://www.united.com/web/en-US/content/Contact/bugbounty.aspx)

Now this is totally *not* in response to the hoopla surrounding the security researcher tweeting
dumb things on the United flight that we talked about in [episode five](http://soundsecurity.braxtonehle.com/episodes/2015/04/23/fasten_your_seatbelts_for_vdbir/). But, because it is, I have a lot of respect for United and their InfoSec team for responding the way they did. There's a lot to be said for a post mortem process after things go horribly wrong that helps you think through what processes you can put in place to make sure said bad thing never happens again. United evidently did something to that effect and decided to launch a bug bounty program in which frequent flyer miles are handed out for vulnerabilities.

Now, there may be a bit of irony in rewarding a security researcher with a flight on the plane that
they just found a remote code execution vuln on, but aside from that, it was really great to see
this kind of response from United. They were on the receiving end of a lot of bad publicity after
and came out of it with a better defined process for engaging with the security community.

*-Braxton*
