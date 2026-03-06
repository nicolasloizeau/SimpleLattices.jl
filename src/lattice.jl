

"""
    UnitCell{D}

A unit cell in D dimensions, defined by its lattice vectors, the positions of the sites within the unit cell, and the edges connecting the sites.
"""
struct UnitCell{D}
    vectors::NTuple{D, NTuple{D, Float64}}
    sites::Vector{NTuple{D, Float64}}
    edges::Vector{Tuple{Int, NTuple{D, Int}, Int}}
end


struct Lattice{D}
    cell::UnitCell{D}
    size::NTuple{D, Int}
    periodicity::NTuple{D, Bool}
end

function Lattice(cell::UnitCell{D}, size::NTuple{D, Int}; periodic=NTuple{D, Bool} = ntuple(_ -> false, D)) where {D}
    @assert length(size) == D "Size must have the same dimension as the unit cell"
    @assert length(periodic) == D "Periodicity must have the same dimension as the unit cell"
    @assert D==2 || D==3 "Only 2D and 3D lattices are supported"
    @assert D==2 || periodic == (false, false, false) "periodic boundaries are not supported for 3D lattices yet"
    return Lattice{D}(cell, size, periodic)
end

Base.size(lattice::Lattice) = lattice.size
Base.length(lattice::Lattice) = length(lattice.cell.sites) * prod(lattice.size)
