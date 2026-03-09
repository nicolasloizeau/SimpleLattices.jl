# SimpleLattices

<!--[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://nicolasloizeau.github.io/SimpleLattices.jl/stable/)-->
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://nicolasloizeau.github.io/SimpleLattices.jl/dev/)
[![Build Status](https://github.com/nicolasloizeau/SimpleLattices.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nicolasloizeau/SimpleLattices.jl/actions/workflows/CI.yml?query=branch%3Amain)


This is a package for constructing lattices in Julia.

## Installation

```julia
using Pkg
Pkg.add(url="https://github.com/nicolasloizeau/SimpleLattices.jl")
```

## Usage

Standard lattices constructors are provided : [`SquareLattice`](https://nicolasloizeau.github.io/SimpleLattices.jl/dev/square/), [`CubicLattice`](https://nicolasloizeau.github.io/SimpleLattices.jl/dev/cubic/), [`TriangularLattice`](https://nicolasloizeau.github.io/SimpleLattices.jl/dev/triangular/), [`HexagonalLattice`](https://nicolasloizeau.github.io/SimpleLattices.jl/dev/hexagonal/) and [`KagomeLattice`](https://nicolasloizeau.github.io/SimpleLattices.jl/dev/kagome/). Custom lattices can be constructed using [`UnitCell`](https://nicolasloizeau.github.io/SimpleLattices.jl/dev/custom/).


Example: Construct a hexagonal lattice with 3*4 cells and periodic boundary conditions along the x-axis, and plot it:

```julia
using CairoMakie # for plotting
using SimpleLattices

lattice = HexagonalLattice(4,5; periodic=(true, false))

println(positions(lattice))
println(edges(lattice))

fig = plot_lattice(lattice)
display(fig)
```
```julia
[(0.0, 0.0), (0.5, 0.28867513459481287), (0.5, 0.8660254037844386), (1.0, 1.1547005383792515), (1.0, 1.7320508075688772), (1.5, 2.02072594216369), (1.5, 2.598076211353316), (2.0, 2.886751345948129), (2.0, 3.4641016151377544), (2.5, 3.7527767497325675), (1.0, 0.0), (1.5, 0.28867513459481287), (1.5, 0.8660254037844386), (2.0, 1.1547005383792515), (2.0, 1.7320508075688772), (2.5, 2.02072594216369), (2.5, 2.598076211353316), (3.0, 2.886751345948129), (3.0, 3.4641016151377544), (3.5, 3.7527767497325675), (2.0, 0.0), (2.5, 0.28867513459481287), (2.5, 0.8660254037844386), (3.0, 1.1547005383792515), (3.0, 1.7320508075688772), (3.5, 2.02072594216369), (3.5, 2.598076211353316), (4.0, 2.886751345948129), (4.0, 3.4641016151377544), (4.5, 3.7527767497325675), (3.0, 0.0), (3.5, 0.28867513459481287), (3.5, 0.8660254037844386), (4.0, 1.1547005383792515), (4.0, 1.7320508075688772), (4.5, 2.02072594216369), (4.5, 2.598076211353316), (5.0, 2.886751345948129), (5.0, 3.4641016151377544), (5.5, 3.7527767497325675)]
[[1, 2], [1, 32], [3, 4], [3, 34], [2, 3], [5, 6], [5, 36], [4, 5], [7, 8], [7, 38], [6, 7], [9, 10], [9, 40], [8, 9], [11, 12], [2, 11], [13, 14], [4, 13], [12, 13], [15, 16], [6, 15], [14, 15], [17, 18], [8, 17], [16, 17], [19, 20], [10, 19], [18, 19], [21, 22], [12, 21], [23, 24], [14, 23], [22, 23], [25, 26], [16, 25], [24, 25], [27, 28], [18, 27], [26, 27], [29, 30], [20, 29], [28, 29], [31, 32], [22, 31], [33, 34], [24, 33], [32, 33], [35, 36], [26, 35], [34, 35], [37, 38], [28, 37], [36, 37], [39, 40], [30, 39], [38, 39]]
```



![hex lattice](example.png)
