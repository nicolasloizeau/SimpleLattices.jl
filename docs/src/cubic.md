

# Cubic Lattice

Build a cubit lattice:
```@example cubic
using CairoMakie
using SimpleLattices
L = CubicLattice(2, 3, 4, true, true, true)
```

Get the edges of the lattice:
```@example cubic
edges(L)
```

Plot the lattice:
```@example cubic
plot_lattice(L)
```
