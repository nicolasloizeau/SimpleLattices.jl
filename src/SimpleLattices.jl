module SimpleLattices

abstract type AbstractLattice end
abstract type AbstractLattice2D <: AbstractLattice end
abstract type AbstractLattice3D <: AbstractLattice end


include("square.jl")
include("cubic.jl")

export AbstractLattice, AbstractLattice2D, AbstractLattice3D
export SquareLattice
export CubicLattice
export edges, sites, positions

end
