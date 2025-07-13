# Author : Giacomo Borin
# Course : Advanced Number Theory

####### Weil and Tate pairings #######

def embedding_degree(q,r):
    r"""
    Return the embedding degree of `q` over `l`
    
        INPUT:

        - ``q`` -- a positive prime

        - ``l`` -- a positive integer
        
        OUTPUT:

        An integer.
        Return an error if `q` is not prime
    """
    if q.is_prime():
        for k in NN:
            if (q**k -1)%r == 0 and k != 0:
                return k
    else:
        raise ValueError('%s is not prime' % q)

def v_line_for(P,VAL):
    r"""
    Return the value of the vertical line passing through P on the point `VAL`
    
        INPUT:

        - ``P`` -- a point on the elliptic curve
        
        - ``VAL`` -- another point on the elliptic curve for the evaluation of the function

        OUTPUT:

        An element in the base field of the Elliptic curve
    """
    E = P.curve()
    # case for the trivial line
    if P == E(0):
        return 1
    else: 
        return VAL[0]-P[0]

def line_for(P,Q,VAL):
    r"""
    Return the value of the line through P and Q on the point `VAL`
    
        INPUT:

        - ``P,Q`` -- two points on the elliptic curve
        
        - ``VAL`` -- another point on the elliptic curve for the evaluation of the function

        OUTPUT:

        An element in the base field of the Elliptic curve
    """
    E = P.curve()
    if P != Q:
        # first two cases are the ones with a vertical one
        # observe that the situation with P and Q both zero is only possible in the last else
        if Q == E(0) or P+Q == E(0):
            return v_line_for(P,VAL)
        elif P == E(0):
            return v_line_for(Q,VAL)
        #normal case of a line for two distinct points
        else:
            # lam is the angular coefficent of the affine line
            lam = (Q[1] - P[1])/(Q[0] - P[0])
            return VAL[1] - P[1] - lam * (VAL[0] - P[0])
    else:
        # case of a vertical line
        # observe that this case absorb the situation of P and Q both zero
        if P[1]==0:
            return v_line_for(P,VAL)
        else:
            # here I recall the coefficent of the curve
            a1, a2, a3, a4, a6 = E.a_invariants()
            # lam is the angular coefficent of the affine line
            # observe that in this case the line is the tangent line to E in P
            lam = (3*P[0]**2 + 2*a2*P[0] + a4 - a1*P[1])/(2*P[1] + a1*P[0] + a3)
            return VAL[1]-P[1] - lam*(VAL[0]-P[0])

def f(m,P,VAL):
    r"""
    Return the value of the function f_m,P on the point `VAL`
    
        INPUT:

        - ``m`` -- a positive integer

        - ``P`` -- a point on the elliptic curve that is not the zero point
        
        - ``VAL`` -- another point on the elliptic curve for the evaluation of the function

        OUTPUT:

        An element in the base field of the Elliptic curve
    """
    # errors
    if P == E(0):
        raise ValueError('P is the zero point')
    # base case (trivial function)
    if m == 1:
        return 1
    else:
        # induction
        f_m1 = f(m-1,P,VAL)
        # lines
        q1 = line_for((m-1)*P,P,VAL)
        q2 = v_line_for(m*P,VAL)
        return f_m1 * q1 / q2

def fm(m,P,VAL):
    r"""
    Return the value of the function f_m,P on the point `VAL` using a more efficent implementation
    
        INPUT:

        - ``m`` -- a positive integer

        - ``P`` -- a point on the elliptic curve that is not the zero point
        
        - ``VAL`` -- another point on the elliptic curve for the evaluation of the function

        OUTPUT:

        An element in the base field of the Elliptic curve
    """
    # errors
    if P == E(0):
        raise ValueError('P is the zero point')
    # a simple function that evaluate l(P,Q)/v(P+Q)
    def v_hm(P,Q,VAL):
        return line_for(P,Q,VAL)/v_line_for(P+Q,VAL)
    # T assignation
    T = P
    # base case
    fm = 1
    # write m in base 2
    mbits = m.bits()
    mbits.reverse()
    # intresting part
    for i in range(1,len(mbits)):
        # 'Doubling' of the function
        fm = (fm**2) * v_hm(T,T,VAL)
        # Doubling of the point
        T = 2*T
        if mbits[i]==1:
            # correction part necessary for the 1 bits
            fm = fm * v_hm(T,P,VAL)
            T = T + P
    return fm

