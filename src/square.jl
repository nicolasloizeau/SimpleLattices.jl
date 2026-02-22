
struct SquareLattice <: AbstractLattice2D
    Nx::Int
    Ny::Int
    xperiodic::Bool
    yperiodic::Bool
end


"""
    SquareLattice(Nx::Int, Ny::Int; xperiodic::Bool=false, yperiodic::Bool=false)

Create a square lattice with `Nx` sites in the x-direction and `Ny` sites in the y-direction.
By default, the lattice is not periodic in either direction. Set `xperiodic=true` or `yperiodic=true` to make it periodic in the respective direction.
"""
SquareLattice(Nx::Int, Ny::Int; xperiodic::Bool=false, yperiodic::Bool=false) = SquareLattice(Nx, Ny, xperiodic, yperiodic)

Base.length(lattice::SquareLattice) = lattice.Nx * lattice.Ny
Base.size(lattice::SquareLattice) = (lattice.Nx, lattice.Ny)

function positions(lattice::SquareLattice)
    Nx, Ny = lattice.Nx, lattice.Ny
    return vec([(x, y) for x in 0:Nx-1, y in 0:Ny-1])
end

function sites(lattice::SquareLattice)
    return collect(1:lattice.Nx * lattice.Ny)
end

function edges(lattice::SquareLattice)
    pos = positions(lattice)
    pos_dict = Dict(p => i for (i, p) in enumerate(pos))
    edges = []
    for y in 0:lattice.Ny-1
        for x in 0:lattice.Nx-2
            push!(edges, (pos_dict[(x, y)], pos_dict[(x+1, y)]))
        end
    end
    for x in 0:lattice.Nx-1
        for y in 0:lattice.Ny-2
            push!(edges, (pos_dict[(x, y)], pos_dict[(x, y+1)]))
        end
    end
    if lattice.xperiodic
        for y in 0:lattice.Ny-1
            push!(edges, (pos_dict[(lattice.Nx-1, y)], pos_dict[(0, y)]))
        end
    end
    if lattice.yperiodic
        for x in 0:lattice.Nx-1
            push!(edges, (pos_dict[(x, lattice.Ny-1)], pos_dict[(x, 0)]))
        end
    end
    return edges
end
