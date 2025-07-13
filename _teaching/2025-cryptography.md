---
title: "TA for Kryptographie"
collection: teaching
type: "Undergraduate and Graduate course"
permalink: /teaching/2025-spring-teaching-1
venue: "University of Zurich, Institute of Mathematics"
date: 2025-02-19
year: 2025
location: "Zurich, Switzerland"
layout: teaching
---

## Kryptographie, 2025

**Professor**: Prof. Dr. Joachim Rosenthal,  
*Teaching Assistants*:

* Giacomo Borin
* Silvia Sconza
* Abhinaba Mazumder

Here some material for the course.
A few useful links:

* 2025 : Reference [link](https://www.math.uzh.ch/en/ve-vo-det?key2=5249&keySemId=48&cHash=8b5a905103418358d83858ea182cee92) of the course.
* Sagemath is a computer algebra software based on python that can be installed [here](https://doc.sagemath.org/html/en/installation/index.html) and the docs are [here](https://doc.sagemath.org/html/en/constructions/index.html).
* Jupyter Notebook is a popular, open-source web application used for creating and sharing documents that combine live code, text, visualizations, and rich media. You can download it [here](https://jupyter.org/). If you really don't want to run it locally there are services like [Binder](https://mybinder.org/) to run it online.

## Exercise Session 04

*Arguments*: factorization and LFSR.
*Script used*:

* [notebook](https://giacomoborin.github.io/files/teaching/cryptography/ex04_solutions.ipynb), [online view](https://nbviewer.org/github/giacomoborin/giacomoborin.github.io/blob/master/files/teaching/cryptography/ex04_solutions.ipynb)

## Exercise Session 07

*Arguments*: AES key scheduling and Elliptic Curve introduction.
*Scripts used*:

* [Sagemath notebook](https://giacomoborin.github.io/files/teaching/cryptography/ex07_aes_ecc.ipynb) with descriptive AES key scheduling and EC formulas,
* [Python notebook](https://giacomoborin.github.io/files/teaching/cryptography/ex07_aes.ipynb) with a more serious AES key scheduling.

Tips:

* see [hyperelliptic.org](https://hyperelliptic.org/EFD/) for a database of explicit EC formulas.

## Lesson 2025.04.17

Here some gifs showing the use of the LLL algorithm to solve the knapsack problem. There are generated with [this](https://giacomoborin.github.io/files/teaching/cryptography/lll.py) script and inspired by [Tanja Lange lesson on LLL](https://www.youtube.com/watch?v=UU2EaVXkKLY).

**Example 0**:

* *weights*: $430, 138, 495, 49, 463, 196, 165$;
* *target*:  $942$;
* *solution*: $430 + 49 + 463 = 942$

![Cryptography Gif](https://giacomoborin.github.io/files/teaching/cryptography/matrix_animation_small.gif)

**Example 1**:

* *weights*: $2381, 1094, 2188, 2442, 2280, 1129, 1803, 2259, 1665$;
* *target*: $7598$;
* *solutions*: $1094 + 2442 + 1803 + 2259 = 7598$

![Cryptography Gif](https://giacomoborin.github.io/files/teaching/cryptography/matrix_animation_bigger.gif)

