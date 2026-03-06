module SimpleLattices


include("lattice.jl")
include("lattice_types.jl")
include("generator.jl")


"""
    plot_lattice(lattice::Lattice)

Plot the given lattice. Using GLMakie or CairoMakie if available. Returns a figure.
"""
function plot_lattice()
    println("No plotting backend available. Please use GLMakie or CairoMakie to enable plotting.")
end

"""
    plot_positions(lattice::Lattice)
Plot the positions of the sites in the given lattice. Using GLMakie or CairoMakie if available. Returns a figure.
"""
function plot_positions()
    println("No plotting backend available. Please use GLMakie or CairoMakie to enable plotting.")
end



export Lattice, UnitCell
export edges, sites, positions
export plot_lattice
export plot_positions
export site_indexes, site_index
export SQUARE_CELL, CUBIC_CELL, TRIANGULAR_CELL, HEXAGONAL_CELL, KAGOME_CELL
export SquareLattice, CubicLattice, TriangularLattice, HexagonalLattice, KagomeLattice

end
