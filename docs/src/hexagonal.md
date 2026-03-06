
# Hexagonal Lattice

Build a hexagonal lattice with periodic boundary conditions :
```@example ex1
using CairoMakie
using SimpleLattices
L = HexagonalLattice(3, 4; periodic=(true, true))
```

Get the edges of the lattice:
```@example ex1
edges(L)
```

Plot the lattice:
```@example ex1
plot_lattice(L)
```
