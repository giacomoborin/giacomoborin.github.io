---
title: "Enhancing Threshold Group Action Signature Schemes: Adaptive Security and Scalability Improvements"
collection: publications
permalink: /publication/2025-grass-plus
excerpt: 'Improvements on threshold signature from generic group action'
date: 2025-03-15
venue: 'PQCrypto 2025'
paperurl: 'https://eprint.iacr.org/2025/085'
citation: 'Battagliola, M., Borin, G., Di Crescenzo, G., Meneghetti, A., Persichetti, E. (2025). Enhancing Threshold Group Action Signature Schemes: Adaptive Security and Scalability Improvements. <i> Post-Quantum Cryptography. PQCrypto 2025</i>'
authors: 'M. Battagliola, G. Borin, G. Di Crescenzo, A. Meneghetti, E. Persichetti'
layout: default
doi: https://doi.org/10.1007/978-3-031-86599-2_5
---

### Abstract


Designing post-quantum digital signatures is a very active research area at present, with several protocols being developed, based on a variety of mathematical assumptions. Many of these signatures schemes can be used as a basis to define more advanced schemes, such as ring or threshold signatures, where multiple parties are involved in the signing process. Unfortunately, the majority of these protocols only considers a static adversary, that must declare which parties to corrupt at the beginning of the execution. However, a stronger security notion can be achieved, namely security against adaptive adversaries, that can corrupt parties at any times.

In this paper we tackle the challenges of designing a post-quantum adaptively secure threshold signature scheme: starting from the GRASS signature scheme, which is only static secure, we show that it is possible to turn it into an adaptive secure threshold signature that we call GRASS+. In particular, we introduce two variants of the classical GAIP problem and discuss their security. 
We prove that our protocol is adaptively secure in the Random Oracle Model, if the adversary corrupts only $\frac{t}{2}$ parties. We are also able to prove that GRASS+ achieves full adaptive security, with a corruption threshold of $t$, in the Black Box Group Action Model with Random Oracle. Finally, we improve the performance of the scheme by exploiting a better secret sharing, inspired from the work of \citeauthor{desmedt1995multiplicative} from ASIACRYPT'94. 
