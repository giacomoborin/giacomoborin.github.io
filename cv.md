---
layout: default
title: "CV"
# permalink: /cv/
# author_profile: true
# redirect_from:
#   - /resume
---

## Education 🎓

* B.S. in Mathematics, [University of Trento](https://www.maths.unitn.it), 2017 to 2021
* M.S. in Mathematics, curricula in [Cryptography](https://www.maths.unitn.it/109/laboratorio-di-matematica-industriale-e-crittografia), University of Trento, 2021 to 2023
* Ph.D in Mathematics, [University of Zurich](https://www.math.uzh.ch/aa/), 2023 to now 

## Work experience ⛑️

* from Nov 2023: Pre Doc Researcher (**Current Position**)
  * [IBM Research Zurich](https://www.zurich.ibm.com)
  * Supervisor: [Luca De Feo](https://defeo.lu)
  * Group: Foundations of Cryptography

* Summer 2023: Research Internship
  * [DNAalgo](https://dnaalgo.com)
  * Topic: studying [capacity of DNA storage channel](https://giacomoborin.github.io/files/master/DNA_capacity_2023.pdf)

* 2021 to 2022: Graduate Teaching Assistant
  * University of Trento
  * Courses: Linear Algebra & Calculus I
  * Departments: Math & Physics
  

## Publications 📝

<ol>
  {% assign pubs = site.publications | sort: "date" | reverse %}
  {% assign count = pubs | size %}
  {% for pub in pubs %}
    {% if pub.doi %}
      <li value="{{ count }}">
        {{ pub.citation }}
        [<a href="{{ pub.doi }}">doi</a>]
        {% if pub.award %}
          ({{ pub.award }})
        {% endif %}
        {% assign count = count | minus: 1 %}
      </li>
    {% endif %}
  {% endfor %}
</ol>


## Talks 🙊

<ul>
  {% assign talks = site.talks | sort: "date" | reverse %}
  {% for pub in talks %}
    <li>
      {{ pub.date | date: "%Y-%m-%d" }}:
      {{ pub.title }}, 
      <i> {{ pub.venue }}</i>.
      {% if pub.link %}
         [<a href="{{ pub.link }}">url</a>]
      {% endif %}
    </li>
  {% endfor %}
</ul>
  
## Teaching 📗

<ul>
  {% assign lect = site.teaching | sort: "date" | reverse %}
  {% for pub in lect %}
    <li>
      {{ pub.year }}:
      {{ pub.title }}, 
      <i> {{ pub.venue }}</i>.
    </li>
  {% endfor %}
</ul>


