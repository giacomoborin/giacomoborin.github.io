import numpy as np
import matplotlib.pyplot as plt
import math

from PIL import Image
import os

# Parameters
frame_duration_ms = 200  # duration per frame in milliseconds

CMAP = 'viridis'
TEXT_COLOR = 'white'
DURATION = 5
CORRECTION = 0.2
EXPORT = False

if EXPORT: # Create a folder to store frames
    os.makedirs("frames", exist_ok=True)


def gram_schmidt(B):
    """Performs Gram-Schmidt orthogonalization on a matrix B."""
    n = B.shape[1]
    B_star = np.zeros_like(B, dtype=np.float64)
    mu = np.zeros((n, n), dtype=np.float64)

    for i in range(n):
        B_star[:, i] = B[:, i]
        for j in range(i):
            mu[i, j] = np.dot(B[:, i], B_star[:, j]) / np.dot(B_star[:, j], B_star[:, j])
            B_star[:, i] -= mu[i, j] * B_star[:, j]

    return B_star, mu

def LLL_with_out(matrix, delta=0.75, duration=DURATION):

    val_max = np.max(np.abs(matrix))
    # compute the delay based on the number of iterations
    expected_iterations = math.log(val_max, 1/delta) * matrix.shape[0]**2
    delay = duration / expected_iterations
    # Create the plot
    plt.ion()  # Turn on interactive mode
    fig, ax = plt.subplots()


    # Create a custom colormap: white (low) to black (high)

    B = np.array(matrix).T # Each column is a basis vector
    print("Original basis:")
    print(B.T)
    # Display the initial matrix
    # img = ax.imshow(np.log(abs(B)), cmap='Grays', vmin=0, vmax=np.log(val_max))
    img = ax.imshow(abs(B)**CORRECTION, cmap=CMAP, vmin=0, vmax=val_max**CORRECTION)

    plt.axis('off')
    text_objects = []
    # Add the integer values on top of each cell
    for (x, y), value in np.ndenumerate(B):
        # Optional: auto contrast-aware text color
        if value == 0.0:
            t = ax.text(y, x, '', ha='center', va='center', color=TEXT_COLOR, fontweight='bold')
        else:
            t = ax.text(y, x, str(value), ha='center', va='center', color=TEXT_COLOR, fontweight='bold')
        text_objects.append(t)

    plt.title("LLL Reduction")
    plt.colorbar(img)

    """Performs the LLL lattice basis reduction on matrix B."""
    B = B.astype(np.float64)
    n = B.shape[1]
    B_star, mu = gram_schmidt(B)
    k = 1

    num_it = 0
    
    while k < n:
        if EXPORT:
            filename = f"frames/frame_{num_it:03d}.png"
            plt.savefig(filename, bbox_inches='tight')            
        # Lenght reduction
        for j in reversed(range(k)):
            q = round(mu[k, j])
            if q != 0:
                B[:, k] -= q * B[:, j]
                B_star, mu = gram_schmidt(B)

        # Lovász condition
        lhs = np.dot(B_star[:, k], B_star[:, k])
        rhs = (delta - mu[k, k - 1]**2) * np.dot(B_star[:, k - 1], B_star[:, k - 1])
        if lhs >= rhs:
            k += 1
        else:
            # Swap B_k and B_{k-1}
            B[:, [k, k - 1]] = B[:, [k - 1, k]]
            B_star, mu = gram_schmidt(B)
            k = max(k - 1, 1)
    
        plt.title(f"LLL Reduction (Iteration {num_it}, k={k})")
        # Remove old text labels
        for t in text_objects:
            t.remove()
        text_objects.clear()

        # Add the integer values on top of each cell
        img.set_data(abs(B.T)**CORRECTION)     # Update image data
        for (x, y), value in np.ndenumerate(B.T):
            if value == 0.0:
                t = ax.text(y, x, '', ha='center', va='center', color=TEXT_COLOR, fontweight='bold')
            else:
                if value.round() == value:
                    value = int(value)
                t = ax.text(y, x, str(value), ha='center', va='center', color=TEXT_COLOR, fontweight='bold')
            text_objects.append(t)
        num_it += 1

        plt.draw()                 
        plt.pause(delay) 

    print(f"Number of iterations: {num_it}")
    if EXPORT: 
        filename = f"frames/frame_{num_it:03d}.png"
        plt.savefig(filename, bbox_inches='tight')            
    plt.ioff()  # Turn off interactive mode
    plt.show()

    reduced_B = B

    print("Reduced basis:")
    print(reduced_B.T)
    return reduced_B.T, num_it

def gen_matrix(pk,chypher_text, sol_type):
    if sol_type == 0:
        matrix = np.matrix(
                [ [0]*len(pk) + [pk[i]] for i in range(len(pk)) ] +
                [ [0]*len(pk) + [-cypher_text] ]
                )
    elif sol_type == 1:
        N = 1
        matrix = np.matrix(
                [ [0]*len(pk) + [N * pk[i]] for i in range(len(pk)) ] +
                [ [1/2]*len(pk) + [cypher_text  * N] ]
                )
    for i in range(0, len(pk)):
        matrix[i, i] = 1
    return matrix

def get_solution(pk, cypher_text, out, sol_type):
    if sol_type == 0:
        print("Solution:")
        for j in range(len(pk) + 1):
            if all([ o in [0.0,1.0] for o in out[ j,:] ]):
                if sum(pk[i] for i in range(len(pk)) if out[j, i] == 1) == cypher_text:
                    print("Found solution:")
                    for i in range(len(pk)):
                        if out[j, i] != 0:
                            print(f"{pk[i]} + ", end="")
                    print(f"= {cypher_text}")
    elif sol_type == 1:
        print("Solution:")
        for j in range(len(pk) + 1):
            if all([ o in [0.5,-0.5, 0] for o in out[ j,:] ]):
                if sum(pk[i] for i in range(len(pk)) if out[j, i] == -0.5) == cypher_text:
                    print("Found solution:")
                    for i in range(len(pk)):
                        if out[j, i] != 0.5:
                            print(f"{pk[i]} + ", end="")
                    print(f"= {cypher_text}")

if __name__ == "__main__":
    # Knapsack instance
    # pk = [430, 138, 495, 49, 463, 196, 165]
    # cypher_text =  + 942
    pk = [2381, 1094, 2188, 2442, 2280, 1129, 1803, 2259, 1665]
    cypher_text = 7598
    sol_type = 1

    matrix = gen_matrix(pk, cypher_text, sol_type)

    out,num_frames = LLL_with_out(matrix, delta=0.75, duration = 10)
    
    if EXPORT:
        # Load saved frames and create GIF
        frames = [Image.open(f"frames/frame_{i:03d}.png") for i in range(num_frames+1)]
        gif_path = "matrix_animation.gif"
        frames[0].save(
            gif_path,
            save_all=True,
            append_images=frames[1:],
            duration=frame_duration_ms,
            loop=0
        )

        print(f"GIF saved to {gif_path}")

    get_solution(pk, cypher_text, out, sol_type)
    




