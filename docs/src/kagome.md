
# Kagome Lattice

Build a Kagome lattice with open boundary conditions :
```@example ex1
using CairoMakie
using SimpleLattices
L = KagomeLattice(4, 5; periodic=(false, false))
```

Get the edges of the lattice:
```@example ex1
edges(L)
```

Plot the lattice:
```@example ex1
plot_lattice(L)
```
