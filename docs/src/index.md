```@meta
CurrentModule = SimpleLattices
```

# SimpleLattices

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://nicolasloizeau.github.io/SimpleLattices.jl/stable/)
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

```@example
using CairoMakie # for plotting
using SimpleLattices
lattice = HexagonalLattice(4,5; periodic=(true, false))
println(positions(lattice))
println(edges(lattice))
plot_lattice(lattice)
```

```@index
```

```@autodocs
Modules = [SimpleLattices]
```
