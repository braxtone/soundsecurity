---
layout: post
category: episodes
date: 2015-09-02
episode: 11
title: ""
audio_file_path: "/audio/"
length:
duration: ""

articles: 
  - 
    title: ""
    comment: ""
    urls: 
      - ""
  - 
    title: ""
    comment: ""
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
