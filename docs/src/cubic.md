

# Cubic Lattice

Build a cubic lattice:
```@example ex1
using CairoMakie
using SimpleLattices
L = CubicLattice(2, 3, 4)
```

Get the edges of the lattice:
```@example ex1
edges(L)
```

Plot the lattice:
```@example ex1
plot_lattice(L)
```
