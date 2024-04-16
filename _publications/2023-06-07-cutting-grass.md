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

The paper can be [downloaded here](https://eprint.iacr.org/2023/859). We proceed here with a brief summary of the main points.

## Threshold Signatures
A $T,N$-threshold digital signature scheme is a protocol designed to distribute the right to sign messages to any subset of at least $T$ out of $N$ key owners. Then, any subset of malicious users of size up to the threshold $T$ won’t be able to forge a valid signature alone. 

<p align="center">
<img width="708" alt="image" src="https://github.com/giacomoborin/giacomoborin.github.io/assets/64214430/91092969-66e2-4876-a2ad-3f82d155e9c0">
</p>

Recently the design and the standardization of Multi-Party Threshold Schemes
received much more interest, even from [NIST](https:// nvlpubs.nist.gov/nistpubs/ir/2020/NIST.IR.8214A.pdf), since the can be used, for example, to enable a more *fine-grained control* of secret assets, to perform *Secure Multi-Party Computation* and to improve *Distributed Ledger Technologies*.

## Group Actions

For any group action $\star : G \times X \to X$ we can always define a digital signature via a non interactive proof of knowledge of a secret *linking* group element $g$ such that $g \star x = y$, where $x,y$ is our public key. The simple idea can be summarized by the diagram
<p align="center">
<img width="316" alt="image" src="https://github.com/giacomoborin/giacomoborin.github.io/assets/64214430/3d642681-1b84-434f-a6dd-2372f06b2b35">
</p>
The core idea of the $\Sigma$ protocol is that the verifier produces a new ephemeral set element $\tilde{x} = \tilde{g}\star x$, then showing *or* the full black arrow ($\tilde{g}$) *or* the gray dashed one ($\tilde{g}g^{-1}$), but *never* both of them together.   

When considering the exponentiation on a cyclic group we get the core idea behind the Schnorr signature, however, luckily for post-quantum cryptography, several new group actions are emerging from which we can also define digital signatures, for example from isogenies of ellyptic curves or equivalence of linear codes or tensors. 

### MPC of a Group Action
It is clear that multiple parties having access to additive shares $x_1,x_2,...,x_N$ of $x = \sum x_i$ can compute the exponentiation $g^x$ by multiplying the exponentiation of their shares $g^{x_1} \cdot g^{x_2} \cdots g^{x_N} = g^{\sum x_i}$. This idea can be adapted to use also any kind of LSSS. 
It is folklore that using multiplicative shares $ g = g_1 \cdot g_2 \cdots g_N$ we can do the same with any group actions:

$$ x \xrightarrow{g_1 \ \star} {x}_1 \xrightarrow{{g}_2 \ \star} \ldots \xrightarrow{{g}_N \ \star} {x}_N = y \ ,$$

note that the computations are sequential and if $G$ is **non-commutative** the order matters. This procedure can be employed, for example, to obtain a **Distributed Key Generation** for $\star$ between $N$ users.

# Contributions
In this work, we show that isomorphism problems which stem from cryptographic group actions, can be viable building blocks for threshold signature schemes. In particular, we construct a full $N$-out-of-$N$ threshold signature scheme, and discuss the efficiency issues arising from extending it to the generic $T$-out-of-$N$ case. 

For *abelian* group actions (i.e. CSIFiSh and SCALLOP as of today) the community already explored several combinations of techniques to obtain secure distributed key and signature generation, however the protocols employed usually strongly rely in the commutativity of the group or make the resulting primitive mostly unpractical because of eccessive use of NIZKPs.

## The Non-Abelian Case
In the paper we showed how the core ideas of multiparty computation can still be used to define a threshold scheme, in fact the triangular diagram from before can still be computed by multiple users in a recursive flavour:
<p align="center">
<img width="615" alt="image" src="https://github.com/giacomoborin/giacomoborin.github.io/assets/64214430/c9dc3255-92b3-4191-8097-142e5e968557">
</p>

## Security of the Scheme
We showed that:
* a secure Distributed Key Generation can be achieved by adapting known *ad-hoc* crafted ZKPs, but this requires an additional security assumption;
* by using some additional rounds and secure randomness (also called salt) we can achieve security against malicious users without intensive ZKPs;
* also this additional randomness can be used to prove the security in the QROM model.

Finally by using *Replicated Secret Sharing* we can render the protocol $T$-out of-$N$.

## Instantiations
To give a practical outlook on our constructions, we instantiate them with the LESS and MEDS frameworks, which are two flavors of code-based cryptographic group actions. 


