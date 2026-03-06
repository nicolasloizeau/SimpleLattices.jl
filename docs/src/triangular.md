
# Triangular Lattice

Build a triangular lattice with periodic boundary conditions in the x direction and open boundary conditions in the y direction:
```@example ex1
using CairoMakie
using SimpleLattices
L = TriangularLattice(7, 5; periodic=(true, false))
```

Get the edges of the lattice:
```@example ex1
edges(L)
```

Plot the lattice:
```@example ex1
plot_lattice(L)
```
