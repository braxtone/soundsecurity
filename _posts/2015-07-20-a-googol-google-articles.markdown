---
layout: post
category: episodes
date: 2015-07-20
episode: 10
title: A Googol Google Articles
audio_file_path: "/audio/sound-security-e010.mp3"
length: 38907361 
duration: "38:09"

articles: 
  - 
    title: "Google's Comments on the Wassenaar Arrangement"
    comment: "Send your comments to publiccomments@bis.doc.gov"
    urls: 
      - "http://googleonlinesecurity.blogspot.com/2015/07/google-wassenaar-arrangement-and.html"
  - 
    title: "Finding Algorithmically Chosen DNS Names Using Entropy"
    comment: "Check out the code at https://github.com/MarkBaggett/MarkBaggett/tree/master/freq"
    urls: 
      - ""
  - 
    title: ""
    comment: ""
    urls: 
      - ""
breach: 
  title: ""
  comment: ""
  urls: 
    - ""

---
Audio: [{{ site.url }}{{ page.audio_file_path }}]({{ site.url }}{{ page.audio_file_path }})

### Discussed Articles
{% for article in page.articles %}
{{ forloop.index }}) {{ article.title }}
{{ article.comment }}
{% for url in article.urls %}
* [{{ url }}]({{ url }})
{% endfor %}
{% endfor %}

### Breach of the Week
{{ page.breach.title }}
{{ page.breach.comment }}
{% for url in page.breach.urls %}
* [{{ url }}]({{ url }})
{% endfor %}



# Announcements!
We'll be taking the next month off due to Braxton going on paternity leave. We'll be recording again at the end of August. But we can't just abandon you, our dear listeners, bereft of great security content so here are some other great podcasts and things to check out:

* Risky Business Podcast - http://risky.biz/netcasts/risky-business
* Silver Bullet Bullet - https://www.cigital.com/podcast/
* Southern Fried Security - http://www.southernfriedsecurity.com/
* Samy Kamkar’s new video channel - https://www.youtube.com/user/s4myk
* Summer Reading List
    * The Economics of Security Advice - http://research.microsoft.com/en-us/um/people/cormac/papers/2009/SoLongAndNoThanks.pdf
    * Outlier Detection at Netflix - http://techblog.netflix.com/2015/07/tracking-down-villains-outlier.html
    * How to Actually Learn Data Science - https://www.dataquest.io/blog/how-to-actually-learn-data-science/
