---
layout: default
title: Home
---

# GIACOMO BORIN

Hello, I'm Giacomo. I enjoy Algebra and Cryptograph. Currently, I am pursuing a 
Ph.D. at the University of Zurich in the Applied Algebra group, while also 
working as a Pre Doc researcher at IBM Research Zurich within the Foundations of 
Cryptography group, under the supervision of [Luca De Feo](defeo.lu).

My mathematical pursuits primarily revolve around isogenies and isomorphism 
problems associated with coding theory. The objective of my research is to 
leverage these mathematical tools to establish innovative functionalities for 
cryptographic schemes, mainly threshold systems, based on quantum-resistant 
assumptions. 

Here, you can find my:
- email: `crypto at gbor dot in`;
- [github](https://github.com/giacomoborin): @giacomoborin;
- [publications](#pubs);
- [talks](#talks);
- [teaching records](#teach);
- [full CV](/cv/);
- [portfolio](#portfolio) of some selected projects.

**Discalimer**: _opinions are my own_.

<a id="pubs"></a>
## 📝 PUBLICATIONS

<ol>
  {% assign pubs = site.publications | sort: "date" | reverse %}
  {% assign count = pubs | size %}
  {% for pub in pubs %}
    <li value="{{ count }}">
      <strong>{{ pub.title }}</strong>, 
      {{ pub.authors }}, 
      <i> {{ pub.venue }}</i>.
      {% if pub.award %}
      <br>
      ({{ pub.award }})
      {% endif %}
      {% if pub.paperurl %}
         [<a href="{{ pub.paperurl }}">paper</a>]
      {% endif %}
      {% if pub.code %}
         [<a href="{{ pub.code }}">code</a>]
      {% endif %}
      <!-- [<a href="{{ pub.url }}">more</a>] -->
      {% assign count = count | minus: 1 %}
    </li>
  {% endfor %}
</ol>

<a id="talks"></a>
## 🙊 TALKS (selected)

<ul>
  {% assign talks = site.talks | sort: "date" | reverse %}
  {% for pub in talks %}
    <li>
      {{ pub.date | date: "%Y-%m" }}:
      {{ pub.title }}, 
      <i> {{ pub.venue }}</i>.
      {% if pub.link %}
         [<a href="{{ pub.link }}">url</a>],
      {% endif %}
      [<a href="{{ pub.url }}">more</a>]
    </li>
  {% endfor %}
</ul>


<a id="teach"></a>
## 📚 TEACHING

<ul>
  {% assign lect = site.teaching | sort: "date" | reverse %}
  {% for pub in lect %}
    <li>
      {{ pub.year }}:
      {{ pub.title }}, 
      <i> {{ pub.venue }}</i>.
      [<a href="{{ pub.url }}">more</a>]
    </li>
  {% endfor %}
</ul>

<a id="portfolio"></a>
## 📍 PORTFOLIO

<ul>
  {% assign lect = site.portfolio | sort: "date" | reverse %}
  {% for pub in lect %}
    <li>
      {{ pub.title }}:
      {{ pub.excerpt }}.
      [<a href="{{ pub.url }}">more</a>]
    </li>
  {% endfor %}
</ul>



