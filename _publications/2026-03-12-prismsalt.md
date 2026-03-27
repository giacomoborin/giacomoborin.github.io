---
title: "PRISM with a pinch of salt: Simple, Efficient and Strongly Unforgeable Signatures from Isogenies"
collection: publications
permalink: /publication/2026-prismsalt
excerpt: 'Improvement of PRISM using a salt and a strongly unforgeable variant'
date: 2026-03-12
venue: 'Cryptology ePrint Archive'
paperurl: 'https://eprint.iacr.org/2026/443'
citation: 'Basso, A., Borin, G., Castryck, W., Santos, M.C.R., Invernizzi, R., Leroux, A., Maino, L., Vercauteren, F. and Wesolowski, B., "PRISM with a pinch of salt: Simple, Efficient and Strongly Unforgeable Signatures from Isogenies." <i> Cryptology ePrint Archive. </i>'
authors: 'A. Basso, G. Borin, W. Castryck, M. C.-R. Santos, R. Invernizzi, A. Leroux, L. Maino, F. Vercauteren, B. Wesolowski'
layout: default
public: true
preprint: true
doi: 
code: https://github.com/mariascrs/PRISM_v2
award: 
---

## Abstract

The problem of computing an isogeny of large prime degree from a supersingular elliptic curve of unknown endomorphism ring is assumed to be hard both for classical as well as quantum computers.  
In this work, we first build a two-round identification protocol whose security reduces to this problem.  
The challenge consists of a random large prime  and the prover simply replies with an efficient representation of an isogeny of degree  from its public key.  Using the hash-and-sign paradigm, we then derive a signature scheme with a very simple and flexible signing procedure and prove its security in the standard model.
The most efficient variant of our signature schemes features a signing which is  1.4x to 1.6x faster than the most recent implementaion of SQIsign, whereas verification ranges from 1.2x slower to 1.01x faster depending on the security level. The sizes of public key and signature are comparable to existing schemes.

