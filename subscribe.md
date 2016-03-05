---
layout: page
title: Subscribe
permalink: /subscribe/
---

Here are all the ways you can get the Sound Security Podcast into your ears:

Feeds
=====

[iTunes Feed](https://itunes.apple.com/tt/podcast/sound-security-podcast/id974229319?mt=2) - There are some feeds iDevices subscribe to

[Feedburner](https://feeds.feedburner.com/SoundSecurityPodcast) - For everything else, there's Feedburner

Direct Audio Links
==================
Want to just download our episodes in mass? Here's a list of the audio files:

<ul>
  {% for post in site.categories.episodes %}
    <li>
      <a class="post-link" href="{{ post.audio_file_path | prepend: site.url }}">{{ post.audio_file_path | prepend: site.url }}</a>
    </li>
  {% endfor %}
</ul>


If you're feeling lazy, here's a bash script to download all the files. Copy and paste into a terminal near you.

    episodes="{% for post in site.categories.episodes %} {{ post.audio_file_path | prepend: site.url }} {% endfor %}"
    for episode in $episodes; do echo "Downloading $episode..."; wget "$episode"; done
