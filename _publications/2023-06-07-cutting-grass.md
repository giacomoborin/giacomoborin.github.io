---
title: "Cutting the GRASS: Threshold GRoup Action Signature Schemes"
collection: publications
permalink: /publication/2023-cutting-grass
excerpt: 'Threshold signature from generic group action derived signatures'
date: 2023-06-07
venue: '<i>CT-RSA 2024</i>'
paperurl: 'https://eprint.iacr.org/2023/859'
citation: 'Battagliola, Michele, Giacomo Borin, Alessio Meneghetti, and Edoardo Persichetti. "Cutting the GRASS: Threshold GRoup Action Signature Schemes." <i>CT-RSA</i> (2024).'
---

# Threshold Signatures
A $T,N$-threshold digital signature scheme is a protocol designed to distribute the right to sign messages to any subset of at least $T$ out of $N$ key owners. Then, any subset of malicious users of size up to the threshold $T$ won’t be able to forge a valid signature alone. 

<p align="center">
<img width="708" alt="image" src="https://github.com/giacomoborin/giacomoborin.github.io/assets/64214430/91092969-66e2-4876-a2ad-3f82d155e9c0">
</p>

Recently the design and the standardization of Multi-Party Threshold Schemes
received much more interest, even from [NIST](https:// nvlpubs.nist.gov/nistpubs/ir/2020/NIST.IR.8214A.pdf), since the can be used, for example, to enable a more *fine-grained control* of secret assets, to perform *Secure Multi-Party Computation* and to improve *Distributed Ledger Technologies*.

# Group Actions

For any group action $\star : G \times X \to X$ we can always define a digital signature via a non interactive proof of knowledge of a secret *linking* group element $g$ such that $g \star x = y$, where $x,y$ is our public key. The simple idea can be summarized by the diagram
<p align="center">
<img width="316" alt="image" src="https://github.com/giacomoborin/giacomoborin.github.io/assets/64214430/3d642681-1b84-434f-a6dd-2372f06b2b35">
</p>
The core idea of the $\Sigma$ protocol is that the verifier produces a new ephemeral set element $\tilde{x} = \tilde{g}\star x$, then showing *or* the full black arrow ($\tilde{g}$) *or* the gray dashed one ($\tilde{g}g^{-1}$), but *never* both of them together.   

When considering the exponentiation on a cyclic group we get the core idea behind the Schnorr signature, that can be greatly optimized thanks to the distributive properties of the exponentiation, the same properties used by the Shor algorithm to break discrete logarithm on a quantum computer. 

### New Group Actions
However, luckily for post-quantum cryptography, several new group actions are emerging, for example from isogenies of ellyptic curves or equivalence of linear codes or tensors. With them a variety of techniques aimed at improving their performance and efficiency are emerging. 
Most of these techniques can be explained as transforming one $\Sigma$-protocol into another, while essentially preserving security. 


# MPC of a Group Action

In this work, we show that isomorphism problems which stem from cryptographic group actions, can be viable building blocks for threshold signature schemes. In particular, we construct a full $N$-out-of-$N$ threshold signature scheme, and discuss the efficiency issues arising from extending it to the generic $T$-out-of-$N$ case. To give a practical outlook on our constructions, we instantiate them with the LESS and MEDS frameworks, which are two flavors of code-based cryptographic group actions. Finally, we highlight some ideas that would allow for a more efficient and compact $(T,N)$ threshold variant of LESS, whose security relies on new hardness assumptions.

[Download paper here](https://eprint.iacr.org/2023/859)


