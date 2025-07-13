---
title: "Cutting the GRASS: Threshold GRoup Action Signature Schemes"
collection: publications
permalink: /publication/2023-cutting-grass
excerpt: 'Threshold signature from generic group action derived signatures'
date: 2023-06-07
venue: '<i>CT-RSA 2024</i>'
paperurl: 'https://eprint.iacr.org/2023/859'
citation: 'Michele Battagliola, Giacomo Borin, Alessio Meneghetti, and Edoardo Persichetti. "Cutting the GRASS: Threshold GRoup Action Signature Schemes." <i> CT-RSA 2024</i>.'
authors: 'M. Battagliola, G. Borin, A. Meneghetti, E. Persichetti'
layout: default
doi: https://doi.org/10.1007/978-3-031-58868-6_18
---

The paper is a joint work with Michele Battagliola, Alessio Meneghetti and Edoardo Persichetti; it can be [downloaded here](https://eprint.iacr.org/2023/859) and it has been published and presented at [*CT-RSA 2024*](https://www.rsaconference.com/library/presentation/usa/2024/threshold%20signatures%20and%20fault%20attacks). We proceed here with a brief summary of the main points.

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

When considering the exponentiation on a cyclic group we get the core idea behind the Schnorr signature, however, luckily for post-quantum cryptography, several new group actions are emerging from which we can also define digital signatures, for example from isogenies of ellyptic curves or equivalence of linear codes or tensors. More on the design of these signatures can be read [here](https://giacomoborin.github.io/publication/2024-03-09-grass).

### MPC of a Group Action
It is clear that multiple parties having access to additive shares $x_1,x_2,...,x_N$ of $x = \sum x_i$ can compute the exponentiation $g^x$ by multiplying the exponentiation of their shares $g^{x_1} \cdot g^{x_2} \cdots g^{x_N} = g^{\sum x_i}$. This idea can be adapted to use also any kind of LSSS. 
It is folklore that using multiplicative shares $ g = g_1 \cdot g_2 \cdots g_N$ we can do the same with any group actions:

$$ x \xrightarrow{g_1 \ \star} {x}_1 \xrightarrow{g_2 \ \star} \ldots \xrightarrow{ g_N \ \star } {x}_N = y \ ,$$

note that the computations are sequential and if $G$ is **non-commutative** the order matters. This procedure can be employed, for example, to obtain a **Distributed Key Generation** for $\star$ between $N$ users.

# Contributions
In this work, we show that isomorphism problems which stem from cryptographic group actions, can be viable building blocks for threshold signature schemes. In particular, we construct a full $N$-out-of-$N$ threshold signature scheme, and discuss the efficiency issues arising from extending it to the generic $T$-out-of-$N$ case. 

For *abelian* group actions (i.e. CSIFiSh and SCALLOP as of today) the community already explored several combinations of techniques to obtain secure [distributed key](https://doi.org/10.1007/978-3-030-81293-5_14) and [signature](https://doi.org/10.1007/978-3-030-44223-1_10) [generation](https://doi.org/10.1007/978-3-030-45388-6_7), however the protocols employed usually strongly rely in the commutativity of the group or make the resulting primitive mostly unpractical because of eccessive use of NIZKPs.

## The Non-Abelian Case
In the paper we showed how the core ideas of multiparty computation can still be used to define a threshold scheme, in fact the triangular diagram from before can still be computed by multiple users in a recursive flavour:
<p align="center">
<img width="615" alt="image" src="https://github.com/giacomoborin/giacomoborin.github.io/assets/64214430/c9dc3255-92b3-4191-8097-142e5e968557">
</p>

This natural and naive $N$-out-of-$N$ scheme can be rendered to an $T$-out of-$N$ threshold protocol by using *Replicated Secret Sharing*. This create a clear trade off between the simplicity of the construction and an exponential increase of communication cost between the parties. However, since the most important use cases like $(2,3)$ or $(3,5)$ have small $T,N$, we still get efficient threshold signatures. 


## Security of the Scheme
With respect to this we showed that a secure **Distributed Key Generation** can be achieved by adapting known *ad-hoc* crafted ZKPs, but this requires to send two parallel pairs of elements:
$$ x_1 \xrightarrow{g \ \star} {y}_1 \text{ and } x_2 \xrightarrow{g \ \star} {y}_2 \ ;$$
so we require as additional security assumption that this additional pair does not help the recover of the secret $g$.   

*Remark*: recently it has been showed that for some particular instances of hamming code equivalence for specific choice of parameters this addidiotional pair can be used to recover the secret monomial map, however in the appendix we proposed a possible workaround, even if this new technique need further inspections.  

With respect to the **Signature Generation** by using some additional rounds and secure randomness (also called `salt`) we can achieve security against malicious users without intensive ZKPs, differently from previous research directions. 
Also, as an interesting corollary, this additional randomness can be used to prove the security in the QROM model.

## Instantiations
To give a practical outlook on our constructions, we instantiate them with the LESS and MEDS frameworks, which are two flavors of code-based cryptographic group actions. Also we showed that almost all the optimizations already proposed for the signatures can be adapted also to the multiparty case, gaining usable and efficient schemes. As a proof of concept we report here the results in $\mathsf{KiB}$ and $\mathsf{MiB}$ for the thresholdization of MEDS (parameters from [version 1.1](https://www.meds-pqc.org/spec/MEDS-2023-07-26.pdf)):

| Case  | Variant | $t$ | $\omega$ | $r$ | $\mathsf{pk}$ size  | $\mathsf{sig}$ size | Exc. cost  |
|-------------------------------------------|-------------------------|-------|----------|-----|----------------------------------|-----------------------------------|--------------------------------|
| MEDS-13220                                | Fixed+Multibit | 192   | 20       | 5   | 13.2                             | 13.0                              | -                              |
| (2,3)                                     | Fixed+Multibit | 291   | 19       | 4   | 11.26                            | 14.49                             | 3.24                           |
| (3,5)                                     | Fixed+Multibit | 113   | 22       | 6   | 18.76                            | 20.80                             | 4.34                           |
| $(\circ,\circ)$   | Multibit       | -     | -        | 8   | 26.24    | 24.74   | $\binom{N}{T-1} 0.182 $          |
| Section 8 of MEDS specs      | Multibit                       | -     | -        | 3   | 7.50                             | 3.37                              | $\binom{N}{T-1} 0.342$          |