def b_weil_pairing(P1,Q1,r):
    r"""
        Compute the Weil pairing of P1 and Q1 using a random point to assist the evaluation

        INPUT:

        - ``P1,Q1`` -- two points on the same elliptic curve.

        - ``r`` -- a positive integer such that P1 and Q1 are of r-torsion

        OUTPUT:

        An `r`'th root of unity in the base field of the Elliptic curve
    """
    # check the errors
    if r*P1 != E(0):
        raise ValueError('The first point is not of %s-torsion' % r)
    if r*Q1 != E(0):
        raise ValueError('The second point is not of %s-torsion' % r)
    # case for (0:1:0)
    if P1 == E(0) or Q1 == E(0):
        return 1
    # interesting case
    while True:
        try:
            # This part is necessary to find a S necessary to evaluate the function on 
            # the divisors (Q)-(O) and (P)-(O)
            # In fact we want a point S such that S, Q1+S are not in the support of f_P1 and 
            # -S,Q1+S are not in the support of f_Q1 
            S = E.random_element()
            while S in [E(0) , P1 , -Q1 , P1-Q1]:
                S = E.random_element()
            # evaluation of the pairing
            num = f(r,P1,Q1+S)*f(r,Q1,-S)
            den = f(r,Q1,P1-S)*f(r,P1,S)
            # uncomment for a more efficent implementetion with miller's algorithm
            # num = fm(r,P1,Q1+S)*fm(r,Q1,-S)
            # den = fm(r,Q1,P1-S)*fm(r,P1,S)
            return num/den 
        except ZeroDivisionError:
            # this try catch is necessary in the case that during the evaluation of f we get a division by zero
            # for example if S is [j]P1 or -[j]P1 with 0 < j < l (very rare)
            print('Error',S)  

def b_tate_pairing(P1,Q1,r,k):
    r"""
        Compute the Tate pairing of P1 and Q1 using a random point to assist the evaluation

        INPUT:

        - ``P1,Q1`` -- two points on the same elliptic curve.

        - ``r`` -- a positive integer `r` such that P1 is of r-torsion
        
        - ``k`` -- the embedding degree of r (positive integer)

        OUTPUT:

        A unique element in the base field of the Elliptic curve
    """
    # errors
    if r*P1 != E(0):
        raise ValueError('The first point is not of %s-torsion' % r)
    if P1 == E(0) or Q1 == E(0):
        return 1
    while True:
        try:
            # This part is necessary to find a S necessary to evaluate the function on the divisor (Q)-(O)
            # In fact we want a point S such that S and Q1+S are not in the support of f_P1
            S = E.random_element()
            while (S in [E(0) , P1 , -Q1 , P1-Q1]):
                S = E.random_element()
            # here we evaluate f_P on (Q1+S) - (S) ~  (Q1) - (O)
            d = f(r,P1,Q1 + S) / f(r,P1,S)
            # uncomment for a more efficent implementetion with miller's algorithm
            # d = fm(r,P1,Q1 + S) / fm(r,P1,S)
            # we raise d to the power (q**k - 1)/r to get a unique result, but it is not necessary
            d = d ** ((q**k - 1)/r)
            return d
        except ZeroDivisionError:
            # this try catch is necessary in the case that during the evaluation of f we get a division by zero
            # for example if S is [j]P1 or -[j]P1 with 0 < j < l (very rare)
            print('Error',S)    


