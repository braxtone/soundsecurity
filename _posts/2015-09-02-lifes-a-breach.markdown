---
layout: post
category: episodes
date: 2015-09-02
episode_num: 11
title: "Life's a Breach"
audio_file_path: "/audio/sound-security-e011.mp3"
length: 39433021
duration: "27:23"

articles: 
  -
    title: "Your Security Policy is So Lame"
    comment: ""
    urls: 
      - "https://isc.sans.edu/diary/Your+Security+Policy+Is+So+Lame/19991"
  - 
    title: "Death to plugins of yore"
    comment: ""
    urls: 
      - "https://threatpost.com/google-patches-critical-vulnerabilities-in-chrome-45/114509"
      - "http://advertising.amazon.com/ad-specs/en/policy/technical-guidelines"
      - "http://arstechnica.com/information-technology/2015/08/google-chrome-will-block-auto-playing-flash-ads-from-september-1/"
      - "http://googleadsdeveloper.blogspot.com/2015/08/handling-app-transport-security-in-ios-9.html"
  - 
    title: "NSA w/ Quantum Resistant Computing initiative"
    comment: ""
    urls: 
      - "https://www.nsa.gov/ia/programs/suiteb_cryptography/index.shtml"
breach: 
  title: "Ashley Madison"
  comment: ""
  urls: 
    - "http://krebsonsecurity.com/2015/07/online-cheating-site-ashleymadison-hacked/"

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

