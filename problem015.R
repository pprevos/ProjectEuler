## Project Euler 15: Lattice Paths
# Define lattice
nLattice <- 2
lattice = matrix(ncol = nLattice + 1, nrow = nLattice + 1)

# Boundary conditions
lattice[nLattice + 1, -(nLattice + 1)] <- 1
lattice[-(nLattice + 1), nLattice + 1] <- 1

# Calculate Pathways
for (i in nLattice:1) {
    for (j in nLattice:1) {
        lattice[i,j] <- lattice[i+1, j] + lattice[i, j+1]
    }
}
answer <- lattice[1,1]
print(answer)
