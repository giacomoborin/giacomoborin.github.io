# Threshold Signatures from Group Actions

Here we present a simple summary of the of the relevant material to understand to have an overview and good understanding of the literature of threshold signatures from cryptographic group actions.

For the moment it is out of the scope of this document to provide complete 
overview, but instead want to guide the reader through the most relevant papers 
and concepts to understand the current state of the art in this area (clearly 
these are personal opinions).

We assume the reader is familiar with the basic concepts of threshold signatures 
and group actions.
A brief and crude introduction can be read in [this blog 
post](https://giacomoborin.github.io/publication/2023-cutting-grass).

For the exposition we follow the slides of the talk given by myself at Lleida.
Slides can be found 
[here](https://giacomoborin.github.io/files/slides/20250430-sqiparty-threshold-grasss-handout.pdf).

With respect to group actions, we refer to [2020/1188](https://eprint.iacr.org/2020/1188), that provides a 
systemization of the principal definitions. For us we consider different types 
of group actions, and we categorize them with respect to the acting group being:

1. Cyclic, like [CsiFish](https://eprint.iacr.org/2019/498). 
2. Abelian, like [PEGASIS](https://eprint.iacr.org/2025/401) (technically the group is likely to be cyclic, but computing the order is out of reach for current technology). The only know group actions in these two previous categories are derived from the theory of class groups acting as isogenies on a set of elliptic curves.
3. Non-abelian, to our knowledge the more relevant are the ones used in [LESS](https://www.less-project.com/), [MEDS](https://www.meds-pqc.org/) and ALTEQ.

Clearly when the group is abelian we have more freedom in our construction, 
however these group actions are much harder to instantiate efficiently for 
higher security levels with respect to the non-abelian ones.
With respect to group action based threshold signatures, we consider more 
relevant the following papers:

1. [2019/1288](https://eprint.iacr.org/2019/1288) - L De Feo, M Meyer *Threshold Schemes from Isogeny Assumptions*. It is the first paper in the area and works only for the case of cyclic groups. The construction is based on the CsiFish. This scheme is only secure against *honest-but-curious* adversaries. 
2. [2019/1360](https://eprint.iacr.org/2019/1360) - Cozzo D, Smart NP. *Sashimi: cutting up CSI-FiSh secret keys to produce an actively secure distributed signing protocol*. The scheme in this paper works for any abelian group and is actively secure, however it requires to add a large amount of non-interactive zero-knowledge proofs, making the scheme inefficient.
3. [2023/859](https://eprint.iacr.org/2023/859) - Battagliola M, Borin G, Meneghetti A, Persichetti E. *Cutting the grass: Threshold group action signature schemes*. Probably the simpler to understand, since it works for any group actions. Notably the security is proven without using zero-knowledge proofs during the signing.
A follow up that improves the sharing is [2025/085](https://eprint.iacr.org/2025/085), making the number of rounds independent of the number of parties, but only of the threshold. 

Recent developments in the field of isogeny-based cryptography made it possible to instantiate isogeny-based group actions (thus threshold signatures) in more efficient ways.
We personally expect to be able to combine the results of the previous papers to get a concrete scheme (as speculated at the end of the slides). We plan to study that option soon.

Other relevant papers (but not essential for understanding the previous ones) 
are:
1. Atapoor S, Baghery K, Cozzo D, Pedersen R. *CSI-SharK: CSI-FiSh with
sharing-friendly keys.* DKG protocol for the scheme in [2019/1288](https://eprint.iacr.org/2019/1288). Require an additional assumption for efficiency.
2. Frixons P, Gilchrist V, Kutas P, Merz SP, Petit C. *Another Look at the Quantum Security of the Vectorization Problem with Shifted Inputs.*. Partially breaks the previous assumption.
3. F Campos, P Muth. *On actively secure fine-grained access structures from isogeny assumptions*. This paper shows how to get active security for the scheme in [2019/1288](https://eprint.iacr.org/2019/1288). Still it uses zero-knowledge proofs, and the number of rounds is twice the threshold parameter.

---------------
Giacomo Borin
